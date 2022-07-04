import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/data/model/course_detail/course_detail_model.dart';
import 'package:lms/screen/section_material/section_material_screen.dart';
import 'package:lms/screen/section_video/section_video_view_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/data_converter.dart';

class SectionVideoScreen extends StatefulWidget {
  static const String routeName = '/section_video_screen';
  final CourseDetailDataSection section;
  const SectionVideoScreen({Key? key, required this.section}) : super(key: key);

  @override
  State<SectionVideoScreen> createState() => _SectionVideoScreenState();
}

class _SectionVideoScreenState extends State<SectionVideoScreen> {
  CourseDetailDataSectionMaterial? material;
  List dataTimeline = [];
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    final searchMaterial = widget.section.materials.where((material) => material.type == "VIDEO");

    if (searchMaterial.isNotEmpty) {
      material = searchMaterial.first;
    }

    String url = material?.url ?? "https://www.youtube.com/watch?v=aDm5WZ3QiIE";
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        loop: false,
        autoPlay: true,
      ),
    );

    _youtubeController.addListener(() {
      setState(() {
        final SectionVideoViewModel sectionVideoViewModel =
            Provider.of<SectionVideoViewModel>(context, listen: false);
        sectionVideoViewModel.setRecentPlayingSeconds(
          _youtubeController.value.position.inMilliseconds,
          _youtubeController.value.metaData.duration.inMilliseconds,
        );
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyleWhite);
    });

    super.initState();
  }

  @override
  void deactivate() {
    _youtubeController.pause();

    super.deactivate();
  }

  @override
  void dispose() {
    _youtubeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _youtubeController),
        builder: (context, player) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.black,
              elevation: 3.0,
              leading: Container(
                margin: const EdgeInsets.all(10.0),
                decoration:
                    BoxDecoration(color: colorBlueDark, borderRadius: BorderRadius.circular(50.0)),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Section ${widget.section.id}",
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: colorOrange,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    widget.section.name,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorTextBlue,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              bottom: PreferredSize(preferredSize: const Size(double.infinity, 232), child: player),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: colorGreyLow, width: 3))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, SectionMaterialScreen.routeName,
                          arguments: widget.section);
                    },
                    child: Row(
                      children: [
                        Text(
                          "Read Materi",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: colorTextBlue,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Image.asset("assets/images/arrow_right_circle.png"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Consumer<SectionVideoViewModel>(builder: (context, model, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    player,
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                      child: Text(
                        "Video - ${widget.section.name}",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: colorTextBlue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      lineHeight: 8.0,
                      progressColor: colorBlueDark,
                      backgroundColor: colorBlueDark.withOpacity(.42),
                      percent: model.percentagePlaying / 100,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    if (dataTimeline.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Timeline",
                              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: colorTextBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: dataTimeline.length,
                              itemBuilder: (context, index) {
                                final timeline = dataTimeline[index];

                                return ListTile(
                                  tileColor: colorBlueLight3,
                                  onTap: () {
                                    _youtubeController.seekTo(
                                      DataConverter.convertDuration(timeline?.from ?? "00:00:00"),
                                    );
                                  },
                                  title: Text(
                                    timeline?.name ?? "",
                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                          color: colorTextBlue,
                                        ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        timeline?.from ?? "00:00:00",
                                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                              color: colorTextBlue,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 16.0,
                                      ),
                                      const Icon(
                                        Icons.play_circle_fill_outlined,
                                        color: colorOrange,
                                      )
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      )
                  ],
                );
              }),
            ),
          );
        },
      ),
    );
  }
}

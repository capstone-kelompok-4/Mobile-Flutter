import 'package:flutter/material.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/data/model/my_course_model.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../utils/data_converter.dart';

class SectionVideoScreen extends StatefulWidget {
  static const String routeName = 'section_video_screen';
  final DataMaterialCourse section;
  const SectionVideoScreen({Key? key, required this.section}) : super(key: key);

  @override
  State<SectionVideoScreen> createState() => _SectionVideoScreenState();
}

class _SectionVideoScreenState extends State<SectionVideoScreen> {
  late VideoPlayerController _videoController;
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    String url = widget.section.dataVideo?.url ?? "https://www.youtube.com/watch?v=aDm5WZ3QiIE";
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        loop: false,
        autoPlay: true,
      ),
    );

    _videoController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
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
    _videoController.dispose();

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
              shadowColor: colorBlack,
              elevation: 1.0,
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
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     setState(() {
            //       _videoController.value.isPlaying
            //           ? _videoController.pause()
            //           : _videoController.play();
            //     });
            //   },
            //   child: Icon(
            //     _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
            //   ),
            // ),
            // body: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     if (_videoController.value.isInitialized)
            //       SizedBox(
            //         child: AspectRatio(
            //           aspectRatio: _videoController.value.aspectRatio,
            //           child: VideoPlayer(_videoController),
            //         ),
            //       )
            //   ],
            // ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  player,
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
                          itemCount: widget.section.dataVideo?.timeline.length ?? 0,
                          itemBuilder: (context, index) {
                            final timeline = widget.section.dataVideo?.timeline[index];

                            return ListTile(
                              tileColor: colorBlueDark,
                              onTap: () {
                                _youtubeController.seekTo(DataConverter.parseDuration(
                                    timeline?.from ?? "00h:00m:00s",
                                    separator: ":"));
                              },
                              title: Text(
                                timeline?.name ?? "",
                                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    timeline?.from ?? "00h:00m:00s",
                                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                          color: Colors.white,
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
              ),
            ),
          );
        },
      ),
    );
  }
}

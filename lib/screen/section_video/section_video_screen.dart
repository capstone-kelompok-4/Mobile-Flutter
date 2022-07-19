import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/constants/styles.dart';
import 'package:lms/data/model/course_detail/course_detail_model.dart';
import 'package:lms/data/model/video_youtube/video_youtube_model.dart';
import 'package:lms/screen/section_material/section_material_screen.dart';
import 'package:lms/screen/section_video/section_video_view_model.dart';
import 'package:lms/utils/result_state.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

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
  bool _isSuccessLoadVideo = false;
  bool _isLoadingQuality = false;
  String _groupValue = "";
  late VideoYoutubeData _videoYoutube;
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;

  Future<void> _loadVideoPlayer() async {
    final SectionVideoViewModel sectionVideoViewModel =
        Provider.of<SectionVideoViewModel>(context, listen: false);
    _videoController.dispose();
    _videoController = VideoPlayerController.network(_videoYoutube.url,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..addListener(() {
        sectionVideoViewModel.setRecentPlayingSeconds(
          _videoController.value.position.inMilliseconds,
          _videoController.value.duration.inMilliseconds,
        );
      });
    await _videoController.initialize().then((value) => _videoController.play());

    setChewie();
  }

  void setChewie() {
    if (_chewieController != null) {
      _chewieController!.dispose();
    }
    _chewieController = ChewieController(
      allowedScreenSleep: false,
      allowFullScreen: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
      videoPlayerController: _videoController,
      aspectRatio: 1.7,
      autoPlay: true,
      looping: false,
      zoomAndPan: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: colorOrange,
        bufferedColor: colorOrangeLight,
        handleColor: Colors.white,
        backgroundColor: colorGrey,
      ),
      additionalOptions: (context) => [
        OptionItem(
          onTap: () async {
            final navigatorOption = Navigator.of(context);
            var dialog = await showDialog(
              context: context,
              builder: (context) => StatefulBuilder(
                builder: (context, setDialogState) =>
                    Consumer<SectionVideoViewModel>(builder: (context, model, child) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    title: Center(
                      child: Text(
                        "Select Resolution",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: colorTextBlue,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    contentPadding: EdgeInsets.zero,
                    content: SizedBox(
                      width: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: model.videos.length,
                            itemBuilder: (context, index) {
                              final video = model.videos[index];
                              return RadioListTile(
                                value: video.qualityLabel,
                                groupValue: _groupValue,
                                controlAffinity: ListTileControlAffinity.leading,
                                onChanged: (value) async {
                                  final navigatorDialog = Navigator.of(context);
                                  setState(() {
                                    _groupValue = value as String;
                                    _videoYoutube = video;
                                  });

                                  setDialogState(() {
                                    _isLoadingQuality = true;
                                  });

                                  await _loadVideoPlayer();

                                  setDialogState(() {
                                    _isLoadingQuality = false;
                                  });

                                  navigatorDialog.pop(true);
                                },
                                title: Text(
                                  video.qualityLabel,
                                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                        color: colorTextBlue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              );
                            },
                          ),
                          if (_isLoadingQuality)
                            const LinearProgressIndicator(
                              color: colorOrange,
                              backgroundColor: colorGreyLow,
                            ),
                          const SizedBox(
                            height: 16.0,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );

            if (dialog != null) {
              final status = dialog as bool;

              if (status) {
                navigatorOption.pop();
              }
            }
          },
          iconData: Icons.settings,
          title: "Video Quality",
          subtitle: _groupValue,
        )
      ],
    );
  }

  @override
  void initState() {
    final searchMaterial = widget.section.materials.where((material) => material.type == "VIDEO");

    if (searchMaterial.isNotEmpty) {
      material = searchMaterial.first;
    }

    String initUrl =
        "https://firebasestorage.googleapis.com/v0/b/lms-capstone-alterra.appspot.com/o/loading_circular.mp4?alt=media&token=fd6fe17a-350e-412e-ba3b-e87931edf085";

    _videoController = VideoPlayerController.network(initUrl)
      ..addListener(() {})
      ..setLooping(true)
      ..initialize().then((value) => _videoController.play());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(overlayStyleWhite);
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final SectionVideoViewModel sectionVideoViewModel =
        Provider.of<SectionVideoViewModel>(context, listen: false);
    sectionVideoViewModel
        .getInformationVideo(
      material?.url ?? "https://www.youtube.com/watch?v=aDm5WZ3QiIE",
    )
        .then((value) async {
      if (value) {
        if (sectionVideoViewModel.videos.isNotEmpty) {
          setState(() {
            _isSuccessLoadVideo = true;
            _videoYoutube = sectionVideoViewModel.videos.last;
            _groupValue = _videoYoutube.qualityLabel;
          });

          await _loadVideoPlayer();
        }
      }
    });

    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    _videoController.pause();
    if (_chewieController != null) {
      _chewieController?.pause();
    }

    super.deactivate();
  }

  @override
  void dispose() {
    _videoController.dispose();
    if (_chewieController != null) {
      _chewieController?.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                "Section ${widget.section.number}",
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
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 242),
            child: Consumer<SectionVideoViewModel>(builder: (context, model, child) {
              if (model.state == ResultState.none || model.state == ResultState.loading) {
                return Container(
                  width: double.infinity,
                  height: 242,
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(
                          color: colorOrange,
                          backgroundColor: colorGreyLow,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "Getting url video..",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (model.state == ResultState.error) {
                return Container(
                  width: double.infinity,
                  height: 242,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      "Unable to load video",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                );
              }

              if (_chewieController == null) {
                return Container(
                  width: double.infinity,
                  height: 242,
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircularProgressIndicator(
                          color: colorOrange,
                          backgroundColor: colorGreyLow,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          "Trying to show video",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (!_isSuccessLoadVideo) {
                return AspectRatio(
                  aspectRatio: 1.7,
                  child: VideoPlayer(_videoController),
                );
              }

              return AspectRatio(
                aspectRatio: 1.7,
                child: Chewie(controller: _chewieController!),
              );
            }),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration:
              const BoxDecoration(border: Border(top: BorderSide(color: colorGreyLow, width: 3))),
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
                                // _youtubeController.seekTo(
                                //   DataConverter.convertDuration(timeline?.from ?? "00:00:00"),
                                // );
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
      ),
    );
  }
}

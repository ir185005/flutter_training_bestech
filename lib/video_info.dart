import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_bestech/colors.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
      setState(() {
        videoInfo = jsonDecode(value);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.gradientFirst.withOpacity(0.9),
              AppColor.gradientSecond,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    padding: const EdgeInsets.all(40),
                    //width: MediaQuery.of(context).size.width,
                    height: 200,
                    //color: Colors.red.withOpacity(0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: AppColor.secondPageIconColor,
                              ),
                            ),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: AppColor.secondPageIconColor,
                            ),
                          ],
                        ),
                        Text(
                          'Legs Toning \nand Glutes Workout',
                          style: TextStyle(
                            height: 1.2,
                            fontSize: 20,
                            color: AppColor.secondPageTitleColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor
                                        .secondPageContainerGradient1stColor,
                                    AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.timer_outlined,
                                    size: 20,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                  Text(
                                    ' 68 min',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.secondPageIconColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor
                                        .secondPageContainerGradient1stColor,
                                    AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.handyman_outlined,
                                    size: 20,
                                    color: AppColor.secondPageIconColor,
                                  ),
                                  Text(
                                    ' Resistant band, Kettlebell',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColor.secondPageIconColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: AppColor.secondPageIconColor,
                                ),
                              ),
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: AppColor.secondPageIconColor,
                              ),
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Circuit 1: Legs Toning',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.circuitsColor,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.loop,
                          size: 30,
                          color: AppColor.loopColor,
                        ),
                        Text(
                          ' 3 sets',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColor.setsColor,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: _listView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume ?? 0) > 0;

    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      color: AppColor.gradientSecond,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (noMute) {
                _controller?.setVolume(0);
              } else {
                _controller?.setVolume(1.0);
              }
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.0, 0.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(50, 0, 0, 0),
                    ),
                  ],
                ),
                child: Icon(
                  noMute ? Icons.volume_up : Icons.volume_off,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () async {
              final index = _isPlayingIndex - 1;
              if (index >= 0 && videoInfo.length >= 0) {
                _initializeVideo(index);
              } else {
                Get.snackbar('Video', "No more video to play");
              }
            },
            child: Icon(
              Icons.fast_rewind,
              size: 36,
              color: Colors.white,
            ),
          ),
          FlatButton(
            onPressed: () async {
              if (_isPlaying) {
                setState(() {
                  _isPlaying = false;
                });
                _controller?.pause();
              } else {
                setState(() {
                  _isPlaying = true;
                });
                _controller?.play();
              }
            },
            child: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 36,
              color: Colors.white,
            ),
          ),
          FlatButton(
            onPressed: () async {
              final index = _isPlayingIndex + 1;
              if (index <= videoInfo.length - 1) {
                _initializeVideo(index);
              } else {
                Get.snackbar(
                  'Video',
                  'No more video available',
                  snackPosition: SnackPosition.BOTTOM,
                  icon: const Icon(
                    Icons.face,
                    size: 30,
                    color: Colors.white,
                  ),
                );
              }
            },
            child: const Icon(
              Icons.fast_forward,
              size: 36,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text('Being initialized, please wait.'),
        ),
      );
    }
  }

  var _onUpdateControllerTime;
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint('controller is null');
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint('controller cannot be initialized');
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  _initializeVideo(int index) async {
    final controller =
        VideoPlayerController.network(videoInfo[index]['videoUrl']);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((value) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _onTapVideo(int index) {
    _initializeVideo(index);
  }

  _listView() {
    return ListView.builder(
        itemCount: videoInfo.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      //padding: EdgeInsets.all(10),
      height: 120,
      //color: Colors.red.withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      videoInfo[index]['thumbnail'],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    videoInfo[index]['time'],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(3),
                // width: 80,
                // height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xffeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '15 sec rest',
                  style: TextStyle(
                    color: Color(0xff839fed),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 0;
                      i < MediaQuery.of(context).size.width / 5;
                      i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Color(0xff839fed),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            color: Colors.white,
                          ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

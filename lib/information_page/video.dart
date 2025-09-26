import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final String videoPath;
  const MyVideoPlayer({required this.videoPath, super.key});

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;
  bool _initFailed = false;

  @override
  void initState(){
    super.initState();
    var videoPath = widget.videoPath.startsWith('assets/video/');
    if (videoPath) {
      _controller = VideoPlayerController.asset(widget.videoPath)
        ..setLooping(true);
    } else {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoPath))
        ..setLooping(true);
    }
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      await _controller.initialize();
      await _controller.play();
      setState(() {});
    } catch (e) {
      debugPrint('Video init error: $e');
      setState(() => _initFailed = true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_initFailed) {
      return const Center(child: Text('โหลดวิดีโอไม่สำเร็จ'));
    }
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio == 0
          ? 16 / 9
          : _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }
}

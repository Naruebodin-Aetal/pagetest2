import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyNetworkVideoPlayer extends StatefulWidget {
  final String videoUrl; // ต้องเป็นลิงก์ไฟล์วิดีโอจริงๆ (.mp4, .m3u8) ไม่ใช่ YouTube
  const MyNetworkVideoPlayer({required this.videoUrl, super.key});

  @override
  State<MyNetworkVideoPlayer> createState() => _MyNetworkVideoPlayerState();
}

class _MyNetworkVideoPlayerState extends State<MyNetworkVideoPlayer> {
  late VideoPlayerController _controller;
  bool _initFailed = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..setLooping(true);
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

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/widgets/custom_app_bar.dart';

class VideoDetailsMobileBody extends StatelessWidget {
  const VideoDetailsMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomAppBar()),
      body: Column(children: []),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(""))
      ..initialize().then((v) {
        setState(() {
          _videoPlayerController.play();
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_videoPlayerController);
  }
}

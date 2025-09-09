import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late final Player _player;
  late final VideoController _controller;

  @override
  void initState() {
    super.initState();
    final videoUrl = context.read<VideoDetailsCubit>().videoModel?.videos?.items?[0].url ?? "";

    _player = Player();
    _controller = VideoController(_player);

    if (videoUrl.isNotEmpty) {
      _player.open(Media(videoUrl));
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.shortestSide >= 600;

    return GestureDetector(
      onTap: () async {
        if (_player.state.playing) {
          await _player.pause();
        } else {
          await _player.play();
        }
      },
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(isTablet ? 16 : 12)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isTablet ? 16 : 12),
                child: Video(controller: _controller, fit: BoxFit.fill),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

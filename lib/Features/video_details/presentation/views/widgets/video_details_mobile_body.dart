import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';

class VideoDetailsMobileBody extends StatelessWidget {
  const VideoDetailsMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<VideoDetailsCubit, VideoDetailsState>(
          builder: (context, state) {
            if (state is VideoDetailsLoading) {
              return CircularProgressIndicator();
            } else if (state is VideoDetailsSuccess) {
              return VideoPlayerWidget();
            } else {
              return Text("Error");
            }
          },
        ),
      ],
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
    _videoPlayerController =
        VideoPlayerController.networkUrl(
            Uri.parse(context.read<VideoDetailsCubit>().videoModel?.videos?.items?[0].url ?? ""),
          )
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
    return GestureDetector(
      onTap: () {
        _videoPlayerController.value.isPlaying ? _videoPlayerController.pause() : _videoPlayerController.play();
      },
      child: AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: VideoPlayer(_videoPlayerController),
      ),
    );
  }
}

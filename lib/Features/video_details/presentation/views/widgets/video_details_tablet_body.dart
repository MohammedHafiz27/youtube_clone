import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/widgets/video_player_tablet_body_skeleton.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_tablet_body.dart';

class VideoDetailsTabletBody extends StatelessWidget {
  const VideoDetailsTabletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoDetailsCubit, VideoDetailsState>(
      builder: (context, state) {
        if (state is VideoDetailsLoading) {
          return VideoPlayerTabletBodySkeleton();
        } else if (state is VideoDetailsSuccess) {
          return VideoPlayerTabletBody();
        } else {
          return Text("Error");
        }
      },
    );
  }
}

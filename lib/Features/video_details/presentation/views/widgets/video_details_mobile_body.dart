import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_body_success.dart';

class VideoDetailsMobileBody extends StatelessWidget {
  const VideoDetailsMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoDetailsCubit, VideoDetailsState>(
      builder: (context, state) {
        if (state is VideoDetailsLoading) {
          return CircularProgressIndicator();
        } else if (state is VideoDetailsSuccess) {
          return VideoPlayerMobileBody();
        } else {
          return Text("Error");
        }
      },
    );
  }
}

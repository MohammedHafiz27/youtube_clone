import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Core/utils/custom_adaptive_layout.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/widgets/custom_app_bar.dart';
import 'package:youtube_clone/Features/video_details/data/repos/comments_repo/comments_repo_imple.dart';
import 'package:youtube_clone/Features/video_details/data/repos/related_videos_repo/reated_video_repo_imple.dart';
import 'package:youtube_clone/Features/video_details/data/repos/video_repo/video_details_repo_imple.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/related_videos_cubit/related_videos_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_details_mobile_body.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_tablet_body.dart';

class VideoDetails extends StatelessWidget {
  final int index;
  final String videoId;
  const VideoDetails({super.key, required this.index, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VideoDetailsCubit(VideoDetailsRepoImple(ApiService()))..getVideoDetails(videoId),
        ),
        BlocProvider(create: (context) => CommentsCubit(CommentsRepoImple(ApiService()))..getComments(videoId)),
        BlocProvider(
          create: (context) => RelatedVideosCubit(RelatedVideoRepoImple(ApiService()))..getRelatedVideos(videoId),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: CustomAppBar()),
        body: CustomAdaptiveLayout(
          mobileLayout: (context) => VideoDetailsMobileBody(),
          tabletLayout: (context) => VideoDetailsTabletBody(),
        ),
      ),
    );
  }
}

class VideoDetailsTabletBody extends StatelessWidget {
  const VideoDetailsTabletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoDetailsCubit, VideoDetailsState>(
      builder: (context, state) {
        if (state is VideoDetailsLoading) {
          return CircularProgressIndicator();
        } else if (state is VideoDetailsSuccess) {
          return VideoPlayerTabletBody();
        } else {
          return Text("Error");
        }
      },
    );
  }
}

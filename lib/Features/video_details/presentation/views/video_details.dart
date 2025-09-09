import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Core/utils/custom_adaptive_layout.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/widgets/custom_app_bar.dart';
import 'package:youtube_clone/Features/video_details/data/repos/comments_repo/comments_repo_imple.dart';
import 'package:youtube_clone/Features/video_details/data/repos/related_videos_repo/reated_video_repo_imple.dart';
import 'package:youtube_clone/Features/video_details/data/repos/video_repo/video_details_repo_imple.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/related_videos_cubit/related_videos_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_scroll_view.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_info_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comment_builder.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/related_video_widget_builder.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/subtitle_description_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_details_mobile_body.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

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

class VideoPlayerTabletBody extends StatelessWidget {
  const VideoPlayerTabletBody({super.key});

  @override
  Widget build(BuildContext context) {
    final videoDetailsCubit = context.read<VideoDetailsCubit>();
    final commentsCubit = context.read<CommentsCubit>();

    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          spacing: 12,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const VideoPlayerWidget(),
                            Text(videoDetailsCubit.videoModel?.title ?? "", style: AppStyles.styleBold18(context)),
                            SubTitleDescriptionWidget(videoDetailsCubit: videoDetailsCubit),
                            ChannelInfoWidget(videoDetailsCubit: videoDetailsCubit),
                            ActionButtonScrollView(videoDetailsCubit: videoDetailsCubit),
                            CommentBuilder(commentsCubit: commentsCubit),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: CustomScrollView(slivers: [RelatedVideosWidgetBuilder()])),
            ],
          ),
        ),
      ],
    );
  }
}

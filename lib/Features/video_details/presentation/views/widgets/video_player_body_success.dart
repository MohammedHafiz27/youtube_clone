import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_scroll_view.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_info_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comment_builder.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/related_video_widget_builder.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/subtitle_description_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class VideoPlayerMobileBody extends StatelessWidget {
  const VideoPlayerMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final videoDetailsCubit = context.read<VideoDetailsCubit>();
    final commentsCubit = context.read<CommentsCubit>();

    return Column(
      children: [
        VideoPlayerWidget(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(videoDetailsCubit.videoModel?.title ?? "", style: AppStyles.styleBold18(context)),
                ),
              ),
              SliverToBoxAdapter(child: SubTitleDescriptionWidget(videoDetailsCubit: videoDetailsCubit)),
              SliverToBoxAdapter(child: ChannelInfoWidget(videoDetailsCubit: videoDetailsCubit)),
              SliverToBoxAdapter(child: ActionButtonScrollView(videoDetailsCubit: videoDetailsCubit)),
              SliverToBoxAdapter(child: CommentBuilder(commentsCubit: commentsCubit)),
              RelatedVideosWidgetBuilder(),
            ],
          ),
        ),
      ],
    );
  }
}

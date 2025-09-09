import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_scroll_view.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_info_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comment_builder.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comment_content.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/related_video_widget_builder.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/subtitle_description_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const VideoPlayerWidget(),
                            Text(videoDetailsCubit.videoModel?.title ?? "", style: AppStyles.styleBold18(context)),
                            SubTitleDescriptionWidget(videoDetailsCubit: videoDetailsCubit),
                            ChannelInfoWidget(videoDetailsCubit: videoDetailsCubit),
                            ActionButtonScrollView(videoDetailsCubit: videoDetailsCubit),
                            CommentTabletBuilder(commentsCubit: commentsCubit),
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

class CommentTabletBuilder extends StatelessWidget {
  const CommentTabletBuilder({super.key, required this.commentsCubit});
  final CommentsCubit commentsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsCubit, CommentsState>(
      builder: (context, state) {
        if (state is CommentsSuccess) {
          return CommentItemTablet(commentsCubit: commentsCubit);
        } else if (state is CommentsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class CommentItemTablet extends StatelessWidget {
  const CommentItemTablet({super.key, this.commentsCubit});

  final CommentsCubit? commentsCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withValues(alpha: .1)
            : Colors.grey.shade200,
      ),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(commentsCubit?.commentsModel?.countText ?? "", style: AppStyles.styleBold18(context)),
          ListView.builder(
            shrinkWrap: true,
            itemCount: commentsCubit?.commentsModel?.items?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      commentsCubit?.commentsModel?.items?[index].channel?.avatar?[0].url ?? "",
                    ),
                  ),
                  title: Text(
                    commentsCubit?.commentsModel?.items?[index].channel?.name ?? "",
                    style: AppStyles.styleRegular14(context),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        commentsCubit?.commentsModel?.items?[index].contentText ?? "",
                        style: AppStyles.styleSemiBold16(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.thumb_up_alt_outlined, size: 18, color: Colors.grey),
                          Icon(Icons.thumb_down_alt_outlined, size: 18, color: Colors.grey),
                          Icon(Icons.comment, size: 18, color: Colors.grey),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

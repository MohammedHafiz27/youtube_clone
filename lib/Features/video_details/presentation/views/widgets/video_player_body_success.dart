import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_scroll_view.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_info_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comment_item.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/subtitle_description_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class VideoPlayerBody extends StatelessWidget {
  const VideoPlayerBody({super.key});

  @override
  Widget build(BuildContext context) {
    final videoDetailsCubit = context.read<VideoDetailsCubit>();
    final commentsCubit = context.read<CommentsCubit>();
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VideoPlayerWidget(),
        Text(videoDetailsCubit.videoModel?.title ?? "", style: AppStyles.styleBold18(context)),
        SubTitleDescriptionWidget(videoDetailsCubit: videoDetailsCubit),
        ChannelInfoWidget(videoDetailsCubit: videoDetailsCubit),
        ActionButtonScrollView(videoDetailsCubit: videoDetailsCubit),
        CommentItem(commentsCubit: commentsCubit),
      ],
    );
  }
}

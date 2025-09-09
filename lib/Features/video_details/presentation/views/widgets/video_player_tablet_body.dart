import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:youtube_clone/Core/functions/on_open.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_scroll_view.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/channel_info_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comments_tablet_builder.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/description_widget_tablet.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/related_video_widget_builder.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/subtitle_description_widget.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_details_info_likes_views.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class VideoPlayerTabletBody extends StatefulWidget {
  const VideoPlayerTabletBody({super.key});

  @override
  State<VideoPlayerTabletBody> createState() => _VideoPlayerTabletBodyState();
}

class _VideoPlayerTabletBodyState extends State<VideoPlayerTabletBody> {
  final ScrollController _leftController = ScrollController();
  final ScrollController _rightController = ScrollController();
  bool _isLeftScrolling = false;
  bool _isRightScrolling = false;

  @override
  void initState() {
    super.initState();

    _leftController.addListener(() {
      if (_isRightScrolling) return;
      _isLeftScrolling = true;
      _rightController.jumpTo(
        _leftController.offset.clamp(
          _rightController.position.minScrollExtent,
          _rightController.position.maxScrollExtent,
        ),
      );
      _isLeftScrolling = false;
    });

    _rightController.addListener(() {
      if (_isLeftScrolling) return;
      _isRightScrolling = true;
      _leftController.jumpTo(
        _rightController.offset.clamp(
          _leftController.position.minScrollExtent,
          _leftController.position.maxScrollExtent,
        ),
      );
      _isRightScrolling = false;
    });
  }

  @override
  void dispose() {
    _leftController.dispose();
    _rightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoDetailsCubit = context.read<VideoDetailsCubit>();
    final commentsCubit = context.read<CommentsCubit>();

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomScrollView(
            controller: _leftController,
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
                      DescriptionWidgetTablet(videoDetailsCubit: videoDetailsCubit),
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
        Expanded(
          flex: 1,
          child: CustomScrollView(controller: _rightController, slivers: const [RelatedVideosWidgetBuilder()]),
        ),
      ],
    );
  }
}

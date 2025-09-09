import 'package:flutter/material.dart';
import 'package:youtube_clone/Features/video_details/data/models/action_button_model.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/action_button_widget.dart';

class ActionButtonScrollView extends StatelessWidget {
  final VideoDetailsCubit videoDetailsCubit;
  const ActionButtonScrollView({super.key, required this.videoDetailsCubit});

  List<ActionButtonModel> get actionButtons => [
    ActionButtonModel(
      icon: Icons.thumb_up_alt_outlined,
      label: videoDetailsCubit.videoModel?.likeCount.toString() ?? "Like",
    ),
    ActionButtonModel(icon: Icons.thumb_down_alt_outlined, label: "Dislike"),
    ActionButtonModel(icon: Icons.reply_outlined, label: "Share"),
    ActionButtonModel(icon: Icons.download_outlined, label: "Download"),
    ActionButtonModel(icon: Icons.library_add_outlined, label: "Save"),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: actionButtons.map((button) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ActionButtonWidget(button: button),
          );
        }).toList(),
      ),
    );
  }
}

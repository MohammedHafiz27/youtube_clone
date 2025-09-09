import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';

class VideoDetailsInfoLikesViews extends StatelessWidget {
  const VideoDetailsInfoLikesViews({super.key, this.title, required this.count});

  final String? title;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: AppStyles.styleSemiBold16(context)),
        Text(title ?? "", style: AppStyles.styleSemiBold16(context)),
      ],
    );
  }
}

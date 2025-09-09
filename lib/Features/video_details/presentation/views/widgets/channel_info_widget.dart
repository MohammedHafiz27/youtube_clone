
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';

class ChannelInfoWidget extends StatelessWidget {
  const ChannelInfoWidget({
    super.key,
    required this.videoDetailsCubit,
  });

  final VideoDetailsCubit videoDetailsCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(videoDetailsCubit.videoModel?.channel?.avatar?[1].url ?? ""),
        ),
        Text(videoDetailsCubit.videoModel?.channel?.name ?? "", style: AppStyles.styleBold18(context)),
        Text(videoDetailsCubit.videoModel?.channel?.subscriberCountText ?? ""),
        Expanded(child: SizedBox()),
        ElevatedButton(onPressed: () {}, child: Text("Subscribe")),
      ],
    );
  }
}

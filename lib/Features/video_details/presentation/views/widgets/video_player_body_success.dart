import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/modal_bottom_sheet.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_player_widget.dart';

class VideoPlayerBody extends StatelessWidget {
  const VideoPlayerBody({super.key});

  @override
  Widget build(BuildContext context) {
    final videoDetailsCubit = context.read<VideoDetailsCubit>();
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VideoPlayerWidget(),
        Text(videoDetailsCubit.videoModel?.title ?? "", style: AppStyles.styleSemiBold16(context)),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return ModalBottomSheetWidget(videoDetailsCubit: videoDetailsCubit);
              },
            );
          },
          child: RichText(
            text: TextSpan(
              text:
                  "${videoDetailsCubit.videoModel?.viewCount ?? 0} views • ${videoDetailsCubit.videoModel?.publishedTimeText ?? ""}",
              style: AppStyles.styleRegular14(context),
              children: [TextSpan(text: "...more", style: AppStyles.styleSemiBold16(context))],
            ),
          ),
        ),
      ],
    );
  }
}

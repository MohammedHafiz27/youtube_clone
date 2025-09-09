import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/modal_bottom_sheet.dart';

class SubTitleDescriptionWidget extends StatelessWidget {
  const SubTitleDescriptionWidget({super.key, required this.videoDetailsCubit});

  final VideoDetailsCubit videoDetailsCubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          children: [
            TextSpan(
              text: "...more",
              style: AppStyles.styleSemiBold16(context),
            ),
          ],
        ),
      ),
    );
  }
}

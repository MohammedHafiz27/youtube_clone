import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_details_info_likes_views.dart';

class ModalBottomSheetWidget extends StatelessWidget {
  const ModalBottomSheetWidget({super.key, required this.videoDetailsCubit});

  final VideoDetailsCubit videoDetailsCubit;
  Future<void> _onOpen(LinkableElement link) async {
    final uri = Uri.parse(link.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description", style: AppStyles.styleSemiBold16(context)),
          Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Text(videoDetailsCubit.videoModel?.title ?? "", style: AppStyles.styleSemiBold16(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      VideoDetailsInfoLikesViews(
                        count: videoDetailsCubit.videoModel?.likeCount.toString() ?? "0",
                        title: 'Likes',
                      ),
                      VideoDetailsInfoLikesViews(
                        count: videoDetailsCubit.videoModel?.viewCount.toString() ?? "0",
                        title: 'Views',
                      ),
                      VideoDetailsInfoLikesViews(count: videoDetailsCubit.videoModel?.publishedTimeText ?? "0"),
                    ],
                  ),

                  Linkify(
                    onOpen: _onOpen,
                    text: videoDetailsCubit.videoModel?.description ?? "",
                    style: AppStyles.styleRegular14(context),
                    linkStyle: AppStyles.styleRegular14(context).copyWith(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

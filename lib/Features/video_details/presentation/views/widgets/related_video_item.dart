import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/data/models/related_videos/related_videos.dart';

class RelatedVideoItem extends StatelessWidget {
  final RelatedVideosModel relatedVideo;
  final int index;
  const RelatedVideoItem({super.key, required this.relatedVideo, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  width: MediaQuery.sizeOf(context).width,
                  imageUrl:
                      relatedVideo.items?[index].thumbnails?[1].url ??
                      "https://img.pikbest.com/origin/10/04/54/34TpIkbEsT4uG.jpg!w700wp",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Text(relatedVideo.items?[index].lengthText ?? "", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: CachedNetworkImageProvider(
                  relatedVideo.items?[index].channel?.avatar?[0].url ??
                      "https://img.pikbest.com/origin/10/04/54/34TpIkbEsT4uG.jpg!w700wp",
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      relatedVideo.items?[index].title ?? "",
                      style: AppStyles.styleSemiBold16(context),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${relatedVideo.items?[index].channel?.name ?? ""} • ${relatedVideo.items?[index].viewCountText ?? ""} • ${relatedVideo.items?[index].publishedTimeText ?? ""}",
                      style: AppStyles.styleRegular14(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

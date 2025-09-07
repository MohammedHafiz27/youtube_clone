import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';

class VideoItem extends StatelessWidget {
  const VideoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: "https://img.pikbest.com/origin/10/04/54/34TpIkbEsT4uG.jpg!w700wp",
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Text("12:50", style: TextStyle(color: Colors.white)),
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
                  "https://img.pikbest.com/origin/10/04/54/34TpIkbEsT4uG.jpg!w700wp",
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Video Title", style: AppStyles.styleSemiBold16(context)),
                  SizedBox(height: 4),
                  Text("Channel Name", style: AppStyles.styleRegular14(context)),
                  SizedBox(height: 4),
                  Text("1M views • 2 days ago", style: AppStyles.styleRegular14(context)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

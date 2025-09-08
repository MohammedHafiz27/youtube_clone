import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/home_page/presentation/view_models/video_cubit/video_cubit.dart';

class VideoItem extends StatelessWidget {
  final int index;
  const VideoItem({super.key, required this.index});

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
                  imageUrl:
                      context.read<VideoCubit>().searchModel?.items?[index].thumbnails![1].url ??
                      "https://img.pikbest.com/origin/10/04/54/34TpIkbEsT4uG.jpg!w700wp",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(4)),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Text(
                    context.read<VideoCubit>().searchModel!.items![index].lengthText ?? "12:52",
                    style: TextStyle(color: Colors.white),
                  ),
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
                  context.read<VideoCubit>().searchModel?.items?[index].channel?.avatar?[0].url ??
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
                      context.read<VideoCubit>().searchModel?.items?[index].title ?? "Video Title",
                      style: AppStyles.styleSemiBold16(context),
                    ),
                    SizedBox(height: 4),
                    Text(
                      context.read<VideoCubit>().searchModel?.items?[index].channel?.name ?? "Channel Name",
                      style: AppStyles.styleRegular14(context),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${context.read<VideoCubit>().searchModel?.items?[index].viewCountText} • ${context.read<VideoCubit>().searchModel?.items?[index].publishedTimeText}",
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:youtube_clone/Core/functions/on_open.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';

class CommentContent extends StatelessWidget {
  const CommentContent({super.key, required this.commentsCubit, this.index});

  final CommentsCubit commentsCubit;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            commentsCubit.commentsModel?.items?[index ?? 0].channel?.avatar?[0].url ?? "",
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          flex: 1,
          child: Linkify(
            onOpen: onOpen,
            text: commentsCubit.commentsModel?.items?[index ?? 0].contentText ?? "",
            style: AppStyles.styleSemiBold16(context),
          ),
        ),
      ],
    );
  }
}

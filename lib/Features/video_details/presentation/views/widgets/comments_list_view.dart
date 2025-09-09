import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({super.key, required this.commentsCubit});

  final CommentsCubit? commentsCubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: commentsCubit?.commentsModel?.items?.length ?? 0,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(commentsCubit?.commentsModel?.items?[index].channel?.avatar?[0].url ?? ""),
            ),
            title: Text(
              commentsCubit?.commentsModel?.items?[index].channel?.name ?? "",
              style: AppStyles.styleRegular14(context),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  commentsCubit?.commentsModel?.items?[index].contentText ?? "",
                  style: AppStyles.styleSemiBold16(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.thumb_up_alt_outlined, size: 18, color: Colors.grey),
                    Icon(Icons.thumb_down_alt_outlined, size: 18, color: Colors.grey),
                    Icon(Icons.comment, size: 18, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

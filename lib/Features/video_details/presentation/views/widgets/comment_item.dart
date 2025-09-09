import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comment_content.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comments_list_view.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.commentsCubit});

  final CommentsCubit commentsCubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return CommentsListView(commentsCubit: commentsCubit);
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white.withValues(alpha: .1)
              : Colors.grey.shade200,
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              commentsCubit.commentsModel?.countText ?? "",
              style: AppStyles.styleBold18(context),
            ),
            CommentContent(commentsCubit: commentsCubit),
          ],
        ),
      ),
    );
  }
}

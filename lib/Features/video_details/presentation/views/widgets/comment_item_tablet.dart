import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/app_styles.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';

class CommentItemTablet extends StatelessWidget {
  const CommentItemTablet({super.key, this.commentsCubit});

  final CommentsCubit? commentsCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white.withValues(alpha: .1)
            : Colors.grey.shade200,
      ),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(commentsCubit?.commentsModel?.countText ?? "", style: AppStyles.styleBold18(context)),
          ListView.builder(
            shrinkWrap: true,
            itemCount: commentsCubit?.commentsModel?.items?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      commentsCubit?.commentsModel?.items?[index].channel?.avatar?[0].url ?? "",
                    ),
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
                        style: AppStyles.styleRegular14(
                          context,
                        ).copyWith(color: Theme.of(context).textTheme.bodyLarge?.color),
                      ),
                      const SizedBox(height: 12),
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
          ),
        ],
      ),
    );
  }
}

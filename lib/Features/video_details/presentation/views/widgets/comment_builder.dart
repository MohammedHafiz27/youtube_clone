import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comment_item.dart';

class CommentBuilder extends StatelessWidget {
  final CommentsCubit commentsCubit;
  const CommentBuilder({super.key, required this.commentsCubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsCubit, CommentsState>(
      builder: (context, state) {
        if (state is CommentsSuccess) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: CommentItem(commentsCubit: commentsCubit),
            ),
          );
        } else if (state is CommentsFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.errorMessage)));
        } else {
          return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

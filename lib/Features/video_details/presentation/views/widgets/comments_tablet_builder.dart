import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/comments_cubit/comments_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/comment_item_tablet.dart';

class CommentTabletBuilder extends StatelessWidget {
  const CommentTabletBuilder({super.key, required this.commentsCubit});
  final CommentsCubit commentsCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsCubit, CommentsState>(
      builder: (context, state) {
        if (state is CommentsSuccess) {
          return CommentItemTablet(commentsCubit: commentsCubit);
        } else if (state is CommentsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

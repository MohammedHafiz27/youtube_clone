import 'package:bloc/bloc.dart';
import 'package:youtube_clone/Features/video_details/data/models/comments/comments.dart';
import 'package:youtube_clone/Features/video_details/data/repos/comments_repo/comments_repo.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit(this.commentsRepo) : super(CommentsInitial());
  final CommentsRepo commentsRepo;
  CommentsModel? commentsModel;
  Future<void> getComments(String videoId) async {
    emit(CommentsLoading());
    var resultEither = await commentsRepo.getComments(videoId);
    resultEither.fold(
      (failure) => emit(CommentsFailure(errorMessage: failure.errorMessage)),
      (data) {
        commentsModel = data;
        emit(CommentsSuccess());
      },
    );
  }
}

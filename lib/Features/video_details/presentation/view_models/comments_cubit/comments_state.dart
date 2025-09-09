part of 'comments_cubit.dart';

class CommentsState {}

final class CommentsInitial extends CommentsState {}

final class CommentsLoading extends CommentsState {}

final class CommentsSuccess extends CommentsState {}

final class CommentsFailure extends CommentsState {
  final String errorMessage;
  CommentsFailure({required this.errorMessage});
}

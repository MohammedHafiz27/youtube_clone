part of 'related_videos_cubit.dart';

class RelatedVideosState {}

final class RelatedVideosInitial extends RelatedVideosState {}

final class RelatedVideosLoading extends RelatedVideosState {}

final class RelatedVideosSuccess extends RelatedVideosState {
  final RelatedVideosModel relatedVideos;

  RelatedVideosSuccess({required this.relatedVideos});
}

final class RelatedVideosFailure extends RelatedVideosState {
  final String errorMessage;
  RelatedVideosFailure({required this.errorMessage});
}

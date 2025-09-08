part of 'video_details_cubit.dart';

class VideoDetailsState {}

final class VideoDetailsInitial extends VideoDetailsState {}

final class VideoDetailsLoading extends VideoDetailsState {}

final class VideoDetailsSuccess extends VideoDetailsState {}

final class VideoDetailsFailure extends VideoDetailsState {
  final String errorMessage;

  VideoDetailsFailure({required this.errorMessage});
}

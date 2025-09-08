part of 'video_cubit.dart';

class VideoState {}

final class VideoInitial extends VideoState {}

final class VideoLoading extends VideoState {}

final class VideoSuccess extends VideoState {}

final class VideoFailure extends VideoState {
  final String errorMessage;
  VideoFailure({required this.errorMessage});
}

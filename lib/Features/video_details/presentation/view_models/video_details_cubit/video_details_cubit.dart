import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Features/video_details/data/models/video/video.dart';
import 'package:youtube_clone/Features/video_details/data/repos/video_details_repo.dart';

part 'video_details_state.dart';

class VideoDetailsCubit extends Cubit<VideoDetailsState> {
  VideoDetailsCubit(this.videoDetailsRepo) : super(VideoDetailsInitial());
  final VideoDetailsRepo videoDetailsRepo;
  VideoModel? videoModel;
  Future<void> getVideoDetails(String videoId) async {
    emit(VideoDetailsLoading());
    var resultEither = await videoDetailsRepo.getVideoDetails(videoId);
    resultEither.fold((failure) => emit(VideoDetailsFailure(errorMessage: failure.errorMessage)), (data) {
      videoModel = data;
      emit(VideoDetailsSuccess());
    });
  }
}

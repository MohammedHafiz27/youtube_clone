import 'package:bloc/bloc.dart';
import 'package:youtube_clone/Features/video_details/data/models/related_videos/related_videos.dart';
import 'package:youtube_clone/Features/video_details/data/repos/related_videos_repo/related_video_repo.dart';

part 'related_videos_state.dart';

class RelatedVideosCubit extends Cubit<RelatedVideosState> {
  RelatedVideosCubit(this.relatedVideoRepo) : super(RelatedVideosInitial());
  final RelatedVideoRepo relatedVideoRepo;

  Future<void> getRelatedVideos(String videoId) async {
    emit(RelatedVideosLoading());
    var resultEither = await relatedVideoRepo.getRelatedVideos(videoId);
    resultEither.fold(
      (failure) => emit(RelatedVideosFailure(errorMessage: failure.errorMessage)),
      (data) => emit(RelatedVideosSuccess(relatedVideos: data)),
    );
  }
}

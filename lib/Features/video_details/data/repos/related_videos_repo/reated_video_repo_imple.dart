import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Core/utils/failures.dart';
import 'package:youtube_clone/Features/video_details/data/models/related_videos/related_videos.dart';
import 'package:youtube_clone/Features/video_details/data/repos/related_videos_repo/related_video_repo.dart';

class RelatedVideoRepoImple implements RelatedVideoRepo {
  final ApiService apiService;

  RelatedVideoRepoImple(this.apiService);
  @override
  Future<Either<Failure, RelatedVideosModel>> getRelatedVideos(String videoId) async {
    try {
      var data = await apiService.getData("/v2/video/related?videoId=$videoId");
      return Right(RelatedVideosModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

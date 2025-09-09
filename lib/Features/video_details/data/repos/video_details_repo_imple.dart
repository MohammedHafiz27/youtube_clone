import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Core/utils/failures.dart';
import 'package:youtube_clone/Features/video_details/data/models/video/video.dart';
import 'package:youtube_clone/Features/video_details/data/repos/video_details_repo.dart';

class VideoDetailsRepoImple implements VideoDetailsRepo {
  final ApiService apiService;

  VideoDetailsRepoImple(this.apiService);
  @override
  Future<Either<Failure, VideoModel>> getVideoDetails(String videoId) async {
    try {
      var data = await apiService.getData("/v2/video/details?videoId=$videoId");
      return Right(VideoModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}

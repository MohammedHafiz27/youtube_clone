import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Core/utils/failures.dart';
import 'package:youtube_clone/Features/video_details/data/models/comments/comments.dart';
import 'package:youtube_clone/Features/video_details/data/repos/comments_repo/comments_repo.dart';

class CommentsRepoImple implements CommentsRepo {
  final ApiService apiService;

  CommentsRepoImple(this.apiService);
  @override
  Future<Either<Failure, CommentsModel>> getComments(String videoId) async {
    try {
      var data = await apiService.getData(
        "/v2/video/comments?videoId=$videoId",
      );
      return Right(CommentsModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Core/utils/failures.dart';
import 'package:youtube_clone/Features/home_page/data/models/search/search.dart';
import 'package:youtube_clone/Features/home_page/data/repos/home_repo.dart';

class HomeRepoImple implements HomeRepo {
  ApiService apiService;
  HomeRepoImple(this.apiService);
  @override
  Future<Either<Failure, SearchModel>> getSearchData(String searchQuery) async {
    try {
      var data = await apiService.getData("/v2/search/videos?keyword=$searchQuery");
      return Right(SearchModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

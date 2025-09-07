import 'package:dartz/dartz.dart';
import 'package:youtube_clone/Core/utils/failures.dart';
import 'package:youtube_clone/Features/home_page/data/models/search/search.dart';

abstract class HomeRepo {
  Future<Either<Failure, SearchModel>> getSearchData(String searchQuery);
}

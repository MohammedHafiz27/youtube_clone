import 'package:dartz/dartz.dart';
import 'package:youtube_clone/Core/utils/failures.dart';
import 'package:youtube_clone/Features/video_details/data/models/comments/comments.dart';

abstract class CommentsRepo {
  Future<Either<Failure, CommentsModel>> getComments(String videoId);
}

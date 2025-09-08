import 'package:dartz/dartz.dart';
import 'package:youtube_clone/Core/utils/failures.dart';
import 'package:youtube_clone/Features/video_details/data/models/video/video.dart';

abstract class VideoDetailsRepo {
  Future<Either<Failure, VideoModel>> getVideoDetails(String videoId);
}

import 'package:dartz/dartz.dart';
import 'package:youtube_clone/Core/utils/failures.dart';
import 'package:youtube_clone/Features/video_details/data/models/related_videos/related_videos.dart';

abstract class RelatedVideoRepo {
  Future<Either<Failure, RelatedVideosModel>> getRelatedVideos(String videoId);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone/Core/utils/api_service.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/widgets/custom_app_bar.dart';
import 'package:youtube_clone/Features/video_details/data/repos/video_repo/video_details_repo_imple.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/video_details_cubit/video_details_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/video_details_mobile_body.dart';

class VideoDetails extends StatelessWidget {
  final int index;
  final String videoId;
  const VideoDetails({super.key, required this.index, required this.videoId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              VideoDetailsCubit(VideoDetailsRepoImple(ApiService()))
                ..getVideoDetails(videoId),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: CustomAppBar()),
        body: VideoDetailsMobileBody(),
      ),
    );
  }
}

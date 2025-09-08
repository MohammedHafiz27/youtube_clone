import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_clone/Core/utils/app_route.dart';
import 'package:youtube_clone/Features/home_page/presentation/view_models/video_cubit/video_cubit.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/widgets/video_item.dart';

class HomePageMobileBody extends StatelessWidget {
  const HomePageMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoCubit, VideoState>(
      builder: (context, state) {
        if (state is VideoLoading) {
          return CupertinoActivityIndicator();
        } else if (state is VideoSuccess) {
          return ListView.builder(
            itemCount:
                context.read<VideoCubit>().searchModel?.items?.length ?? 0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.push(AppRoute.kVideoDetails);
                },
                child: VideoItem(index: index),
              );
            },
          );
        } else {
          return Text("Error");
        }
      },
    );
  }
}

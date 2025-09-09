import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_clone/Core/utils/app_route.dart';
import 'package:youtube_clone/Features/video_details/presentation/view_models/related_videos_cubit/related_videos_cubit.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/widgets/related_video_item.dart';

class RelatedVideosWidgetBuilder extends StatelessWidget {
  const RelatedVideosWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedVideosCubit, RelatedVideosState>(
      builder: (context, state) {
        if (state is RelatedVideosSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return GestureDetector(
                onTap: () {
                  context.push(
                    AppRoute.kVideoDetails,
                    extra: {"videoid": state.relatedVideos.items?[index].id ?? "", "index": index},
                  );
                },
                child: RelatedVideoItem(relatedVideo: state.relatedVideos, index: index),
              );
            }, childCount: state.relatedVideos.items?.length),
          );
        } else if (state is RelatedVideosFailure) {
          return SliverToBoxAdapter(child: Center(child: Text(state.errorMessage)));
        } else {
          return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}

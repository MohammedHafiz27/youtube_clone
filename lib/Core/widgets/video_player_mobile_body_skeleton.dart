import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/widgets/loading_container.dart';

class VideoPlayerMobileBodySkeleton extends StatelessWidget {
  const VideoPlayerMobileBodySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Video player skeleton
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: LoadingContainer(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                          width: MediaQuery.sizeOf(context).width * 0.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      LoadingContainer(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        width: MediaQuery.sizeOf(context).width * 0.4,
                      ),
                      const SizedBox(height: 12),

                      // Description skeleton
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoadingContainer(
                            height: MediaQuery.sizeOf(context).height * 0.03,
                            width: MediaQuery.sizeOf(context).width * 0.4,
                          ),

                          const SizedBox(height: 12),
                        ],
                      ),

                      // Channel info skeleton
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? CupertinoColors.systemGrey4.withAlpha(120)
                                  : CupertinoColors.systemGrey5,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          LoadingContainer(
                            height: MediaQuery.sizeOf(context).height * 0.03,
                            width: MediaQuery.sizeOf(context).width * 0.4,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      LoadingContainer(height: MediaQuery.sizeOf(context).height * 0.1),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LoadingContainer(height: MediaQuery.sizeOf(context).height * 0.3),
                  ),
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/widgets/loading_container.dart';

class VideoPlayerTabletBodySkeleton extends StatelessWidget {
  const VideoPlayerTabletBodySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Left side (Video + Details + Comments)
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
                      AspectRatio(aspectRatio: 16 / 9, child: LoadingContainer()),
                      const SizedBox(height: 12),
                      LoadingContainer(
                        height: MediaQuery.sizeOf(context).height * 0.03,
                        width: MediaQuery.sizeOf(context).width * 0.4,
                      ),

                      // Description skeleton
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoadingContainer(
                            height: MediaQuery.sizeOf(context).height * 0.02,
                            width: MediaQuery.sizeOf(context).width * 0.2,
                          ),

                          const SizedBox(height: 12),
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
                                height: MediaQuery.sizeOf(context).height * 0.02,
                                width: MediaQuery.sizeOf(context).width * 0.2,
                              ),
                              const Spacer(),
                              LoadingContainer(
                                height: MediaQuery.sizeOf(context).height * 0.03,
                                width: MediaQuery.sizeOf(context).width * 0.1,
                              ),
                            ],
                          ),
                          LoadingContainer(
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            width: MediaQuery.sizeOf(context).width * 0.77,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Action buttons skeleton
                      const SizedBox(height: 12),

                      // Comments skeleton
                      Column(
                        children: List.generate(
                          10,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? CupertinoColors.systemGrey4.withAlpha(120)
                                        : CupertinoColors.systemGrey5,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: LoadingContainer(
                                    height: MediaQuery.sizeOf(context).height * 0.1,
                                    width: MediaQuery.sizeOf(context).width * 0.77,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          flex: 1,
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LoadingContainer(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      width: MediaQuery.sizeOf(context).width * 0.77,
                    ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/widgets/loading_container.dart';

class LoadingTabletHomePage extends StatelessWidget {
  const LoadingTabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return Column(
          children: [
            AspectRatio(aspectRatio: 16 / 9, child: LoadingContainer()),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoadingContainer(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                      width: MediaQuery.sizeOf(context).width * 0.2,
                    ),
                    LoadingContainer(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                      width: MediaQuery.sizeOf(context).width * 0.1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 450),
    );
  }
}

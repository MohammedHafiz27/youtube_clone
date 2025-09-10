import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/widgets/loading_container.dart';

class LoadingMobileHomePage extends StatelessWidget {
  const LoadingMobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AspectRatio(aspectRatio: 16 / 9, child: LoadingContainer(margin: 0)),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoadingContainer(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                        width: MediaQuery.sizeOf(context).width * 0.3,
                      ),
                      LoadingContainer(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                        width: MediaQuery.sizeOf(context).width * 0.2,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

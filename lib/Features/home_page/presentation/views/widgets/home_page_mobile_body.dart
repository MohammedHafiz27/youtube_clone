import 'package:flutter/material.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/widgets/video_item.dart';

class HomePageMobileBody extends StatelessWidget {
  const HomePageMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return VideoItem();
      },
    );
  }
}

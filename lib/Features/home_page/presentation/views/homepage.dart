import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/utils/custom_adaptive_layout.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/widgets/custom_app_bar.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/widgets/home_page_mobile_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomAppBar()),
      body: CustomAdaptiveLayout(
        mobileLayout: (context) => HomePageMobileBody(),
        tabletLayout: (context) => SizedBox(),
      ),
    );
  }
}

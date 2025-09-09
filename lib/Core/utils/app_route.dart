import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/homepage.dart';
import 'package:youtube_clone/Features/video_details/presentation/views/video_details.dart';

abstract class AppRoute {
  static const String kHome = '/';
  static const String kVideoDetails = "/videoDetails";

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kHome,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: kVideoDetails,
        builder: (BuildContext context, GoRouterState state) {
          final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return VideoDetails(index: args["index"], videoId: args["videoid"]);
        },
      ),
    ],
  );
}

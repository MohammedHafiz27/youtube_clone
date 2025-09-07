import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_clone/Features/home_page/presentation/views/homepage.dart';

abstract class AppRoute {
  static const String kHome = '/';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kHome,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
    ],
  );
}

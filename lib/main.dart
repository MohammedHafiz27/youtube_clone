import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:media_kit/media_kit.dart';
import 'package:youtube_clone/Core/utils/app_route.dart';
import 'package:youtube_clone/Core/utils/theme_app.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoute.router,
      themeMode: ThemeMode.dark,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
    );
  }
}

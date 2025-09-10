import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:youtube_clone/Core/cubit/theme_app_cubit.dart';
import 'package:youtube_clone/Core/helper/cache_helper.dart';
import 'package:youtube_clone/Core/utils/app_route.dart';
import 'package:youtube_clone/Core/utils/theme_app.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeAppCubit(),
      child: BlocBuilder<ThemeAppCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoute.router,
            themeMode: mode,
            theme: ThemeApp.lightTheme,
            darkTheme: ThemeApp.darkTheme,
          );
        },
      ),
    );
  }
}

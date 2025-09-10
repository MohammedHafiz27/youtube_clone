import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/Core/helper/cache_helper.dart';
import 'package:youtube_clone/Core/helper/cache_helper_key.dart';

class ThemeAppCubit extends Cubit<ThemeMode> {
  ThemeAppCubit() : super(ThemeMode.light) {
    _loadTheme();
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
      CacheHelper.saveData(key: CacheHelperKey.isDark, value: true);
    } else {
      emit(ThemeMode.light);
      CacheHelper.saveData(key: CacheHelperKey.isDark, value: false);
    }
  }

  void _loadTheme() {
    final isDark = CacheHelper.getData(key: CacheHelperKey.isDark);
    if (isDark != null && isDark == true) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }
}

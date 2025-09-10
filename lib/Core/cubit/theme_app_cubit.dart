import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeAppCubit extends Cubit<ThemeMode> {
  ThemeAppCubit() : super(ThemeMode.system);

  void toggleTheme() {
    if (state == ThemeMode.light) {
      emit(ThemeMode.dark);
    } else {
      emit(ThemeMode.light);
    }
  }
  
}

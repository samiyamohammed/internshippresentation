import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
// ignore: unnecessary_import
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<ToggleThemeEvent>((event, emit) {
      if (state is LightThemeState) {
        emit(DarkThemeState());
      } else {
        emit(LightThemeState());
      }
    });
  }
}

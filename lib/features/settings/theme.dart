import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  void swich() => state = !state;
}

@riverpod
ThemeData theme(ThemeRef ref) {
  final darkMode = ref.watch(darkModeProvider);
  final appBarTheme = AppBarTheme(
    elevation: 4,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: darkMode ? null : Colors.black,
    ),
  );

  return darkMode
      ? ThemeData.dark().copyWith(appBarTheme: appBarTheme)
      : ThemeData(
          appBarTheme: appBarTheme,
          colorSchemeSeed: Colors.black,
        );
}

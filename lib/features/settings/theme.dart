import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

@riverpod
class IsDarkMode extends _$IsDarkMode {
  @override
  bool build() => true;

  void swich() => state = !state;
}

@riverpod
ThemeData theme(ThemeRef ref) {
  final isDarkMode = ref.watch(isDarkModeProvider);
  final appBarTheme = AppBarTheme(
    elevation: 4,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: isDarkMode ? null : Colors.black,
    ),
  );

  return isDarkMode
      ? ThemeData.dark().copyWith(appBarTheme: appBarTheme)
      : ThemeData(
          appBarTheme: appBarTheme,
          colorSchemeSeed: Colors.black,
        );
}

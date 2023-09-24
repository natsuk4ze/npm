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
  return darkMode
      ? ThemeData.dark().copyWith(
          appBarTheme: _CustomTheme.appBarTheme(darkMode),
          pageTransitionsTheme: _CustomTheme.pageTransitionsTheme,
        )
      : ThemeData(
          appBarTheme: _CustomTheme.appBarTheme(darkMode),
          pageTransitionsTheme: _CustomTheme.pageTransitionsTheme,
          colorSchemeSeed: Colors.black,
        );
}

class _CustomTheme {
  static PageTransitionsTheme get pageTransitionsTheme =>
      const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: _NoTransitionsBuilder(),
          TargetPlatform.iOS: _NoTransitionsBuilder(),
        },
      );

  static AppBarTheme appBarTheme(bool darkMode) => AppBarTheme(
        elevation: 4,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: darkMode ? null : Colors.black,
        ),
      );
}

class _NoTransitionsBuilder extends PageTransitionsBuilder {
  const _NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(_, __, ___, ____, Widget child) => child;
}

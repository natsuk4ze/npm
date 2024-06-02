import 'package:flutter/material.dart';
import 'package:npm/features/settings/dark_mode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme.g.dart';

@riverpod
ThemeData theme(ThemeRef ref) {
  final theme =
      ref.watch(isDarkModeProvider) ? ThemeData.dark() : ThemeData.light();
  return theme.copyWith(splashFactory: NoSplash.splashFactory);
}

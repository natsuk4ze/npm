import 'package:flutter/material.dart';
import 'package:npm/features/settings/dark_mode.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme.g.dart';

@riverpod
ThemeData theme(ThemeRef ref) =>
    ref.watch(isDarkModeProvider) ? ThemeData.dark() : ThemeData.light();

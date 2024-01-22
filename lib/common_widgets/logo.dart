import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/dark_mode.dart';

class Logo extends ConsumerWidget {
  const Logo({
    this.width,
    super.key,
  });

  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Image.asset(
      'assets/app/npm.png',
      width: width ?? 60,
      color: isDarkMode ? Colors.white : null,
    );
  }
}

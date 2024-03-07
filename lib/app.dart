import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/dark_mode.dart';
import 'package:npm/router.dart';
import 'package:npm/util/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:slang_flutter/slang_flutter.dart';

part 'app.g.dart';

@Riverpod(keepAlive: true)
Future<void> appStartup(AppStartupRef ref) async {
  await ref.read(sharedPreferencesProvider.future);
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startup = ref.watch(appStartupProvider);
    final router = ref.watch(routerProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);
    final locale = ref.watch(l10nProvider).$meta.locale.flutterLocale;

    return switch (startup) {
      AsyncData() => MaterialApp.router(
          locale: locale,
          routerConfig: router,
          theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
        ),
      _ => const SizedBox()
    };
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/features/settings/language.dart';
import 'package:npm/features/settings/theme.dart';
import 'package:npm/router.dart';
import 'package:slang_flutter/slang_flutter.dart';

void main() => runApp(const ProviderScope(child: App()));

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final theme = ref.watch(themeProvider);
    final locale = ref.watch(l10nProvider).$meta.locale.flutterLocale;

    return MaterialApp.router(
      locale: locale,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: theme,
    );
  }
}

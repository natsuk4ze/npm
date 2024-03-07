import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/app.dart';
import 'package:npm/util/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(ProviderScope(overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
  ], child: const App()));
}

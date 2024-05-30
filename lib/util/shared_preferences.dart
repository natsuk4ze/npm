import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    ref.watch(sharedPreferencesInitializerProvider).requireValue;

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferencesInitializer(
        SharedPreferencesInitializerRef ref) async =>
    SharedPreferences.getInstance();

import 'package:npm/util/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_mode.g.dart';

@riverpod
class IsDarkMode extends _$IsDarkMode {
  static const _key = 'isDarkMode';
  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider).requireValue;
    return prefs.getBool(_key) ?? false;
  }

  Future<void> toggle() async {
    final prefs = ref.read(sharedPreferencesProvider).requireValue;
    await prefs.setBool(_key, !state);
    ref.invalidateSelf();
  }
}

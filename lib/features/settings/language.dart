import 'package:npm/l10n/strings.g.dart';
import 'package:npm/util/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language.g.dart';

@riverpod
StringsEn l10n(L10nRef ref) => ref.watch(languageProvider).stringsEn;

@riverpod
class Language extends _$Language {
  static const _key = 'language';
  @override
  LanguageType build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return LanguageType.fromName(prefs.getString(_key) ?? LanguageType.en.name);
  }

  Future<void> update(LanguageType type) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(_key, type.name);
    ref.invalidateSelf();
  }
}

enum LanguageType {
  en,
  ja;

  StringsEn get stringsEn => switch (this) {
        ja => AppLocale.ja.build(),
        en => AppLocale.en.build(),
      };

  static LanguageType fromName(String name) =>
      LanguageType.values.firstWhere((e) => e.name == name);

  @override
  String toString() => switch (this) {
        en => 'English',
        ja => '日本語',
      };
}

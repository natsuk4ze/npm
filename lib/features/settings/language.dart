import 'package:npm/i18n/strings.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language.g.dart';

@riverpod
StringsEn translation(TranslationRef ref) =>
    switch (ref.watch(languageProvider)) {
      LanguageType.ja => AppLocale.ja.build(),
      LanguageType.en => AppLocale.en.build(),
    };

@riverpod
class Language extends _$Language {
  @override
  LanguageType build() => LanguageType.en;

  void update(LanguageType type) => state = type;
}

enum LanguageType {
  en,
  ja;

  @override
  String toString() => switch (this) {
        en => 'English',
        ja => '日本語',
      };
}

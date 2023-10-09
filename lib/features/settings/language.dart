import 'package:npm/i18n/strings.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language.g.dart';

@riverpod
StringsEn translation(TranslationRef ref) =>
    ref.watch(languageProvider).stringsEn;

@riverpod
class Language extends _$Language {
  @override
  Languages build() => Languages.en;

  void update(Languages language) => state = language;
}

enum Languages {
  en,
  ja;

  StringsEn get stringsEn => switch (this) {
        ja => AppLocale.ja.build(),
        en => AppLocale.en.build(),
      };

  @override
  String toString() => switch (this) {
        en => 'English',
        ja => '日本語',
      };
}

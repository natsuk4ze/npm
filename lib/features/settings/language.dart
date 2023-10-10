import 'package:npm/l10n/strings.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language.g.dart';

@riverpod
StringsEn l10n(L10nRef ref) => ref.watch(languageProvider).stringsEn;

@riverpod
class Language extends _$Language {
  @override
  LanguageType build() => LanguageType.en;

  void update(LanguageType type) => state = type;
}

enum LanguageType {
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

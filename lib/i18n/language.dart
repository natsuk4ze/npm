import 'package:npm/i18n/strings.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language.g.dart';

@riverpod
translation(TranslationRef ref) {
  final lan = ref.watch(languageProvider);
  switch (lan) {
    case LanguageType.ja:
      return AppLocale.ja.build();
    default:
      return AppLocale.en.build();
  }
}

@riverpod
LanguageType language(LanguageRef ref) => LanguageType.ja;

enum LanguageType { en, ja }

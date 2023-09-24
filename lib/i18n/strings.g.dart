/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 22 (11 per locale)
///
/// Built on 2023-09-24 at 15:30 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, StringsEn> {
	en(languageCode: 'en', build: StringsEn.build),
	ja(languageCode: 'ja', build: StringsJa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, StringsEn> build;
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class StringsEn implements BaseTranslations<AppLocale, StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final StringsEn _root = this; // ignore: unused_field

	// Translations
	late final StringsPackagesPageEn packagesPage = StringsPackagesPageEn._(_root);
	late final StringsPackageDetailsPageEn packageDetailsPage = StringsPackageDetailsPageEn._(_root);
	late final StringsSettingsPageEn settingsPage = StringsSettingsPageEn._(_root);
	late final StringsBottomNaviBarEn bottomNaviBar = StringsBottomNaviBarEn._(_root);
}

// Path: packagesPage
class StringsPackagesPageEn {
	StringsPackagesPageEn._(this._root);

	final StringsEn _root; // ignore: unused_field

	// Translations
	String get searchPackages => 'Search Packages';
	String get packageNotFound => 'Package not found.';
}

// Path: packageDetailsPage
class StringsPackageDetailsPageEn {
	StringsPackageDetailsPageEn._(this._root);

	final StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Details';
	String get homepage => 'Homepage';
	String get repository => 'Repository';
}

// Path: settingsPage
class StringsSettingsPageEn {
	StringsSettingsPageEn._(this._root);

	final StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get language => 'Language';
	String get darkMode => 'Dark Mode';
	String get report => 'Report issues';
}

// Path: bottomNaviBar
class StringsBottomNaviBarEn {
	StringsBottomNaviBarEn._(this._root);

	final StringsEn _root; // ignore: unused_field

	// Translations
	String get search => 'Search';
	String get settings => 'Settings';
}

// Path: <root>
class StringsJa implements StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	StringsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final StringsJa _root = this; // ignore: unused_field

	// Translations
	@override late final StringsPackagesPageJa packagesPage = StringsPackagesPageJa._(_root);
	@override late final StringsPackageDetailsPageJa packageDetailsPage = StringsPackageDetailsPageJa._(_root);
	@override late final StringsSettingsPageJa settingsPage = StringsSettingsPageJa._(_root);
	@override late final StringsBottomNaviBarJa bottomNaviBar = StringsBottomNaviBarJa._(_root);
}

// Path: packagesPage
class StringsPackagesPageJa implements StringsPackagesPageEn {
	StringsPackagesPageJa._(this._root);

	@override final StringsJa _root; // ignore: unused_field

	// Translations
	@override String get searchPackages => 'パッケージを検索';
	@override String get packageNotFound => 'パッケージが見つかりません。';
}

// Path: packageDetailsPage
class StringsPackageDetailsPageJa implements StringsPackageDetailsPageEn {
	StringsPackageDetailsPageJa._(this._root);

	@override final StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '詳細';
	@override String get homepage => 'ホームページ';
	@override String get repository => 'リポジトリ';
}

// Path: settingsPage
class StringsSettingsPageJa implements StringsSettingsPageEn {
	StringsSettingsPageJa._(this._root);

	@override final StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override String get language => '言語';
	@override String get darkMode => 'ダークモード';
	@override String get report => '問題を報告';
}

// Path: bottomNaviBar
class StringsBottomNaviBarJa implements StringsBottomNaviBarEn {
	StringsBottomNaviBarJa._(this._root);

	@override final StringsJa _root; // ignore: unused_field

	// Translations
	@override String get search => '探す';
	@override String get settings => '設定';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'packagesPage.searchPackages': return 'Search Packages';
			case 'packagesPage.packageNotFound': return 'Package not found.';
			case 'packageDetailsPage.title': return 'Details';
			case 'packageDetailsPage.homepage': return 'Homepage';
			case 'packageDetailsPage.repository': return 'Repository';
			case 'settingsPage.title': return 'Settings';
			case 'settingsPage.language': return 'Language';
			case 'settingsPage.darkMode': return 'Dark Mode';
			case 'settingsPage.report': return 'Report issues';
			case 'bottomNaviBar.search': return 'Search';
			case 'bottomNaviBar.settings': return 'Settings';
			default: return null;
		}
	}
}

extension on StringsJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'packagesPage.searchPackages': return 'パッケージを検索';
			case 'packagesPage.packageNotFound': return 'パッケージが見つかりません。';
			case 'packageDetailsPage.title': return '詳細';
			case 'packageDetailsPage.homepage': return 'ホームページ';
			case 'packageDetailsPage.repository': return 'リポジトリ';
			case 'settingsPage.title': return '設定';
			case 'settingsPage.language': return '言語';
			case 'settingsPage.darkMode': return 'ダークモード';
			case 'settingsPage.report': return '問題を報告';
			case 'bottomNaviBar.search': return '探す';
			case 'bottomNaviBar.settings': return '設定';
			default: return null;
		}
	}
}

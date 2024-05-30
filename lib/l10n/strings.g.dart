/// Generated file. Do not edit.
///
/// Original: lib/l10n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 38 (19 per locale)
///
/// Built on 2024-05-30 at 06:30 UTC

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
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ja(languageCode: 'ja', build: StringsJa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
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
typedef StringsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final StringsPackagesPageEn packagesPage = StringsPackagesPageEn._(_root);
	late final StringsPackageDetailsPageEn packageDetailsPage = StringsPackageDetailsPageEn._(_root);
	late final StringsSettingsPageEn settingsPage = StringsSettingsPageEn._(_root);
	late final StringsNaviBarEn naviBar = StringsNaviBarEn._(_root);
}

// Path: packagesPage
class StringsPackagesPageEn {
	StringsPackagesPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get searchPackages => 'Search Packages';
	String get sortPackages => 'Sort Packages';
	String get packageNotFound => 'Package not found.';
	late final StringsPackagesPageScoreEn score = StringsPackagesPageScoreEn._(_root);
}

// Path: packageDetailsPage
class StringsPackageDetailsPageEn {
	StringsPackageDetailsPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Details';
	String get homepage => 'Homepage';
	String get repository => 'Repository';
	String get keywords => 'Keywords';
	String get license => 'License';
}

// Path: settingsPage
class StringsSettingsPageEn {
	StringsSettingsPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get language => 'Language';
	String get darkMode => 'Dark Mode';
	String get report => 'Report issues';
	String get license => 'License';
}

// Path: naviBar
class StringsNaviBarEn {
	StringsNaviBarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get search => 'Search';
	String get packages => 'Packages';
	String get settings => 'Settings';
}

// Path: packagesPage.score
class StringsPackagesPageScoreEn {
	StringsPackagesPageScoreEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get popularity => 'Popularity';
	String get quality => 'Quality';
	String get maintenance => 'Maintenance';
}

// Path: <root>
class StringsJa implements Translations {
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
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final StringsJa _root = this; // ignore: unused_field

	// Translations
	@override late final StringsPackagesPageJa packagesPage = StringsPackagesPageJa._(_root);
	@override late final StringsPackageDetailsPageJa packageDetailsPage = StringsPackageDetailsPageJa._(_root);
	@override late final StringsSettingsPageJa settingsPage = StringsSettingsPageJa._(_root);
	@override late final StringsNaviBarJa naviBar = StringsNaviBarJa._(_root);
}

// Path: packagesPage
class StringsPackagesPageJa implements StringsPackagesPageEn {
	StringsPackagesPageJa._(this._root);

	@override final StringsJa _root; // ignore: unused_field

	// Translations
	@override String get searchPackages => 'パッケージを検索';
	@override String get sortPackages => 'パッケージを並べ替え';
	@override String get packageNotFound => 'パッケージが見つかりません。';
	@override late final StringsPackagesPageScoreJa score = StringsPackagesPageScoreJa._(_root);
}

// Path: packageDetailsPage
class StringsPackageDetailsPageJa implements StringsPackageDetailsPageEn {
	StringsPackageDetailsPageJa._(this._root);

	@override final StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '詳細';
	@override String get homepage => 'ホームページ';
	@override String get repository => 'リポジトリ';
	@override String get keywords => 'キーワード';
	@override String get license => 'ライセンス';
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
	@override String get license => 'ライセンス';
}

// Path: naviBar
class StringsNaviBarJa implements StringsNaviBarEn {
	StringsNaviBarJa._(this._root);

	@override final StringsJa _root; // ignore: unused_field

	// Translations
	@override String get search => '探す';
	@override String get packages => 'パッケージ一覧';
	@override String get settings => '設定';
}

// Path: packagesPage.score
class StringsPackagesPageScoreJa implements StringsPackagesPageScoreEn {
	StringsPackagesPageScoreJa._(this._root);

	@override final StringsJa _root; // ignore: unused_field

	// Translations
	@override String get popularity => '人気';
	@override String get quality => '品質';
	@override String get maintenance => 'メンテナンス';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'packagesPage.searchPackages': return 'Search Packages';
			case 'packagesPage.sortPackages': return 'Sort Packages';
			case 'packagesPage.packageNotFound': return 'Package not found.';
			case 'packagesPage.score.popularity': return 'Popularity';
			case 'packagesPage.score.quality': return 'Quality';
			case 'packagesPage.score.maintenance': return 'Maintenance';
			case 'packageDetailsPage.title': return 'Details';
			case 'packageDetailsPage.homepage': return 'Homepage';
			case 'packageDetailsPage.repository': return 'Repository';
			case 'packageDetailsPage.keywords': return 'Keywords';
			case 'packageDetailsPage.license': return 'License';
			case 'settingsPage.title': return 'Settings';
			case 'settingsPage.language': return 'Language';
			case 'settingsPage.darkMode': return 'Dark Mode';
			case 'settingsPage.report': return 'Report issues';
			case 'settingsPage.license': return 'License';
			case 'naviBar.search': return 'Search';
			case 'naviBar.packages': return 'Packages';
			case 'naviBar.settings': return 'Settings';
			default: return null;
		}
	}
}

extension on StringsJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'packagesPage.searchPackages': return 'パッケージを検索';
			case 'packagesPage.sortPackages': return 'パッケージを並べ替え';
			case 'packagesPage.packageNotFound': return 'パッケージが見つかりません。';
			case 'packagesPage.score.popularity': return '人気';
			case 'packagesPage.score.quality': return '品質';
			case 'packagesPage.score.maintenance': return 'メンテナンス';
			case 'packageDetailsPage.title': return '詳細';
			case 'packageDetailsPage.homepage': return 'ホームページ';
			case 'packageDetailsPage.repository': return 'リポジトリ';
			case 'packageDetailsPage.keywords': return 'キーワード';
			case 'packageDetailsPage.license': return 'ライセンス';
			case 'settingsPage.title': return '設定';
			case 'settingsPage.language': return '言語';
			case 'settingsPage.darkMode': return 'ダークモード';
			case 'settingsPage.report': return '問題を報告';
			case 'settingsPage.license': return 'ライセンス';
			case 'naviBar.search': return '探す';
			case 'naviBar.packages': return 'パッケージ一覧';
			case 'naviBar.settings': return '設定';
			default: return null;
		}
	}
}

/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 20 (10 per locale)
///
/// Built on 2023-09-24 at 06:50 UTC

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
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	ja(languageCode: 'ja', build: _StringsJa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
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
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsPackagesPageEn packagesPage = _StringsPackagesPageEn._(_root);
	late final _StringsPackageDetailsPageEn packageDetailsPage = _StringsPackageDetailsPageEn._(_root);
	late final _StringsSettingsPageEn settingsPage = _StringsSettingsPageEn._(_root);
	late final _StringsBottomNaviBarEn bottomNaviBar = _StringsBottomNaviBarEn._(_root);
}

// Path: packagesPage
class _StringsPackagesPageEn {
	_StringsPackagesPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get searchPackages => 'Search Packages';
	String get packageNotFound => 'Package not found.';
}

// Path: packageDetailsPage
class _StringsPackageDetailsPageEn {
	_StringsPackageDetailsPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Details';
	String get homepage => 'Homepage';
	String get repository => 'Repository';
}

// Path: settingsPage
class _StringsSettingsPageEn {
	_StringsSettingsPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get language => 'Language';
	String get darkMode => 'Dark Mode';
}

// Path: bottomNaviBar
class _StringsBottomNaviBarEn {
	_StringsBottomNaviBarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get search => 'Search';
	String get settings => 'Settings';
}

// Path: <root>
class _StringsJa implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsJa _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsPackagesPageJa packagesPage = _StringsPackagesPageJa._(_root);
	@override late final _StringsPackageDetailsPageJa packageDetailsPage = _StringsPackageDetailsPageJa._(_root);
	@override late final _StringsSettingsPageJa settingsPage = _StringsSettingsPageJa._(_root);
	@override late final _StringsBottomNaviBarJa bottomNaviBar = _StringsBottomNaviBarJa._(_root);
}

// Path: packagesPage
class _StringsPackagesPageJa implements _StringsPackagesPageEn {
	_StringsPackagesPageJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get searchPackages => 'パッケージを検索';
	@override String get packageNotFound => 'パッケージが見つかりません。';
}

// Path: packageDetailsPage
class _StringsPackageDetailsPageJa implements _StringsPackageDetailsPageEn {
	_StringsPackageDetailsPageJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '詳細';
	@override String get homepage => 'ホームページ';
	@override String get repository => 'リポジトリ';
}

// Path: settingsPage
class _StringsSettingsPageJa implements _StringsSettingsPageEn {
	_StringsSettingsPageJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get title => '設定';
	@override String get language => '言語';
	@override String get darkMode => 'ダークモード';
}

// Path: bottomNaviBar
class _StringsBottomNaviBarJa implements _StringsBottomNaviBarEn {
	_StringsBottomNaviBarJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get search => '探す';
	@override String get settings => '設定';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
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
			case 'bottomNaviBar.search': return 'Search';
			case 'bottomNaviBar.settings': return 'Settings';
			default: return null;
		}
	}
}

extension on _StringsJa {
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
			case 'bottomNaviBar.search': return '探す';
			case 'bottomNaviBar.settings': return '設定';
			default: return null;
		}
	}
}

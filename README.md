# 📦 npm client
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/38b5b48aa5e24a229b267c0c3a134bbe)](https://app.codacy.com/gh/natsuk4ze/npm/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![CodeFactor](https://www.codefactor.io/repository/github/natsuk4ze/npm/badge)](https://www.codefactor.io/repository/github/natsuk4ze/npm)
![Test](https://github.com/natsuk4ze/npm/actions/workflows/ci.yml/badge.svg?branch=master)

## Push ⭐️ if you like, Thank you シ

### A [npm](https://www.npmjs.com) client app as minimal project example with modern flutter coding style

### Using
-  *hooks_riverpod* for state management
-  *freezed* for serializing (deserializing) json objects
-  *dio* for network request
-  *shared_preferences* for local database

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/example.gif" width=280 alt="example"/>

## How to install

1. install [flutter](https://docs.flutter.dev/get-started/install)
2. clone this repository
3. run `cd $PATH_TO_REPOSITORY`
4. run `flutter pub get`
5. run `dart run build_runner build`
6. run `dart run slang`
7. run `flutter run`

New to flutter? See: [How to install flutter app on your device](https://www.youtube.com/watch?v=aohkII1C4JY)

## Features

### 🛜 Real time fetch
Real-time fetching with *dio* and *riverpod*.
Listen to `TextEditingController` to rebuild the widget.

<details>
<summary>Show codes</summary>

```dart
final searchController = useTextEditingController(text: initialSearchText);
useListenable(searchController);
```
See: [packages_page.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/packages/packages_page.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/real_time_fetch.gif" width=200 alt="Real time fetch"/>

### 👌 Pull to reflesh
Pull to reflaseh with `RefleshIndicator`.
By returning `.future` to `onRefresh`, the indicator will continue to be displayed until the data fetching is complete.

<details>
<summary>Show codes</summary>

```dart
RefreshIndicator(
  onRefresh: () async => ref.refresh(packagesProvider(
    search: searchText,
    debounce: false,
  ).future),
  child: ListView.separated(
    separatorBuilder: (_, __) => const Divider(),
    itemCount: sortedPackages.length,
    itemBuilder: (_, int i) => PackageItem(sortedPackages[i]),
  ),
);
```
See: [packages_page.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/packages/packages_page.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/pull_to_reflesh.gif" width=200 alt="Pull to reflesh"/>

### 📊 Sort
Sort with *riverpod*.

<details>
<summary>Show codes</summary>

```dart
@riverpod
class Sort extends _$Sort {
  @override
  ScoreType? build() => null;

  void update(ScoreType? type) => state = type;
}

final sortedPackages = sort == null
    ? List.of(packages)
    : packages.sortedByCompare(
        (package) => sort.getValue(package.score),
        (a, b) => b.compareTo(a));
```
See: [packages_page.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/packages/packages_page.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/sort.gif" width=200 alt="Pull to reflesh"/>

### ☁️ Empty state
Switching widget according to status with `AsyncValue`.

<details>
<summary>Show codes</summary>

```dart
return sortedPackages.isEmpty
    ? SingleChildScrollView(
        child: EmptyImage(text: l10n.packagesPage.packageNotFound),
      )
    : RefreshIndicator(
        onRefresh: () async => ref.refresh(packagesProvider(
          search: searchText,
          debounce: false,
        ).future),
        child: ListView.separated(
          separatorBuilder: (_, __) => const Divider(),
          itemCount: sortedPackages.length,
          itemBuilder: (_, int i) => PackageItem(sortedPackages[i]),
        ),
      );
```
See: [packages_page.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/packages/packages_page.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/empty_state.gif" width=200 alt="Empty state"/>

### 🪽 Jump to repository
Jumping to repository with *url_launcher*.

<details>
<summary>Show codes</summary>

```dart
class LinkText extends StatelessWidget {
  const LinkText(
    this.url, {
    this.text,
    super.key,
  });

  final String? text;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => launchUrl(Uri.parse(url)),
      child: Text(
        text ?? url,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
```
See: [link_text.dart](https://github.com/natsuk4ze/npm/blob/master/lib/common_widgets/link_text.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/jump_to_repo.gif" width=200 alt="Jump to repository"/>

### 🔍 See package details
Getting package details for requesting api with *dio* and *freezed*.

<details>
<summary>Show codes</summary>

```dart
@riverpod
Dio dio(DioRef ref) => Dio();

@riverpod
Future<PackageDetails> packageDetails(PackageDetailsRef ref,
    {required String id}) async {
  final response = await ref.watch(dioProvider).getUri<Json>(
        Uri.parse('https://registry.npmjs.org/$id'),
      );
  return PackageDetails.fromJson(response.data!);
}

@freezed
class PackageDetails with _$PackageDetails {
  const PackageDetails._();

  const factory PackageDetails({
    required final String name,
    final String? description,
    final String? homepage,
    final String? repository,
    final String? readme,
    final List<String>? keywords,
    final String? license,
  }) = _PackageDetails;

  factory PackageDetails.fromJson(Json json) {
    final git = json['repository']?['url'] as String?;

    return PackageDetails(
      name: json['name'],
      description: json['description'],
      keywords: ListX.fromOrNull<String>(json['keywords']),
      license: json['license'],
      homepage: json['homepage'],
      repository: git == null ? null : Format.urlFromGit(git),
      readme: json['readme'],
    );
  }
}
```

See:
- [dio.dart](https://github.com/natsuk4ze/npm/blob/master/lib/util/dio.dart)
- [package_details.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/package_details/package_details.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/see_package_details.gif" width=200 alt="See package details"/>

### 🌙 Dark mode
Dynamic theming with *riverpod* and *shared_preferences*.
Use `ref.invalidateSelf()` for ssot design.

<details>
<summary>Show codes</summary>

```dart
@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    throw UnimplementedError('SharedPreferences is not overridden.');

@riverpod
class IsDarkMode extends _$IsDarkMode {
  static const _key = 'isDarkMode';
  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return prefs.getBool(_key) ?? false;
  }

  Future<void> toggle() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(_key, !state);
    ref.invalidateSelf();
  }
}
```

See:
- [shared_preferences.dart](https://github.com/natsuk4ze/npm/blob/master/lib/util/shared_preferences.dart)
- [dark_mode.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/settings/dark_mode.dart)
</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/dark_mode.gif" width=200 alt="Dark mode"/>

### 🗣️ Localization
Dynamic localization with *slang*, *riverpod* and *shared_preferences*.
Use `ref.invalidateSelf()` for ssot design.

<details>
<summary>Show codes</summary>

```dart
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
```

See:
- [shared_preferences.dart](https://github.com/natsuk4ze/npm/blob/master/lib/util/shared_preferences.dart)
- [language.dart](https://github.com/natsuk4ze/npm/blob/master/lib/settings/language.dart)
- [i18n](https://github.com/natsuk4ze/npm/blob/master/lib/i18n)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/localization.gif" width=200 alt="Localization"/>

### 🪄 Responsive design
Dynamic layouting for diffrent screen sizes.

<details>
<summary>Show codes</summary>

```dart
extension BuildContextX on BuildContext {
  bool get isLargeScreen => MediaQuery.of(this).size.width > 600;
}

child: context.isLargeScreen
    ? Row(
        children: [
          const _SortPanel(),
          const VerticalDivider(),
          Expanded(
            child: _PackageItems(searchText: searchController.text),
          ),
        ],
      )
    : NestedScrollView(
        headerSliverBuilder: (_, __) => [
          const SliverAppBar(
            surfaceTintColor: Colors.transparent,
            toolbarHeight: 200,
            title: _SortPanel(),
          )
        ],
        body: _PackageItems(searchText: searchController.text),
      ),
```

See: 
- [extensions.dart](https://github.com/natsuk4ze/npm/blob/master/lib/util/extensions.dart)
- [packages_page.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/packages/packages_page.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/responsive.gif" height=200 alt="Responsive"/>

### ✅ Auto testing
Auto testing with *github actions*.

<details>
<summary>Show codes</summary>

```yml
jobs:
  test:
    timeout-minutes: 30
    strategy:
      fail-fast: false
    runs-on: macos-latest
    steps:
      - name: Check out
        uses: actions/checkout@v4

      - name: Setup JDK
        uses: actions/setup-java@v3
        with:
          java-version: 11
          distribution: temurin
          cache: gradle

      - name: Setup Flutter SDK
        timeout-minutes: 10
        uses: subosito/flutter-action@v2
        with:
          channel: beta

      - name: Flutter Pub get
        run: flutter pub get

      - name: Flutter Analyze
        run: flutter analyze

      - name: Unit Test
        timeout-minutes: 5
        run: flutter test test/unit_test.dart

      - name: Widget Test
        timeout-minutes: 5
        run: flutter test test/widget_test.dart

      - name: Build iOS
        timeout-minutes: 10
        run: flutter build ios --no-codesign

      - name: Build Android
        timeout-minutes: 10
        run: flutter build appbundle
```

See:
- [unit_test](https://github.com/natsuk4ze/npm/blob/master/test/unit_test.dart)
- [widget_test](https://github.com/natsuk4ze/npm/blob/master/test/widget_test.dart)
- [workflows](https://github.com/natsuk4ze/npm/actions)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/auto_test.gif" width=330 alt="Auto test"/>

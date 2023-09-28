# 📦 npm client
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/38b5b48aa5e24a229b267c0c3a134bbe)](https://app.codacy.com/gh/natsuk4ze/npm/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![CodeFactor](https://www.codefactor.io/repository/github/natsuk4ze/npm/badge)](https://www.codefactor.io/repository/github/natsuk4ze/npm)
![Test](https://github.com/natsuk4ze/npm/actions/workflows/ci.yml/badge.svg?branch=master)


A [npm](https://www.npmjs.com) client app with modern flutter coding style.

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/example.gif" width=280 alt="example"/>

## How to install

1. install [flutter](https://docs.flutter.dev/get-started/install)
2. clone this repository
3. run `flutter pub get`
4. run `dart run slang`
5. run `dart run build_runner build`
6. run `flutter run`

## Features

### 🛜 Real time fetch
Real-time fetching with *dio* and *riverpod*.
Listen to `TextEditingController` to rebuild the widget.

<details>
<summary>Show codes</summary>

```dart
final controller = useTextEditingController(text: 'color');
final packages = ref.watch(packagesProvider(search: controller.text));
useListenable(controller);
```
See: [packages_page.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/packages/packages_page.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/real_time_fetch.gif" width=200 alt="Real time fetch"/>

### 👌 Pull to reflesh
Pull to reflaseh with `RefleshIndicator`.

<details>
<summary>Show codes</summary>

```dart
return RefreshIndicator(
  onRefresh: () async {
    ref.invalidate(packagesProvider);
    await ref.read(
        packagesProvider(search: controller.text).future);
  },
  child: ListView.separated(
    separatorBuilder: (_, __) => const Divider(),
    itemCount: packages.length,
    itemBuilder: (_, int i) => PackageItem(packages[i]),
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
```
See: [packages_page.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/packages/packages_page.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/sort.gif" width=200 alt="Pull to reflesh"/>

### ☁️ Empty state
Switching widget according to status with `AsyncValue`.

<details>
<summary>Show codes</summary>

```dart
child: packages.when(
  data: (packages) {
    if (packages.isEmpty) return const _EmptyItem();
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(packagesProvider);
        await ref.read(
            packagesProvider(search: controller.text).future);
      },
      child: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: packages.length,
        itemBuilder: (_, int i) => PackageItem(packages[i]),
      ),
    );
  },
  error: (e, _) => Center(child: Text(e.toString())),
  loading: () =>
      const Center(child: CircularProgressIndicator()),
),
```
See: [packages_page.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/packages/packages_page.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/empty_state.gif" width=200 alt="Empty state"/>

### 🪽 Jump to repository
Jumping to repository with *url_launcher*.

<details>
<summary>Show codes</summary>

```dart
return GestureDetector(
  onTap: () => launchUrl(Uri.parse(url)),
  child: Text(
    text ?? url,
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    ),
  ),
);
```
See: [link_text.dart](https://github.com/natsuk4ze/npm/blob/master/lib/widgets/link_text.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/jump_to_repo.gif" width=200 alt="Jump to repository"/>

### 🔍 See package details
Getting package details for requesting api with *dio* and *freezed*.

<details>
<summary>Show codes</summary>

```dart
class Repository {
  final _dio = Dio();
  static const _baseUrl = 'https://registry.npmjs.org';

  Future<List<Package>> getPackges({required String search}) async {
    final response = await _dio.get('$_baseUrl/-/v1/search?text=$search');
    final List packages = response.data['objects'];
    return packages
        .map((package) =>
            Package.fromJson(package as Map<String, dynamic>))
        .toList();
  }

  Future<PackageDetails> getPackageDetails({required String id}) async {
    final response = await _dio.get('$_baseUrl/$id');
    return PackageDetails.fromJson(response.data);
  }
}
```

See:
- [repository.dart](https://github.com/natsuk4ze/npm/blob/master/lib/repository.dart)
- [package_details.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/package_details/package_details.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/see_package_details.gif" width=200 alt="See package details"/>

### 🌙 Dark mode
Dynamic theming with *riverpod*

<details>
<summary>Show codes</summary>

```dart
@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => false;

  void swich() => state = !state;
}
```

See: [theme.dart](https://github.com/natsuk4ze/npm/blob/master/lib/features/settings/theme.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/dark_mode.gif" width=200 alt="Dark mode"/>

### 🗣️ Localization
Dynamic localization with *slang* and *riverpod*.

<details>
<summary>Show codes</summary>

```dart
@riverpod
StringsEn translation(TranslationRef ref) {
  final lan = ref.watch(languageProvider);
  switch (lan) {
    case LanguageType.ja:
      return AppLocale.ja.build();
    default:
      return AppLocale.en.build();
  }
}

@riverpod
class Language extends _$Language {
  @override
  LanguageType build() => LanguageType.en;

  void update(LanguageType type) => state = type;
}
```

See:
- [language.dart](https://github.com/natsuk4ze/npm/blob/master/lib/settings/language.dart)
- [i18n](https://github.com/natsuk4ze/npm/blob/master/lib/i18n)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/localization.gif" width=200 alt="Localization"/>

### 🪄 Responsive Design
Dynamic layouting for diffrent screen sizes.

<details>
<summary>Show codes</summary>

```dart
largeScreen
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                child: Row(
                  children: [
                    sideNavigationBar ?? const SizedBox.shrink(),
                    const Gap(12),
                    const VerticalDivider(),
                    const Gap(12),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            bottomNavigationBar: bottomNavigationBar,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                child: child,
              ),
            ),
          )
```

See: [language.dart](https://github.com/natsuk4ze/npm/blob/master/lib/widgets/responsive_scaffold.dart)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/responsive.gif" width=400 alt="Responsive"/>

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

      - name: Build Web
        timeout-minutes: 10
        run: flutter build web
```

See:
- [test](https://github.com/natsuk4ze/npm/blob/master/test)
- [workflows](https://github.com/natsuk4ze/npm/actions)

</details>

<img src="https://github.com/natsuk4ze/npm/raw/master/assets/readme/auto_test.gif" width=330 alt="Auto test"/>

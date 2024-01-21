import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_mode.g.dart';

@riverpod
class IsDarkMode extends _$IsDarkMode {
  @override
  bool build() => true;

  void swich() => state = !state;
}

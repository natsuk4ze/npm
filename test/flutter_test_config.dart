import 'dart:async';
import 'package:golden_toolkit/golden_toolkit.dart';

/// Used for golden tests to load the app fonts before running the tests.
/// ref: https://pub.dev/packages/golden_toolkit
Future<void> testExecutable(FutureOr<void> Function() testMain) async =>
    GoldenToolkit.runWithConfiguration(
      () async {
        await loadAppFonts();
        return testMain();
      },
      config: GoldenToolkitConfiguration(
        enableRealShadows: true,
        defaultDevices: const [
          Device.phone,
          Device.iphone11,
        ],
      ),
    );

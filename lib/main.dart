import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:npm/app.dart';

void main() => runApp(
      ProviderScope(
        child: DevicePreview(
          enabled: kIsWeb,
          builder: (_) => const App(),
        ),
      ),
    );

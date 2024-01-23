import 'package:flutter/material.dart';
import 'package:npm/router.dart';

class GoSettingsButton extends StatelessWidget {
  const GoSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton.outlined(
        onPressed: () => const SettingsRoute().go(context),
        icon: const Icon(Icons.settings),
      ),
    );
  }
}

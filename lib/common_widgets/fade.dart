import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Fade extends HookWidget {
  const Fade({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final shouldShow = useState(false);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => shouldShow.value = true);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 280),
      opacity: shouldShow.value ? 1 : 0,
      child: child,
    );
  }
}

import 'package:flutter/widgets.dart';

class WidgetOrEmpty extends StatelessWidget {
  const WidgetOrEmpty({
    required this.shouldEmpty,
    required this.child,
    super.key,
  });

  final bool shouldEmpty;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return shouldEmpty ? const SizedBox.shrink() : child;
  }
}

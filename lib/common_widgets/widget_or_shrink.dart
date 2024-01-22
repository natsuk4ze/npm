import 'package:flutter/material.dart';

class WidgetOrShrink<T> extends StatelessWidget {
  final T? data;
  final Widget Function(T value) builder;

  const WidgetOrShrink({
    super.key,
    required this.data,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    if (data == null) return const SizedBox.shrink();
    return builder(data as T);
  }
}

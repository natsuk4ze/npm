import 'package:flutter/material.dart';

class WidgetOrShrink<T> extends StatelessWidget {
  final T? data;
  final Widget Function(T value) whenHasData;

  const WidgetOrShrink({
    super.key,
    required this.data,
    required this.whenHasData,
  });

  @override
  Widget build(BuildContext context) {
    if (data == null) return const SizedBox.shrink();
    return whenHasData(data as T);
  }
}

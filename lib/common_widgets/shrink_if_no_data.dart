import 'package:flutter/material.dart';

class ShrinkIfNoData<T> extends StatelessWidget {
  final T? data;
  final Widget Function(T value) whenHasData;

  const ShrinkIfNoData({
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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension BuildContextX on BuildContext {
  bool get isLargeScreen => MediaQuery.of(this).size.width > 600;
}

extension CancelTokenX on Ref {
  CancelToken get cancelToken {
    final cT = CancelToken();
    onDispose(cT.cancel);
    return cT;
  }
}

extension ListX on List {
  static List<T>? fromOrNull<T>(Iterable<dynamic>? source) {
    if (source == null) return null;
    return List<T>.from(source);
  }
}

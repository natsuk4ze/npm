import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    this.width,
    super.key,
  });

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/app/npm.png',
      width: width ?? 60,
      color: Theme.of(context).textTheme.titleLarge!.color,
    );
  }
}

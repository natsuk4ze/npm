import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/app/empty.png',
          width: 200,
        ),
        const Gap(20),
        Text(text)
      ],
    );
  }
}

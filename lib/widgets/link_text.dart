import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkText extends StatelessWidget {
  const LinkText(
    this.url, {
    this.text,
    super.key,
  });

  final String? text;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => launchUrl(Uri.parse(url)),
      child: Text(
        text ?? url,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

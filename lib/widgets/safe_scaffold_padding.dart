import 'package:flutter/material.dart';

class SafeScaffoldPadding extends StatelessWidget {
  const SafeScaffoldPadding({
    required this.child,
    this.bottomNavigationBar,
    this.appBar,
    super.key,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: child,
        ),
      ),
    );
  }
}

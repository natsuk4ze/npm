import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    required this.child,
    required this.sideNavigationBar,
    this.bottomNavigationBar,
    this.appBar,
    super.key,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget sideNavigationBar;

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return isLargeScreen
        ? _LargeScreenScaffold(
            sideNavigationBar: sideNavigationBar, child: child)
        : _SmallScreenScaffold(
            appBar: appBar,
            bottomNavigationBar: bottomNavigationBar,
            child: child,
          );
  }
}

class _LargeScreenScaffold extends StatelessWidget {
  const _LargeScreenScaffold({
    required this.sideNavigationBar,
    required this.child,
  });

  final Widget sideNavigationBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          child: Row(
            children: [
              sideNavigationBar,
              const Gap(12),
              const VerticalDivider(),
              const Gap(12),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

class _SmallScreenScaffold extends StatelessWidget {
  const _SmallScreenScaffold({
    required this.child,
    required this.appBar,
    required this.bottomNavigationBar,
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

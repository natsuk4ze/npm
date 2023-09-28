import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    required this.child,
    this.bottomNavigationBar,
    this.sideNavigationBar,
    this.appBar,
    super.key,
  });

  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? sideNavigationBar;

  @override
  Widget build(BuildContext context) {
    final largeScreen = MediaQuery.of(context).size.width > 600;

    return largeScreen
        ? Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                child: Row(
                  children: [
                    sideNavigationBar ?? const SizedBox.shrink(),
                    const Gap(12),
                    const VerticalDivider(),
                    const Gap(12),
                    Expanded(child: child),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: appBar,
            bottomNavigationBar: bottomNavigationBar,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                child: child,
              ),
            ),
          );
  }
}

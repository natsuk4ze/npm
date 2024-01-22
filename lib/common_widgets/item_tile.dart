import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.icon,
    required this.title,
    required this.trailing,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final Widget trailing;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(icon),
              const Gap(20),
              Text(title),
              const Spacer(),
              const Gap(20),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}

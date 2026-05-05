import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';

class SheetOptionWidget extends StatelessWidget {
  const SheetOptionWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ShadCard(
        rowMainAxisSize: .max,
        rowMainAxisAlignment: .start,
        rowCrossAxisAlignment: .center,
        leading: Row(
          children: [
            Icon(icon, size: Spaces.xl),
            const SizedBox(width: Spaces.lg),
          ],
        ),
        title: Text(title),
        description: Text(description),
      ),
    );
  }
}

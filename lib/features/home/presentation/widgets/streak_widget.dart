import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/extensions/build_context.dart';

class StreakWidget extends StatelessWidget {
  const StreakWidget({
    super.key,
    this.streak = 2,
  });

  final int streak;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${context.l10n.streak}: $streak ${context.l10n.daysStrong}',
          style: ShadTheme.of(context).textTheme.p,
        ),
      ],
    );
  }
}

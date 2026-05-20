import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../constants/spaces.dart';
import '../../extensions/build_context.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({super.key, this.text, required this.onPressed});

  final String? text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spaces.all),
        child: Column(
          spacing: Spaces.lg,
          mainAxisAlignment: .center,
          children: [
            Text(
              text ?? context.l10n.problemOccurred,
              style: ShadTheme.of(context).textTheme.p,
            ),
            ShadButton(
              leading: const Icon(LucideIcons.loader),
              onPressed: onPressed,
              child: Text(context.l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}

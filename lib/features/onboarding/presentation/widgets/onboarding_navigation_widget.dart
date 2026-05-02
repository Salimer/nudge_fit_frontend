import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/state/routes_state.dart';
import '../../../../core/constants/spaces.dart';

class OnboardingNavigationWidget extends StatelessWidget {
  const OnboardingNavigationWidget({
    super.key,
    this.canGoNext = true,
    this.onBack,
    required this.onNext,
  });

  final bool canGoNext;
  final void Function()? onBack;
  final void Function() onNext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Spaces.lg,
        right: Spaces.lg,
        bottom: Spaces.xl,
      ),
      child: Consumer(
        builder: (context, ref, child) {
          return Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onBack ?? () => ref.read(routesProvider).pop(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: Spaces.md),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(context.l10n.back),
                ),
              ),
              const SizedBox(width: Spaces.md),
              Expanded(
                child: FilledButton(
                  onPressed: canGoNext ? onNext : null,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: Spaces.md),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(context.l10n.next), // Or context.l10n.next
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

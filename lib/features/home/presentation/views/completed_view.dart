import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/extensions/build_context.dart';
import '../../use_cases/home_use_case.dart';
import '../widgets/streak_widget.dart';

class CompletedView extends StatelessWidget {
  const CompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPadding.vertical,
          horizontal: AppPadding.horizontal,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [Text(context.l10n.homeCompletedGreeting('name'))],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      context.l10n.homeCompletedTitle,
                      style: FTheme.of(context).typography.xl3.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const StreakWidget(streak: 4),
                const SizedBox(height: 20),
                CelebratingMighty(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                ),
                const SizedBox(height: 20),
                Consumer(
                  builder: (context, ref, _) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.l10n.homeCompletedStatus(
                            _getLocalizedDay(ref, 'Monday'),
                          ),
                          style: FTheme.of(context).typography.xl
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          context.l10n.homeCompletedBody(
                            _getLocalizedDay(ref, 'Wednesday'),
                          ),
                          style: FTheme.of(context).typography.sm,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getLocalizedDay(WidgetRef ref, String day) {
    return ref.read(homeUseCaseProvider).localizedDay(day);
  }
}

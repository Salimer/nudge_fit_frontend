import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/extensions/build_context.dart';
import '../widgets/streak_widget.dart';

class RestDayView extends StatelessWidget {
  const RestDayView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.horizontal,
          vertical: AppPadding.vertical,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      context.l10n.homeRestGreeting('name'),
                      style: FTheme.of(context).typography.lg,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      context.l10n.homeRestTitle,
                      style: FTheme.of(context).typography.xl3.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const StreakWidget(streak: 2),
                RestingMighty(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: FTheme.of(context).colors.border),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        context.l10n.homeRestLabel,
                        style: FTheme.of(context).typography.xl3,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        context.l10n.homeRestBody,
                        style: FTheme.of(context).typography.lg,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

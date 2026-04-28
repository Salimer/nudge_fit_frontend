import 'package:flutter/material.dart';

import '../../../../core/common/widgets/mighty_home.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/extensions/build_context.dart';

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
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      context.l10n.homeRestTitle,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      '${context.l10n.streak}: 0 ${context.l10n.daysStrong}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                RestingMighty(),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(
                        context.l10n.homeRestLabel,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(height: 20),
                      Text(
                        context.l10n.homeRestBody,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: .center,
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

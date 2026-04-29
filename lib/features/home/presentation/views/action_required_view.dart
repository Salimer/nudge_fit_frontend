import 'package:flutter/material.dart';

import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/app_padding.dart';
import '../../../../core/extensions/build_context.dart';
import '../widgets/started_widget.dart';
import '../widgets/streak_widget.dart';

class ActionRequiredView extends StatelessWidget {
  const ActionRequiredView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.vertical,
          horizontal: AppPadding.horizontal,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [Text(context.l10n.homeRestGreeting('name'))]),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      context.l10n.homeActionTitle,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                StreakWidget(),
                SizedBox(height: 20),
                SeriousMighty(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.5,
                  maxWidth: MediaQuery.sizeOf(context).width * 0.7,
                ),
                SizedBox(height: 20),
                Text(
                  context.l10n.actionAnticipationMsg,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    crossAxisAlignment: .end,
                    mainAxisSize: .min,
                    children: [
                      Column(
                        mainAxisSize: .max,
                        mainAxisAlignment: .end,
                        children: [Icon(Icons.lock_clock_rounded, size: 40)],
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            context.l10n.homeContractLabel,
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            context.l10n.homeContractTime('8:00 PM'),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(context.l10n.homeContractStatusPending),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                StartedWidget(onPressed: () {}),
                CustomTextButtonWidget(
                  text: context.l10n.btnSkip,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

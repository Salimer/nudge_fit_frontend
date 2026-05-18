import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/widgets/days_and_time_picker_widget.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../data/models/home_screen_model.dart';
import '../state/home_screen_state.dart';

class SetupRequiredView extends StatelessWidget {
  const SetupRequiredView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: Spaces.all),
        child: Consumer(
          builder: (context, ref, _) {
            final data =
                ref.read(homeScreenStateProvider).requireValue
                    as SetupRequiredModel;
            return Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spaces.horizontal,
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        context.l10n.homeSetupGreeting(data.username),
                        style: ShadTheme.of(context).textTheme.p,
                      ),
                      const SizedBox(height: Spaces.sm),
                      Text(
                        context.l10n.homeSetupTitle,
                        style: ShadTheme.of(context).textTheme.h2,
                      ),
                      const SizedBox(height: Spaces.lg),
                      const Center(child: ReadingMighty()),
                      const SizedBox(height: Spaces.lg),
                    ],
                  ),
                ),
                const DaysAndTimePickerWidget(),
                const SizedBox(height: Spaces.xl),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spaces.horizontal,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ShadButton(
                      onPressed: () {},
                      child: Text(context.l10n.homeSetupBtn),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

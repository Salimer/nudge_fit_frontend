import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forui/forui.dart';

import '../../../../core/common/state/days_and_time_picker_state.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/buttons.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../use_cases/onboarding_use_case.dart';
import '../state/onboarding_data_state.dart';

class OnboardingSecondScreen extends ConsumerStatefulWidget {
  const OnboardingSecondScreen({super.key});

  @override
  ConsumerState<OnboardingSecondScreen> createState() =>
      _OnboardingSecondScreenState();
}

class _OnboardingSecondScreenState
    extends ConsumerState<OnboardingSecondScreen> {
  late final TextEditingController _controller;
  late final Set<String> _selectedExcuses;
  final List<String> _customExcuses = [];
  late List<String> allExcuses;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _selectedExcuses = ref
        .read(onboardingDataStateProvider)
        .selectedExcuses
        .toSet();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> _getInitialExcuses(BuildContext context) {
    return {
      context.l10n.feelsLikeAChore,
      context.l10n.ateTooMuch,
      context.l10n.tooStressed,
      context.l10n.wokeUpLateAndRushed,
      context.l10n.notEnoughTime,
      context.l10n.isNotFunAnymore,
      ...ref.read(onboardingDataStateProvider).selectedExcuses,
    }.toList();
  }

  void _addCustomExcuse(String value) {
    final text = value.trim();
    if (allExcuses.contains(text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.l10n.excuseAlreadyExists),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    if (text.isNotEmpty) {
      setState(() {
        _customExcuses.add(text);
        _selectedExcuses.add(text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    allExcuses = {..._getInitialExcuses(context), ..._customExcuses}.toList();

    return FScaffold(
      header: const FHeader(title: Text('')),
      // Fixed Navigation Buttons
      footer: Consumer(
        builder: (context, ref, _) {
          ref.listen(daysAndTimePickerStateProvider, ((_, _) {}));
          return Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
            child: CustomElevatedButton1(
              text: context.l10n.next,
              onPressed: _selectedExcuses.isNotEmpty
                  ? () {
                      ref
                          .read(onboardingUseCaseProvider)
                          .leaveSecondOnboardingScreen(
                            _selectedExcuses.toList(),
                          );
                    }
                  : null,
            ),
          );
        },
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: NeutralMighty()),
              const SizedBox(height: 20),
              Text(
                context.l10n.whyDoYouUsuallySkip,
                style: FTheme.of(context).typography.xl2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: allExcuses.map((excuse) {
                  final isSelected = _selectedExcuses.contains(excuse);
                  return FTappable(
                    onPress: () {
                      setState(() {
                        if (isSelected) {
                          _selectedExcuses.remove(excuse);
                        } else {
                          _selectedExcuses.add(excuse);
                        }
                      });
                    },
                    builder: (context, variants, child) => FBadge(
                      variant: isSelected ? FBadgeVariant.primary : FBadgeVariant.outline,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isSelected) ...[
                            const Icon(
                              FIcons.check,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                          ],
                          Text(excuse),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              FTextField(
                control: FTextFieldControl.managed(controller: _controller),
                hint: context.l10n.other,
                prefixBuilder: (context, style, variants) =>
                    FTextField.prefixIconBuilder(context, style, variants, const Icon(FIcons.plus)),
                onSubmit: _addCustomExcuse,
              ),
              // Extra space so content doesn't get hidden behind the bottom buttons
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

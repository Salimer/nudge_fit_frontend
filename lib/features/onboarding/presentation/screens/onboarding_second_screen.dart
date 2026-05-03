import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
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
      // This is the Shadcn Toast way
      ShadToaster.of(context).show(
        ShadToast.destructive(
          description: Text(context.l10n.excuseAlreadyExists),
          showCloseIconOnlyWhenHovered: false,
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

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spaces.horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: NeutralMighty()),
              SizedBox(height: Spaces.xxl),
              Text(
                context.l10n.whyDoYouUsuallySkip,
                style: ShadTheme.of(context).textTheme.h3,
              ),
              const SizedBox(height: Spaces.lg),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: allExcuses.map((excuse) {
                  final isSelected = _selectedExcuses.contains(excuse);
                  return ChoiceChip(
                    checkmarkColor: ShadTheme.of(context).colorScheme.secondary,
                    label: Text(excuse),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        selected
                            ? _selectedExcuses.add(excuse)
                            : _selectedExcuses.remove(excuse);
                      });
                    },
                    selectedColor: ShadTheme.of(context).colorScheme.primary,
                    labelStyle: ShadTheme.of(context).textTheme.small,
                    showCheckmark: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? ShadTheme.of(context).colorScheme.primary
                            : ShadTheme.of(context).colorScheme.border,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: Spaces.lg),
              ShadInput(
                controller: _controller,
                placeholder: Text(context.l10n.other),
                leading: Padding(
                  padding: EdgeInsets.zero,
                  child: ShadIconButton(
                    icon: Icon(LucideIcons.plus),
                    onPressed: () => _addCustomExcuse(_controller.text),
                  ),
                ),
                // You don't need to define the border or fill color here
                // because ShadInput automatically pulls the "Zinc" style
                // and the radius from your global ShadThemeData.
                onSubmitted: (value) => _addCustomExcuse(value),
              ),
              // Extra space so content doesn't get hidden behind the bottom buttons
              const SizedBox(height: Spaces.lg),
              PrimaryButton(
                text: context.l10n.next,
                enabled: _selectedExcuses.isNotEmpty,
                onPressed: () {
                  ref
                      .read(onboardingUseCaseProvider)
                      .leaveSecondOnboardingScreen(_selectedExcuses.toList());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../use_cases/onboarding_use_case.dart';
import '../state/onboarding_data_state.dart';

class Onboarding4GoalsScreen extends ConsumerStatefulWidget {
  const Onboarding4GoalsScreen({super.key});

  @override
  ConsumerState<Onboarding4GoalsScreen> createState() =>
      _Onboarding4GoalsScreenState();
}

class _Onboarding4GoalsScreenState
    extends ConsumerState<Onboarding4GoalsScreen> {
  late final TextEditingController _controller;
  late final Set<String> _selectedGoals;
  final List<String> _customGoals = [];
  late List<String> allGoals;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _selectedGoals = ref.read(onboardingDataStateProvider).goals.toSet();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> _getInitialGoals(BuildContext context) {
    return {
      context.l10n.goalsBuildDiscipline,
      context.l10n.goalsLoseWeight,
      context.l10n.goalsGainMuscle,
      context.l10n.goalsFeelBetter,
      ...ref.read(onboardingDataStateProvider).goals,
    }.toList();
  }

  void _addCustomGoal(String value) {
    final text = value.trim();
    if (allGoals.contains(text)) {
      ShadToaster.of(context).show(
        ShadToast.destructive(
          alignment: .topCenter,
          description: Text(
            context.l10n.excuseAlreadyExists,
          ), // We can reuse this or add a new string if preferred
          showCloseIconOnlyWhenHovered: false,
          duration: Constants.errorToastDuration,
        ),
      );
      return;
    }
    if (text.isNotEmpty) {
      setState(() {
        _customGoals.add(text);
        _selectedGoals.add(text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(onboardingDataStateProvider, (_, _) {});

    allGoals = {..._getInitialGoals(context), ..._customGoals}.toList();
    final shadTheme = ShadTheme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Spaces.horizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: NeutralMighty()),
              const SizedBox(height: Spaces.xxl),
              Text(
                context.l10n.goalsPrompt,
                style: ShadTheme.of(context).textTheme.h3,
              ),
              const SizedBox(height: Spaces.lg),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: allGoals.map((goal) {
                  final isSelected = _selectedGoals.contains(goal);
                  return ChoiceChip(
                    showCheckmark: true,
                    selectedColor: shadTheme.primary,
                    backgroundColor: shadTheme.secondary,
                    checkmarkColor: shadTheme.secondary,
                    label: Text(goal),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        selected
                            ? _selectedGoals.add(goal)
                            : _selectedGoals.remove(goal);
                      });
                    },
                    labelStyle: ShadTheme.of(context).textTheme.small.copyWith(
                      color: isSelected
                          ? ShadTheme.of(context).colorScheme.secondary
                          : ShadTheme.of(context).colorScheme.primary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: Spaces.lg),
              ShadInput(
                controller: _controller,
                placeholder: Text(context.l10n.goalsPlaceholder),
                leading: Padding(
                  padding: EdgeInsets.zero,
                  child: ShadIconButton(
                    icon: const Icon(LucideIcons.plus),
                    onPressed: () => _addCustomGoal(_controller.text),
                  ),
                ),
                onSubmitted: (value) => _addCustomGoal(value),
              ),
              const SizedBox(height: Spaces.lg),
              ShadButton(
                width: double.infinity,
                height: Spaces.buttonHeight,
                enabled: _selectedGoals.isNotEmpty,
                onPressed: () {
                  ref
                      .read(onboardingUseCaseProvider)
                      .leaveFourthOnboardingScreen(_selectedGoals.toList());
                },
                child: Text(context.l10n.next),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

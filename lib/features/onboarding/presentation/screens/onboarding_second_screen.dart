import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/mighty_onboarding.dart';
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

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: NeutralMighty()),
              SizedBox(height: 20),
              Text(
                context.l10n.whyDoYouUsuallySkip,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: allExcuses.map((excuse) {
                  final isSelected = _selectedExcuses.contains(excuse);
                  return ChoiceChip(
                    label: Text(excuse),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        selected
                            ? _selectedExcuses.add(excuse)
                            : _selectedExcuses.remove(excuse);
                      });
                    },
                    selectedColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Theme.of(context).colorScheme.onSurface,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    showCheckmark: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.shade300,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: context.l10n.other,
                  prefixIcon: const Icon(Icons.add),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
                onSubmitted: _addCustomExcuse,
              ),
              // Extra space so content doesn't get hidden behind the bottom buttons
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // Fixed Navigation Buttons
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          return Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 32),
            child: CustomButton1(
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
    );
  }
}

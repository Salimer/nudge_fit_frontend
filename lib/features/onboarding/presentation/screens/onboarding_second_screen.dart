import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nudge_fit_frontend/core/widgets/buttons.dart';

import '../../../../core/extensions/build_context.dart';
import '../../../../core/state/go_router_state.dart';
import '../../../../core/widgets/mighty.dart';
import '../widgets/onboarding_navigation_widget.dart';

class OnboardingSecondScreen extends StatefulWidget {
  const OnboardingSecondScreen({super.key});

  @override
  State<OnboardingSecondScreen> createState() => _OnboardingSecondScreenState();
}

class _OnboardingSecondScreenState extends State<OnboardingSecondScreen> {
  late final TextEditingController _controller;
  final Set<String> _selectedOptions = {};
  final List<String> _customOptions = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> _getInitialOptions(BuildContext context) {
    return [
      context.l10n.feelsLikeAChore,
      context.l10n.ateTooMuch,
      context.l10n.tooStressed,
      context.l10n.wokeUpLateAndRushed,
      context.l10n.notEnoughTime,
      context.l10n.isNotFunAnymore,
    ];
  }

  void _addCustomOption(String value) {
    final text = value.trim();
    if (text.isNotEmpty && !_selectedOptions.contains(text)) {
      setState(() {
        _customOptions.add(text);
        _selectedOptions.add(text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final allOptions = [..._getInitialOptions(context), ..._customOptions];

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: NeutralMighty()),
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
                children: allOptions.map((option) {
                  final isSelected = _selectedOptions.contains(option);
                  return ChoiceChip(
                    label: Text(option),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        selected
                            ? _selectedOptions.add(option)
                            : _selectedOptions.remove(option);
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
                onSubmitted: _addCustomOption,
              ),
              // Extra space so content doesn't get hidden behind the bottom buttons
              const SizedBox(height: 100),
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
              onPressed: _selectedOptions.isNotEmpty
                  ? () {
                      ref
                          .read(routesProvider)
                          .goNamed(RouteNames.onboardingThird);
                    }
                  : null,
            ),
          );
        },
      ),
    );
  }
}

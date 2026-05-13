import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
import '../../../../core/extensions/build_context.dart';
import '../../../../core/common/widgets/mighty.dart';
import '../../use_cases/onboarding_use_case.dart';
import '../state/onboarding_data_state.dart';

class Onboarding5BattlefieldScreen extends ConsumerStatefulWidget {
  const Onboarding5BattlefieldScreen({super.key});

  @override
  ConsumerState<Onboarding5BattlefieldScreen> createState() =>
      _Onboarding5BattlefieldScreenState();
}

class _Onboarding5BattlefieldScreenState
    extends ConsumerState<Onboarding5BattlefieldScreen> {
  String? _selectedStyle;
  String? _selectedEquipment;

  @override
  void initState() {
    super.initState();
    _selectedStyle = ref.read(onboardingDataStateProvider).workoutStyle;
    _selectedEquipment = ref.read(onboardingDataStateProvider).workoutEquipment;
  }

  Map<String, String> _getStyles(BuildContext context) {
    return {
      'home': context.l10n.battlefieldStyleHome,
      'gym': context.l10n.battlefieldStyleGym,
      'calisthenics': context.l10n.battlefieldStyleCalisthenics,
    };
  }

  Map<String, String> _getEquipments(BuildContext context) {
    return {
      'dumbbells': context.l10n.battlefieldEquipmentDumbbells,
      'bodyweight': context.l10n.battlefieldEquipmentBodyweight,
      'full': context.l10n.battlefieldEquipmentFull,
    };
  }

  @override
  Widget build(BuildContext context) {
    final styles = _getStyles(context);
    final equipments = _getEquipments(context);

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
                context.l10n.battlefieldPrompt,
                style: ShadTheme.of(context).textTheme.h3,
              ),
              const SizedBox(height: Spaces.xl),
              Text(
                context.l10n.battlefieldStyle,
                style: ShadTheme.of(
                  context,
                ).textTheme.p.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: Spaces.sm),
              ShadSelect<String>(
                placeholder: Text(context.l10n.battlefieldStyle),
                initialValue: _selectedStyle,
                selectedOptionBuilder: (context, value) => Text(
                  styles[value] ?? '',
                  style: ShadTheme.of(context).textTheme.p,
                ),
                options: styles.entries.map((entry) {
                  return ShadOption(
                    value: entry.key,
                    child: Text(
                      entry.value,
                      style: ShadTheme.of(context).textTheme.p,
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _selectedStyle = value;
                    });
                  }
                },
              ),
              const SizedBox(height: Spaces.lg),
              Text(
                context.l10n.battlefieldEquipment,
                style: ShadTheme.of(
                  context,
                ).textTheme.p.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: Spaces.sm),
              ShadSelect<String>(
                placeholder: Text(context.l10n.battlefieldEquipment),
                initialValue: _selectedEquipment,
                selectedOptionBuilder: (context, value) => Text(
                  equipments[value] ?? '',
                  style: ShadTheme.of(context).textTheme.p,
                ),
                options: equipments.entries.map((entry) {
                  return ShadOption(
                    value: entry.key,
                    child: Text(
                      entry.value,
                      style: ShadTheme.of(context).textTheme.p,
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _selectedEquipment = value;
                    });
                  }
                },
              ),
              const SizedBox(height: Spaces.xxl),
              SizedBox(
                width: double.infinity,
                child: ShadButton(
                  enabled: _selectedStyle != null && _selectedEquipment != null,
                  onPressed: () {
                    ref
                        .read(onboardingUseCaseProvider)
                        .leaveFifthOnboardingScreen(
                          _selectedStyle!,
                          _selectedEquipment!,
                        );
                  },
                  child: Text(context.l10n.next),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

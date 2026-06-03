import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';

class ContractScreen extends StatefulWidget {
  const ContractScreen({super.key});

  @override
  State<ContractScreen> createState() => _ContractScreenState();
}

class _ContractScreenState extends State<ContractScreen> {
  // Current Contract State
  final Set<String> _selectedDays = {'MON', 'WED', 'FRI'};
  String _selectedTime = '18:30';

  final List<String> _weekDays = [
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
    'SUN',
  ];

  void _toggleDay(String day) {
    setState(() {
      if (_selectedDays.contains(day)) {
        // Prevent deselecting all days (must have at least 1 day)
        if (_selectedDays.length > 1) {
          _selectedDays.remove(day);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Your contract requires at least one day.'),
            ),
          );
        }
      } else {
        _selectedDays.add(day);
      }
    });
  }

  Future<void> _pickTime(BuildContext context) async {
    // In a full app, you would use showTimePicker or a custom Shadcn dial.
    // Simulating a time change for the UI build:
    setState(() {
      _selectedTime = _selectedTime == '18:30' ? '06:00' : '18:30';
    });
  }

  void _signContract() {
    // TODO: Send updated contract to Rails backend
    // ScaffoldMessenger.of(
    //   context,
    // ).showSnackBar(const SnackBar(content: Text('Contract Amendment Signed.')));
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.foreground),
        title: Text(
          'MY CONTRACT',
          style: TextStyle(
            fontSize: Spaces.lg,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
            color: colorScheme.foreground,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Spaces.horizontal,
          vertical: Spaces.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPremiumNotice(theme),
            const SizedBox(height: Spaces.xl),

            // --- DAYS OF OBLIGATION ---
            _buildSectionHeader('DAYS OF OBLIGATION', theme),
            const SizedBox(height: Spaces.sm),
            _buildDaysGrid(theme),
            const SizedBox(height: Spaces.xl),

            // --- TIME OF EXECUTION ---
            _buildSectionHeader('TIME OF EXECUTION', theme),
            const SizedBox(height: Spaces.sm),
            _buildTimeSelector(theme),
            const SizedBox(height: Spaces.xxl),

            // --- WARNING/SUMMARY TEXT ---
            Text(
              'By signing below, you authorize Mighty to hold you accountable for the selected days and times. Excuses will be logged permanently.',
              style: TextStyle(
                color: theme.colorScheme.mutedForeground,
                fontSize: 14,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Spaces.xl),

            // --- SAVE BUTTON ---
            ShadButton(
              height: Spaces.buttonHeight,
              width: double.infinity,
              onPressed: _signContract,
              child: Text(
                'SIGN AMENDMENT',
                style: TextStyle(
                  fontSize: Spaces.md,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  color: colorScheme.primaryForeground,
                ),
              ),
            ),
            const SizedBox(height: Spaces.xxl),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS ---

  Widget _buildPremiumNotice(ShadThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(Spaces.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Spaces.md),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            LucideIcons.shieldCheck,
            color: theme.colorScheme.primary,
            size: Spaces.lg,
          ),
          const SizedBox(width: Spaces.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PREMIUM UNLOCKED',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: Spaces.xs),
                Text(
                  'As a Premium member, you can amend your contract mid-week without penalty.',
                  style: TextStyle(
                    color: theme.colorScheme.foreground,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, ShadThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(left: Spaces.xs),
      child: Text(
        title,
        style: TextStyle(
          color: theme.colorScheme.mutedForeground,
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildDaysGrid(ShadThemeData theme) {
    return Wrap(
      spacing: Spaces.sm,
      runSpacing: Spaces.sm,
      children: _weekDays.map((day) {
        final isSelected = _selectedDays.contains(day);
        return GestureDetector(
          onTap: () => _toggleDay(day),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width:
                (MediaQuery.of(context).size.width -
                    (Spaces.horizontal * 2) -
                    (Spaces.sm * 3)) /
                4,
            padding: const EdgeInsets.symmetric(vertical: Spaces.md),
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.card,
              borderRadius: BorderRadius.circular(Spaces.md),
              border: Border.all(
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.border,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              day,
              style: TextStyle(
                color: isSelected
                    ? theme.colorScheme.primaryForeground
                    : theme.colorScheme.foreground,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTimeSelector(ShadThemeData theme) {
    return GestureDetector(
      onTap: () => _pickTime(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Spaces.lg,
          vertical: Spaces.lg,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.card,
          borderRadius: BorderRadius.circular(Spaces.md),
          border: Border.all(color: theme.colorScheme.border),
        ),
        child: Row(
          children: [
            Icon(
              LucideIcons.clock,
              color: theme.colorScheme.mutedForeground,
              size: Spaces.lg,
            ),
            const SizedBox(width: Spaces.md),
            Text(
              'Daily Target',
              style: TextStyle(
                color: theme.colorScheme.mutedForeground,
                fontSize: Spaces.md,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              _selectedTime,
              style: TextStyle(
                color: theme.colorScheme.foreground,
                fontSize: Spaces.lg,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: Spaces.sm),
            Icon(
              LucideIcons.chevronRight,
              color: theme.colorScheme.mutedForeground,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

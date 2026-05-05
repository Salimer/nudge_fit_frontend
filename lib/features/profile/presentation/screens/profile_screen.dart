import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/constants/spaces.dart';
import '../../data/models/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // 1. The Single Source of Truth
  late ProfileModel _currentUser;

  late final TextEditingController _northStarController;

  // Static Configuration Options
  final List<String> _toneOptions = [
    'Drill Sergeant',
    'Disappointed Mentor',
    'Hype Man',
  ];
  final List<String> _styleOptions = [
    'Home Strength Routine',
    'Gym Split',
    'Cardio Focus',
  ];
  final List<String> _equipmentOptions = [
    'Adjustable Dumbbells',
    'Full Gym',
    'Bodyweight Only',
  ];

  @override
  void initState() {
    super.initState();

    // MOCK DATA: This is where you will eventually do:
    // _currentUser = ref.read(userProvider).value;
    _currentUser = ProfileModel(
      id: 'usr_98234792834',
      name: 'Salim A.',
      email: 'salim@nudgefit.co',
      avatarUrl: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Salim_Winner',
      subscriptionTier: 'PREMIUM TIER',
      northStarGoal:
          'To build enough discipline to launch my own business and have the energy to play with my kids.',
      coachTone: 'Drill Sergeant',
      workoutStyle: 'Home Strength Routine',
      equipment: 'Adjustable Dumbbells',
    );

    _northStarController = TextEditingController(
      text: _currentUser.northStarGoal,
    );
  }

  @override
  void dispose() {
    _northStarController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    // 1. Sync the text controller to the model
    _currentUser.northStarGoal = _northStarController.text;

    // 2. Generate the payload for your Rails Backend
    final payload = _currentUser.toJson();

    // For debugging: view the console to see the perfect JSON payload
    print('Sending to Backend: $payload');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile Synchronized with Backend.')),
    );
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
          'PROFILE & COMMAND CENTER',
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
            _buildIdentityCard(theme),
            const SizedBox(height: Spaces.xl),

            // --- THE NORTH STAR ---
            _buildSectionHeader('THE NORTH STAR (MY WHY)', theme),
            const SizedBox(height: Spaces.sm),
            ShadInput(
              controller: _northStarController,
              maxLines: 4,
              padding: const EdgeInsets.all(Spaces.md),
              style: TextStyle(
                fontSize: Spaces.md,
                color: colorScheme.foreground,
                height: 1.5,
              ),
              placeholder: const Text('Why are you really doing this?'),
            ),
            const SizedBox(height: Spaces.xl),

            // --- MIGHTY'S VOICE (COACH TONE) ---
            _buildSectionHeader("MIGHTY'S VOICE (COACH TONE)", theme),
            const SizedBox(height: Spaces.sm),
            _buildSegmentedPicker(
              options: _toneOptions,
              selectedValue: _currentUser.coachTone,
              theme: theme,
              onSelected: (val) {
                setState(() => _currentUser.coachTone = val);
              },
            ),
            const SizedBox(height: Spaces.xl),

            // --- WORKOUT PREFERENCES ---
            _buildSectionHeader('WORKOUT PREFERENCES (CONTEXT)', theme),
            const SizedBox(height: Spaces.sm),
            _buildDropdown(
              label: 'Style',
              icon: LucideIcons.activity,
              value: _currentUser.workoutStyle,
              options: _styleOptions,
              theme: theme,
              onSelected: (val) {
                setState(() => _currentUser.workoutStyle = val);
              },
            ),
            const SizedBox(height: Spaces.md),
            _buildDropdown(
              label: 'Equipment',
              icon: LucideIcons.dumbbell,
              value: _currentUser.equipment,
              options: _equipmentOptions,
              theme: theme,
              onSelected: (val) {
                setState(() => _currentUser.equipment = val);
              },
            ),
            const SizedBox(height: Spaces.xxl),

            // --- SAVE BUTTON ---
            ShadButton(
              height: Spaces.buttonHeight,
              width: double.infinity,
              onPressed: _saveProfile,
              child: Text(
                'SAVE PROFILE',
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

  Widget _buildIdentityCard(ShadThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(Spaces.lg),
      decoration: BoxDecoration(
        color: theme.colorScheme.card,
        borderRadius: BorderRadius.circular(Spaces.md),
        border: Border.all(color: theme.colorScheme.border),
      ),
      child: Row(
        children: [
          ShadAvatar(
            _currentUser.avatarUrl,
            placeholder: Text(
              _currentUser.name.substring(0, 2).toUpperCase(),
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: Spaces.lg,
              ),
            ),
            backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
            size: const Size(80, 80),
          ),
          const SizedBox(width: Spaces.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _currentUser.name,
                  style: TextStyle(
                    fontSize: Spaces.lg,
                    fontWeight: FontWeight.w800,
                    color: theme.colorScheme.foreground,
                  ),
                ),
                const SizedBox(height: Spaces.xs),
                Text(
                  _currentUser.email,
                  style: TextStyle(
                    fontSize: Spaces.md,
                    color: theme.colorScheme.mutedForeground,
                  ),
                ),
                const SizedBox(height: Spaces.sm),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: theme.colorScheme.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Text(
                    _currentUser.subscriptionTier.toUpperCase(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                      color: theme.colorScheme.primary,
                    ),
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

  Widget _buildSegmentedPicker({
    required List<String> options,
    required String selectedValue,
    required ShadThemeData theme,
    required ValueChanged<String> onSelected,
  }) {
    return Wrap(
      spacing: Spaces.sm,
      runSpacing: Spaces.sm,
      children: options.map((option) {
        final isSelected = option == selectedValue;
        return GestureDetector(
          onTap: () => onSelected(option),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(
              horizontal: Spaces.lg,
              vertical: Spaces.md,
            ),
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
            child: Text(
              option,
              style: TextStyle(
                color: isSelected
                    ? theme.colorScheme.primaryForeground
                    : theme.colorScheme.foreground,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDropdown({
    required String label,
    required IconData icon,
    required String value,
    required List<String> options,
    required ShadThemeData theme,
    required ValueChanged<String> onSelected,
  }) {
    return GestureDetector(
      onTap: () {
        final currentIndex = options.indexOf(value);
        final nextIndex = (currentIndex + 1) % options.length;
        onSelected(options[nextIndex]);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Spaces.md,
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
              icon,
              color: theme.colorScheme.mutedForeground,
              size: Spaces.lg,
            ),
            const SizedBox(width: Spaces.md),
            Text(
              label,
              style: TextStyle(
                color: theme.colorScheme.mutedForeground,
                fontSize: Spaces.md,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                color: theme.colorScheme.foreground,
                fontSize: Spaces.md,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: Spaces.sm),
            Icon(
              LucideIcons.chevronDown,
              color: theme.colorScheme.mutedForeground,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../core/common/state/routes_state.dart';
import '../../../../core/constants/constants.dart';
import '../../../auth/use_cases/auth_use_case.dart';
import '../../use_cases/settings_use_case.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Mock State for Toggles
  bool masterNotifications = true;
  bool workoutReminders = true;
  bool streakAlerts = true;
  bool coachMessages = true;

  // We can keep the brand green for specific accents,
  // or override the primary color in your app_theme.dart later.
  final Color brandGreen = const Color(0xFFD4FF00);

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.foreground),
        title: Text("SALIM'S SETTINGS", style: textTheme.h4),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          _buildProfileSummary(theme),
          const SizedBox(height: 32),

          _buildSectionHeader('ACCOUNT', theme),
          _buildSettingsTile(
            theme: theme,
            icon: LucideIcons.logIn,
            title: 'Manage Login Methods',
          ),
          _buildSettingsTile(
            theme: theme,
            icon: LucideIcons.lock,
            title: 'Change Password',
          ),
          _buildSettingsTile(
            theme: theme,
            icon: LucideIcons.star,
            title: 'Manage Subscription',
            trailingText: 'Premium',
            trailingTextColor: brandGreen,
          ),
          const SizedBox(height: 32),

          _buildSectionHeader('NOTIFICATIONS (THE NUDGES)', theme),
          _buildToggleTile(
            theme: theme,
            title: 'Master Push Notifications',
            value: masterNotifications,
            isMaster: true,
            onChanged: (val) => setState(() => masterNotifications = val),
          ),
          _buildToggleTile(
            theme: theme,
            title: 'Workout Reminders',
            value: workoutReminders,
            enabled: masterNotifications,
            onChanged: (val) => setState(() => workoutReminders = val),
          ),
          _buildToggleTile(
            theme: theme,
            title: 'Streak Alerts',
            value: streakAlerts,
            enabled: masterNotifications,
            onChanged: (val) => setState(() => streakAlerts = val),
          ),
          _buildToggleTile(
            theme: theme,
            title: 'Coach Messages',
            value: coachMessages,
            enabled: masterNotifications,
            onChanged: (val) => setState(() => coachMessages = val),
          ),
          const SizedBox(height: 32),

          _buildSectionHeader('APP PREFERENCES', theme),
          _buildSettingsTile(
            theme: theme,
            icon: LucideIcons.scale,
            title: 'Units',
            trailingText: 'Metric',
          ),
          _buildSettingsTile(
            theme: theme,
            icon: LucideIcons.globe,
            title: 'App Language',
            trailingText:
                'English', // You can tie this to your localeStateProvider
          ),
          const SizedBox(height: 32),

          _buildSectionHeader('LEGAL & SUPPORT', theme),
          _buildSettingsTile(
            theme: theme,
            icon: LucideIcons.shieldAlert,
            title: 'Privacy Policy',
          ),
          _buildSettingsTile(
            theme: theme,
            icon: LucideIcons.fileText,
            title: 'Terms of Service',
          ),
          _buildSettingsTile(
            theme: theme,
            icon: LucideIcons.circle,
            title: 'Help Center',
          ),
          const SizedBox(height: 40),

          _buildSectionHeader(
            'DANGER ZONE',
            theme,
            color: colorScheme.destructive,
          ),
          Consumer(
            builder: (context, ref, _) {
              return _buildSettingsTile(
                theme: theme,
                icon: LucideIcons.logOut,
                title: 'Log Out',
                textColor: colorScheme.mutedForeground,
                iconColor: colorScheme.mutedForeground,
                onTap: () {
                  final mutation = settingsMutation;
                  mutation
                      .run(ref, (tsx) async {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => const Center(
                            child: CircularProgressIndicator(color: Colors.red),
                          ),
                        );
                        await tsx.get(authUseCaseProvider).logout();
                        if (context.mounted) {
                          context.goNamed(RouteNames.onboarding1Welcome);
                        }
                      })
                      .catchError((e, stackTrace) {
                        if (context.mounted) {
                          context.pop();
                          ShadToaster.of(context).show(
                            ShadToast.destructive(
                              alignment: .topCenter,
                              description: Text(e.toString()),
                              showCloseIconOnlyWhenHovered: false,
                              duration: Constants.errorToastDuration,
                            ),
                          );
                        }
                      });
                },
              );
            },
          ),
          _buildSettingsTile(
            theme: theme,
            icon: LucideIcons.trash2,
            title: 'Delete Account',
            iconColor: colorScheme.destructive,
            textColor: colorScheme.destructive,
            hideArrow: true,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // --- REUSABLE SHADCN WIDGETS ---

  Widget _buildProfileSummary(ShadThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.border),
      ),
      child: Row(
        children: [
          ShadAvatar(
            'https://api.dicebear.com/7.x/avataaars/svg?seed=Salim',
            placeholder: Text('SA', style: TextStyle(color: brandGreen)),
            backgroundColor: brandGreen.withOpacity(0.1),
            size: const Size(60, 60),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Salim A.', style: theme.textTheme.large),
                const SizedBox(height: 4),
                Text('salim@nudgefit.co', style: theme.textTheme.muted),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    String title,
    ShadThemeData theme, {
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        title,
        style: theme.textTheme.small.copyWith(
          color: color ?? theme.colorScheme.mutedForeground,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required ShadThemeData theme,
    required IconData icon,
    required String title,
    void Function()? onTap,
    String? trailingText,
    Color? trailingTextColor,
    Color? iconColor,
    Color? textColor,
    bool hideArrow = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: theme.colorScheme.border)),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? theme.colorScheme.foreground,
              size: 20,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.p.copyWith(
                  color: textColor ?? theme.colorScheme.foreground,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText,
                style: theme.textTheme.muted.copyWith(color: trailingTextColor),
              ),
            if (!hideArrow) ...[
              const SizedBox(width: 8),
              Icon(
                LucideIcons.chevronRight,
                color: theme.colorScheme.mutedForeground,
                size: 20,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildToggleTile({
    required ShadThemeData theme,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isMaster = false,
    bool enabled = true,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.colorScheme.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.p.copyWith(
              color: enabled
                  ? (isMaster ? brandGreen : theme.colorScheme.foreground)
                  : theme.colorScheme.mutedForeground,
              fontWeight: isMaster ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          ShadSwitch(
            value: value,
            onChanged: enabled ? onChanged : null,
            // If you want to force the neon green here instead of the default Stone primary:
            // decoration: ShadDecoration(
            //   color: value ? brandGreen : theme.colorScheme.muted,
            // ),
          ),
        ],
      ),
    );
  }
}

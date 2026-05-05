import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../widgets/Nudge_heat_map_calendar_widget.dart';

// Your existing Spaces constant
class Spaces {
  static const double horizontal = 24.0;
  static const double vertical = 24.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}

// --- MOCK DATA MODEL ---
class LogEntry {
  final DateTime date;
  final bool conquered;
  final String? excuse;
  final String aiNudge;

  LogEntry({
    required this.date,
    required this.conquered,
    this.excuse,
    required this.aiNudge,
  });
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late DateTime _selectedDate;
  late final Map<DateTime, LogEntry> historyLog;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    // Normalize today to midnight
    _selectedDate = DateTime(now.year, now.month, now.day);

    // Mock Data mapped by Date (normalized to midnight)
    historyLog = {
      DateTime(now.year, now.month, now.day): LogEntry(
        date: DateTime(now.year, now.month, now.day),
        conquered: true,
        aiNudge:
            'Good work today. You kept your promise. The rest of the week is waiting.',
      ),
      DateTime(now.year, now.month, now.day - 2): LogEntry(
        date: DateTime(now.year, now.month, now.day - 2),
        conquered: true,
        aiNudge:
            'That is how you build a business. One dumbbell at a time. Rest up.',
      ),
      DateTime(now.year, now.month, now.day - 4): LogEntry(
        date: DateTime(now.year, now.month, now.day - 4),
        conquered: false,
        excuse: 'Too stressed from work',
        aiNudge:
            "You broke your contract. You said you were 'Too stressed' to meet your promise. Letting work ruin your health is exactly what we are trying to fix.",
      ),
    };
  }

  // Helper to normalize dates for accurate map lookups
  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final colorScheme = theme.colorScheme;

    final selectedEntry = historyLog[_normalizeDate(_selectedDate)];

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.foreground),
        title: Text(
          'THE ACCOUNTABILITY LOG',
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
          vertical: Spaces.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildStatsHeader(theme),
            const SizedBox(height: Spaces.lg),

            // --- THE CALENDAR SELECTOR ---
            // inside your history_screen.dart build method...

            // Replace the Container holding ShadCalendar with this:
            NudgeHeatmapCalendar(
              selectedDate: _selectedDate,
              historyLog: historyLog,
              onDateSelected: (DateTime newDate) {
                setState(() {
                  _selectedDate = _normalizeDate(newDate);
                });
              },
            ),

            const SizedBox(height: Spaces.lg),

            Text(
              'DAY DETAILS',
              style: TextStyle(
                color: theme.colorScheme.mutedForeground,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: Spaces.sm),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: selectedEntry != null
                  ? _buildLogCard(selectedEntry, theme)
                  : _buildEmptyStateCard(theme, _selectedDate),
            ),
            const SizedBox(height: Spaces.xl),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS ---

  Widget _buildStatsHeader(ShadThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: _buildStatBox(
            theme: theme,
            title: 'STREAK',
            value: '2 DAYS',
            icon: LucideIcons.flame,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(width: Spaces.md),
        Expanded(
          child: _buildStatBox(
            theme: theme,
            title: 'CONQUERED',
            value: '14',
            icon: LucideIcons.trophy,
            color: theme.colorScheme.foreground,
          ),
        ),
      ],
    );
  }

  Widget _buildStatBox({
    required ShadThemeData theme,
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(Spaces.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.card,
        borderRadius: BorderRadius.circular(Spaces.md),
        border: Border.all(color: theme.colorScheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: Spaces.md),
              const SizedBox(width: Spaces.sm),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: theme.colorScheme.mutedForeground,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: Spaces.sm),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: Spaces.xl,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogCard(LogEntry entry, ShadThemeData theme) {
    final bool isSuccess = entry.conquered;
    final Color statusColor = isSuccess
        ? theme.colorScheme.primary
        : theme.colorScheme.destructive;

    // Swapped to universally safe Lucide icon names
    final IconData statusIcon = isSuccess ? LucideIcons.check : LucideIcons.x;

    return Container(
      key: ValueKey(entry.date),
      padding: const EdgeInsets.all(Spaces.lg),
      decoration: BoxDecoration(
        color: theme.colorScheme.card,
        borderRadius: BorderRadius.circular(Spaces.md),
        border: Border.all(
          color: isSuccess
              ? theme.colorScheme.border
              : theme.colorScheme.destructive.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isSuccess ? 'DAY CONQUERED.' : 'DAY FAILED.',
                style: TextStyle(
                  color: isSuccess
                      ? theme.colorScheme.foreground
                      : theme.colorScheme.destructive,
                  fontSize: Spaces.lg,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Icon(statusIcon, color: statusColor, size: Spaces.lg),
            ],
          ),
          const SizedBox(height: Spaces.md),

          if (!isSuccess && entry.excuse != null) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.destructive.withOpacity(0.1),
                borderRadius: BorderRadius.circular(Spaces.sm),
              ),
              child: Text(
                "Excuse Logged: '${entry.excuse}'",
                style: TextStyle(
                  color: theme.colorScheme.destructive,
                  fontSize: Spaces.md,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: Spaces.md),
          ],

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                LucideIcons.messageSquare,
                color: theme.colorScheme.mutedForeground,
                size: 20,
              ),
              const SizedBox(width: Spaces.md),
              Expanded(
                child: Text(
                  entry.aiNudge,
                  style: TextStyle(
                    color: theme.colorScheme.foreground.withOpacity(0.9),
                    fontSize: Spaces.md,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyStateCard(ShadThemeData theme, DateTime date) {
    return Container(
      key: ValueKey(date),
      width: double.infinity,
      padding: const EdgeInsets.all(Spaces.xl),
      decoration: BoxDecoration(
        color: theme.colorScheme.card.withOpacity(0.5),
        borderRadius: BorderRadius.circular(Spaces.md),
        border: Border.all(
          color: theme.colorScheme.border,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Icon(
            LucideIcons.calendarDays,
            size: Spaces.xl,
            color: theme.colorScheme.mutedForeground.withOpacity(0.5),
          ),
          const SizedBox(height: Spaces.md),
          Text(
            'No contract logged for this day.',
            style: TextStyle(
              color: theme.colorScheme.mutedForeground,
              fontSize: Spaces.md,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../common/state/locale_state.dart';
import 'app_colors.dart';

part 'app_theme.g.dart';

@Riverpod(keepAlive: true)
AppTheme appTheme(Ref ref) => AppTheme(ref);

class AppTheme {
  final Ref ref;
  AppTheme(this.ref);

  Locale get locale => ref.watch(localeStateProvider).requireValue;

  ShadThemeData _buildTheme(ShadColorScheme colorScheme) {
    return ShadThemeData(
      colorScheme: colorScheme,
      textTheme: ShadTextTheme.fromGoogleFont(
        locale.languageCode == 'ar' ? GoogleFonts.cairo : GoogleFonts.poppins,
      ),
      selectTheme: ShadSelectTheme(
        decoration: ShadDecoration(color: colorScheme.muted),
      ),
    );
  }

  ShadThemeData get lightTheme => _buildTheme(
    const ShadStoneColorScheme.light(
      background: AppColors.backgroundLight,
      foreground: AppColors.foregroundLight,
      card: AppColors.cardLight,
      cardForeground: AppColors.foregroundLight,
      popover: AppColors.cardLight,
      popoverForeground: AppColors.foregroundLight,
      primary: AppColors.brandGreenLight,
      primaryForeground: AppColors.buttonTextDark,
      secondary: AppColors.secondaryLight,
      secondaryForeground: AppColors.foregroundLight,
      muted: AppColors.mutedLight,
      mutedForeground: AppColors.mutedForegroundLight,
      border: AppColors.borderLight,
      input: AppColors.borderLight,
      ring: AppColors.brandGreenLight,
      destructive: AppColors.destructiveLight,
      destructiveForeground: Colors.white,
    ),
  );

  ShadThemeData get darkTheme => _buildTheme(
    const ShadStoneColorScheme.dark(
      background: AppColors.backgroundDark,
      foreground: AppColors.foregroundDark,
      card: AppColors.cardDark,
      cardForeground: AppColors.foregroundDark,
      popover: AppColors.cardDark,
      popoverForeground: AppColors.foregroundDark,
      primary: AppColors.brandGreenDark,
      primaryForeground: AppColors.buttonTextDark,
      secondary: AppColors.secondaryDark,
      secondaryForeground: AppColors.foregroundDark,
      muted: AppColors.mutedDark,
      mutedForeground: AppColors.mutedForegroundDark,
      border: AppColors.borderDark,
      input: AppColors.borderDark,
      ring: AppColors.brandGreenDark,
      destructive: AppColors.destructiveDark,
      destructiveForeground: Colors.white,
    ),
  );
}

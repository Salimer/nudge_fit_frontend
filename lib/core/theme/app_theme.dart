import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../state/locale_state.dart';

part 'app_theme.g.dart';

@Riverpod(keepAlive: true)
AppTheme appTheme(Ref ref) => AppTheme(ref);

class AppTheme {
  final Ref ref;
  AppTheme(this.ref);

  Locale get locale => ref.watch(localeStateProvider).requireValue;

  String? get _fontFamily => locale.languageCode == 'ar'
      ? GoogleFonts.cairo().fontFamily
      : GoogleFonts.poppins().fontFamily;

  ThemeData _buildTheme() {
    return ThemeData(useMaterial3: true, fontFamily: _fontFamily);
  }

  ThemeData get lightTheme => _buildTheme();
  ThemeData get darkTheme => _buildTheme();
}

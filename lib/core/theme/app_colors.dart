import 'dart:ui';

class AppColors {
  // --- Brand Colors ---
  static const Color brandGreenDark = Color(0xFFD4FF00); // Ultra-bright neon
  static const Color brandGreenLight = Color(0xFF9BCC00); // High-contrast lime
  static const Color buttonTextDark = Color(
    0xFF121212,
  ); // Text ON primary buttons

  // --- Premium Dark Mode Colors ---
  static const Color backgroundDark = Color(
    0xFF121212,
  ); // Deep premium dark (not pure black)
  static const Color foregroundDark = Color(
    0xFFFAFAFA,
  ); // Off-white text for readability
  static const Color cardDark = Color(0xFF1E1E1E); // Elevated surface
  static const Color secondaryDark = Color(0xFF2A2A2A); // Subtle highlights
  static const Color mutedDark = Color(0xFF2A2A2A);
  static const Color mutedForegroundDark = Color(0xFFA0A0A0); // Soft grey text
  static const Color borderDark = Color(0xFF2A2A2A); // Subtle borders
  static const Color destructiveDark = Color(
    0xFFFF453A,
  ); // Apple-style premium red

  // --- Clean Light Mode Colors ---
  static const Color backgroundLight = Color(0xFFFFFFFF); // Pure white base
  static const Color foregroundLight = Color(0xFF121212); // Near-black text
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color secondaryLight = Color(0xFFF4F4F5); // Soft grey surfaces
  static const Color mutedLight = Color(0xFFF4F4F5);
  static const Color mutedForegroundLight = Color(0xFF71717A); // Mid-grey text
  static const Color borderLight = Color(0xFFE4E4E7); // Clean, sharp borders
  static const Color destructiveLight = Color(0xFFEF4444); // Standard alert red
}

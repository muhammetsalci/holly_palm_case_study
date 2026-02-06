import 'package:flutter/material.dart';

/// Premium minimalist color palette inspired by Zara and Nike.
/// 
/// Dark anthracite primary color chosen for luxury feel,
/// off-white backgrounds to reduce eye strain.
class AppColors {
  AppColors._();

  // Primary Colors - Dark Anthracite/Black for buttons and headings
  static const Color primary = Color(0xFF1A1A1A);
  static const Color primaryDark = Color(0xFF000000);
  static const Color primaryLight = Color(0xFF2C2C2C);

  // MARK: - Background Colors

  static const Color background = Color(0xFFF9F9F9);
  static const Color surface = Color(0xFFFFFFFF); // Pure white for cards

  // Secondary/Grey Scale
  static const Color secondary = Color(0xFF9E9E9E);
  static const Color secondaryLight = Color(0xFFE0E0E0);
  static const Color secondaryDark = Color(0xFF757575);

  // MARK: - Text Colors

  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textTertiary = Color(0xFF9E9E9E);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // MARK: - Semantic Colors

  static const Color error = Color(0xFFE53935);
  static const Color success = Color(0xFF43A047);
  static const Color warning = Color(0xFFFB8C00);
  static const Color info = Color(0xFF1E88E5);

  // MARK: - Border Colors

  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color borderMedium = Color(0xFFBDBDBD);
  static const Color borderDark = Color(0xFF9E9E9E);

  // MARK: - Special Colors

  static const Color discount = Color(0xFFE53935);
  static const Color badge = Color(0xFFE53935);

  // MARK: - Shadow Colors

  static Color shadowLight = Colors.black.withOpacity(0.05);
  static Color shadowMedium = Colors.black.withOpacity(0.1);
  static Color shadowDark = Colors.black.withOpacity(0.15);
}

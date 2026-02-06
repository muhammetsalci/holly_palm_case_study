import 'package:flutter/material.dart';

/// Snackbar utility with semantic color coding.
/// 
/// Provides consistent notification UX with floating behavior
/// and icon-based categorization (success/error/info).
class SnackbarUtils {
  SnackbarUtils._();

  /// Show success message with green theme
  static void showSuccess(BuildContext context, String message) {
    _showSnackbar(
      context: context,
      message: message,
      icon: Icons.check_circle,
      backgroundColor: const Color(0xFF4CAF50), // Material Green 500
      iconColor: Colors.white,
    );
  }

  static void showError(BuildContext context, String message) {
    _showSnackbar(
      context: context,
      message: message,
      icon: Icons.error,
      backgroundColor: const Color(0xFFE53935), // Material Red 600
      iconColor: Colors.white,
    );
  }

  static void showInfo(BuildContext context, String message) {
    _showSnackbar(
      context: context,
      message: message,
      icon: Icons.info,
      backgroundColor: const Color(0xFF546E7A), // Material Blue Grey 600
      iconColor: Colors.white,
    );
  }

  // MARK: - Helpers

  static void _showSnackbar({
    required BuildContext context,
    required String message,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        elevation: 6,
        duration: duration,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }

  static void showWithAction({
    required BuildContext context,
    required String message,
    required String actionLabel,
    required VoidCallback onActionPressed,
    IconData icon = Icons.info,
    Color backgroundColor = const Color(0xFF546E7A),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        elevation: 6,
        duration: const Duration(seconds: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        action: SnackBarAction(
          label: actionLabel,
          textColor: Colors.white,
          onPressed: onActionPressed,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Cart badge with overflow handling for large quantities.
/// 
/// Shows "99+" for counts over 99 to prevent UI overflow and
/// maintain visual consistency across all screen sizes.
class CartBadge extends StatelessWidget {
  final int itemCount;
  final VoidCallback onPressed;

  const CartBadge({
    super.key,
    required this.itemCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(24),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              size: 28,
              color: AppColors.textPrimary,
            ),
            if (itemCount > 0)
              Positioned(
                right: -6,
                top: -6,
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 18,
                    minHeight: 18,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.badge,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.surface, width: 1.5),
                  ),
                  child: Text(
                    _getBadgeText(),
                    style: const TextStyle(
                      color: AppColors.textOnPrimary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // MARK: - Helpers

  String _getBadgeText() {
    if (itemCount > 99) {
      return '99+';
    }
    return itemCount.toString();
  }
}

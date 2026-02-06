import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../domain/entities/variant.dart';

/// Add to Cart button with variant-dependent states.
/// 
/// Shows different text/icon based on selection state:
/// - No selection: "Lütfen Seçenek Belirleyin" (forces user choice)
/// - Out of stock: "Stokta Yok" (prevents invalid order)
/// - Available: "Sepete Ekle" (allows purchase)
/// 
/// This state-driven UI prevents accidental orders and reduces support costs.
class AddToCartButton extends StatelessWidget {
  final Variant? selectedVariant;
  final bool isLoading;
  final VoidCallback? onPressed;

  const AddToCartButton({
    super.key,
    required this.selectedVariant,
    this.isLoading = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final hasSelection = selectedVariant != null;
    final isAvailable = selectedVariant?.availableForSale ?? false;
    final isEnabled = hasSelection && isAvailable && !isLoading;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppStrings.price,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  if (selectedVariant != null)
                    _buildPriceDisplay(context)
                  else
                    Text(
                      AppStrings.makeSelection,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: Colors.grey),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: isEnabled ? onPressed : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isEnabled
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade300,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  disabledForegroundColor: Colors.grey.shade500,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(_getButtonIcon(), size: 20),
                          const SizedBox(width: 8),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                _getButtonText(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // MARK: - Helpers

  IconData _getButtonIcon() {
    if (selectedVariant == null) {
      return Icons.touch_app_outlined;
    }
    if (!selectedVariant!.availableForSale) {
      return Icons.block;
    }
    return Icons.shopping_cart_outlined;
  }

  String _getButtonText() {
    if (selectedVariant == null) {
      return AppStrings.pleaseSelectOption;
    }
    if (!selectedVariant!.availableForSale) {
      return AppStrings.notAvailable;
    }
    return AppStrings.addToCart;
  }

  Widget _buildPriceDisplay(BuildContext context) {
    final variant = selectedVariant!;
    final hasDiscount = variant.hasDiscount;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          variant.price.formatted,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: hasDiscount ? Colors.red.shade700 : Colors.black,
          ),
        ),
        if (hasDiscount && variant.compareAtPrice != null) ...[
          const SizedBox(width: 8),
          Text(
            variant.compareAtPrice!.formatted,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ],
    );
  }
}

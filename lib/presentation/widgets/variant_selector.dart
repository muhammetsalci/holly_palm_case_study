import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/variant.dart';

/// Variant selector with forced user choice pattern.
/// 
/// Shows "Zorunlu" badge when no variant selected to emphasize requirement,
/// reducing accidental orders and customer dissatisfaction.
class VariantSelector extends StatelessWidget {
  final Product product;
  final Variant? selectedVariant;
  final ValueChanged<Variant> onVariantSelected;

  const VariantSelector({
    super.key,
    required this.product,
    required this.selectedVariant,
    required this.onVariantSelected,
  });

  @override
  Widget build(BuildContext context) {
    final variants = product.variants;

    if (variants.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              AppStrings.selectVariant,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            if (selectedVariant == null) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  AppStrings.required,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.orange.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: variants.map((variant) {
            final isSelected = selectedVariant?.id == variant.id;
            final isAvailable = variant.availableForSale;

            return GestureDetector(
              onTap: () => onVariantSelected(variant),
              child: Opacity(
                opacity: isAvailable ? 1.0 : 0.5,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : isAvailable
                          ? AppColors.borderMedium
                          : AppColors.borderLight,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          variant.title,
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.textOnPrimary
                                : isAvailable
                                ? AppColors.textPrimary
                                : AppColors.textTertiary,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            decoration: !isAvailable
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (!isAvailable) ...[
                        const SizedBox(width: 6),
                        Icon(
                          Icons.block,
                          size: 16,
                          color: isSelected
                              ? AppColors.textOnPrimary.withOpacity(0.7)
                              : AppColors.error,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        if (selectedVariant != null) ...[
          const SizedBox(height: 16),
          _buildAvailabilityStatus(context),
        ],
      ],
    );
  }

  Widget _buildAvailabilityStatus(BuildContext context) {
    final isAvailable = selectedVariant?.availableForSale ?? false;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isAvailable
            ? AppColors.success.withOpacity(0.1)
            : AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isAvailable
              ? AppColors.success.withOpacity(0.3)
              : AppColors.error.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isAvailable ? Icons.check_circle_outline : Icons.cancel_outlined,
            size: 18,
            color: isAvailable ? AppColors.success : AppColors.error,
          ),
          const SizedBox(width: 8),
          Text(
            isAvailable ? AppStrings.inStock : AppStrings.outOfStock,
            style: TextStyle(
              color: isAvailable ? AppColors.success : AppColors.error,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

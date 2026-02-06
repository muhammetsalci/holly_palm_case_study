import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../domain/entities/cart_item.dart';

/// Cart item card with responsive layout and premium styling.
/// 
/// Uses FittedBox on price/text to prevent pixel overflow on small screens,
/// ensuring clean presentation across all device sizes.
class CartItemCard extends StatelessWidget {
  final CartItem item;
  final bool isLoading;
  final VoidCallback onDelete;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemCard({
    super.key,
    required this.item,
    required this.isLoading,
    required this.onDelete,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImage(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.productTitle,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                              fontSize: 15,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    InkWell(
                      onTap: isLoading ? null : onDelete,
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          Icons.delete_outline,
                          size: 20,
                          color: isLoading
                              ? AppColors.textTertiary
                              : AppColors.error,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                if (item.variant.title != 'Default Title')
                  Text(
                    item.variant.title,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildPriceSection(),
                    const SizedBox(width: 12),
                    _buildQuantityControls(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // MARK: - Components

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 90,
        height: 90,
        color: AppColors.background,
        child: item.imageUrl != null
            ? Image.network(
                item.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildImagePlaceholder();
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  );
                },
              )
            : _buildImagePlaceholder(),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return const Center(
      child: Icon(
        Icons.shopping_bag_outlined,
        color: AppColors.textTertiary,
        size: 32,
      ),
    );
  }

  Widget _buildPriceSection() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              item.variant.price.formatted,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: item.variant.hasDiscount
                    ? AppColors.discount
                    : AppColors.primary,
              ),
              maxLines: 1,
            ),
          ),
          if (item.variant.hasDiscount &&
              item.variant.compareAtPrice != null) ...[
            const SizedBox(height: 2),
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                item.variant.compareAtPrice!.formatted,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textTertiary,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildQuantityControls() {
    final bool canDecrease = !isLoading && item.quantity > 1;
    final bool canIncrease = !isLoading;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderMedium, width: 1),
        borderRadius: BorderRadius.circular(20),
        color: AppColors.surface,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: canDecrease ? onDecrease : null,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Icon(
                Icons.remove,
                size: 16,
                color: canDecrease
                    ? AppColors.textPrimary
                    : AppColors.textTertiary,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(minWidth: 28),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '${item.quantity}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: canIncrease ? onIncrease : null,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Icon(
                Icons.add,
                size: 16,
                color: canIncrease
                    ? AppColors.textPrimary
                    : AppColors.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

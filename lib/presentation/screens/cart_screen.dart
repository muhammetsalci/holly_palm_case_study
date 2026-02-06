import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/dialog_utils.dart';
import '../../core/utils/snackbar_utils.dart';
import '../../domain/entities/cart_item.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item_card.dart';

/// Cart screen with item management and checkout preview.
class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context, ref, cartState),
      body: _buildBody(context, ref, cartState),
      bottomNavigationBar: cartState.isEmpty
          ? null
          : _buildBottomBar(context, cartState),
    );
  }

  // MARK: - UI Components

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    WidgetRef ref,
    CartState cartState,
  ) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        cartState.isEmpty
            ? AppStrings.myCart
            : AppStrings.cartWithCount(cartState.totalItems),
      ),
      actions: [
        if (!cartState.isEmpty)
          TextButton(
            onPressed: () => _showClearCartDialog(context, ref),
            child: const Text(
              AppStrings.clear,
              style: TextStyle(color: AppColors.error),
            ),
          ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, CartState cartState) {
    if (cartState.isLoading && cartState.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(AppStrings.cartLoading),
          ],
        ),
      );
    }

    if (cartState.isEmpty) {
      return _buildEmptyCart(context);
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: cartState.items.length,
            itemBuilder: (context, index) {
              final item = cartState.items[index];
              return _buildCartItem(context, ref, item, cartState.isLoading);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 120,
              color: AppColors.secondaryLight,
            ),
            const SizedBox(height: 24),
            Text(
              AppStrings.emptyCartTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppStrings.emptyCartMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text(AppStrings.continueShopping),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(
    BuildContext context,
    WidgetRef ref,
    CartItem item,
    bool isLoading,
  ) {
    return CartItemCard(
      item: item,
      isLoading: isLoading,
      onDelete: () async {
        final confirm = await _showDeleteConfirmation(context, item);
        if (confirm == true && context.mounted) {
          ref.read(cartNotifierProvider.notifier).removeFromCart(item.id);
          SnackbarUtils.showSuccess(
            context,
            AppStrings.itemRemovedFromCart(item.productTitle),
          );
        }
      },
      onIncrease: () {
        ref
            .read(cartNotifierProvider.notifier)
            .updateQuantity(cartItemId: item.id, quantity: item.quantity + 1);
      },
      onDecrease: () {
        ref
            .read(cartNotifierProvider.notifier)
            .updateQuantity(cartItemId: item.id, quantity: item.quantity - 1);
      },
    );
  }

  Widget _buildBottomBar(BuildContext context, CartState cartState) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.borderLight, width: 1)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.totalAmount,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      cartState.formattedTotalValue,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                Text(
                  AppStrings.productCount(cartState.totalItems),
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: cartState.isLoading
                    ? null
                    : () {
                        SnackbarUtils.showInfo(
                          context,
                          AppStrings.checkoutComingSoon,
                        );
                      },
                child: cartState.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.textOnPrimary,
                        ),
                      )
                    : const Text(AppStrings.completeOrder),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> _showDeleteConfirmation(
    BuildContext context,
    CartItem item,
  ) async {
    return DialogUtils.showConfirmation(
      context: context,
      title: AppStrings.removeProduct,
      message: AppStrings.removeFromCartConfirm(item.productTitle),
      confirmText: AppStrings.delete,
      cancelText: AppStrings.cancel,
      icon: Icons.delete_outline,
      isDangerous: true,
    );
  }

  Future<void> _showClearCartDialog(BuildContext context, WidgetRef ref) async {
    final confirm = await DialogUtils.showConfirmation(
      context: context,
      title: AppStrings.clearCart,
      message: AppStrings.clearCartConfirm,
      confirmText: AppStrings.clear,
      cancelText: AppStrings.cancel,
      icon: Icons.delete_sweep,
      isDangerous: true,
    );

    if (confirm == true && context.mounted) {
      await ref.read(cartNotifierProvider.notifier).clearCart();
      if (context.mounted) {
        SnackbarUtils.showSuccess(context, AppStrings.cartCleared);
      }
    }
  }
}

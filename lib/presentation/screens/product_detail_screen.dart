import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/snackbar_utils.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/variant.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../providers/variant_selection_provider.dart';
import '../widgets/add_to_cart_button.dart';
import '../widgets/cart_badge.dart';
import '../widgets/html_description.dart';
import '../widgets/product_image_gallery.dart';
import '../widgets/variant_selector.dart';
import 'cart_screen.dart';

/// Product detail screen with variant selection and cart integration.
class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);
    final cartState = ref.watch(cartNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: _buildAppBar(context, ref, cartState),
      body: _buildBody(context, ref, productState),
      bottomNavigationBar: _buildBottomBar(context, ref, productState),
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
        onPressed: () {
          SnackbarUtils.showInfo(context, AppStrings.back);
        },
      ),
      title: const Text(AppStrings.productDetail),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CartBadge(
            itemCount: cartState.totalItems,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    ProductState productState,
  ) {
    return switch (productState) {
      ProductInitial() => const Center(child: CircularProgressIndicator()),
      ProductLoading() => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(AppStrings.productLoading),
          ],
        ),
      ),
      ProductError(failure: final failure) => _buildErrorState(
        context,
        ref,
        failure.message,
      ),
      ProductLoaded(product: final product) => _buildProductContent(
        context,
        ref,
        product,
      ),
    };
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: AppColors.error),
            const SizedBox(height: 16),
            Text(
              AppStrings.errorOccurred,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                ref.read(productNotifierProvider.notifier).retry();
              },
              icon: const Icon(Icons.refresh),
              label: const Text(AppStrings.retry),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductContent(
    BuildContext context,
    WidgetRef ref,
    Product product,
  ) {
    final variantSelection = ref.watch(variantSelectionProvider);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageGallery(
            images: product.images,
            selectedVariantImageUrl: variantSelection.currentImageUrl,
          ),

          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.vendor != null && product.vendor!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      product.vendor!.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textSecondary,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 8),
                _buildPriceSection(
                  context,
                  product,
                  variantSelection.selectedVariant,
                ),

                const SizedBox(height: 24),
                VariantSelector(
                  product: product,
                  selectedVariant: variantSelection.selectedVariant,
                  onVariantSelected: (variant) {
                    ref
                        .read(variantSelectionProvider.notifier)
                        .selectVariant(variant);
                  },
                ),

                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 16),
                ExpandableHtmlDescription(htmlContent: product.descriptionHtml),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget? _buildBottomBar(
    BuildContext context,
    WidgetRef ref,
    ProductState productState,
  ) {
    if (productState is! ProductLoaded) return null;

    final product = productState.product;
    final variantSelection = ref.watch(variantSelectionProvider);
    final cartState = ref.watch(cartNotifierProvider);

    return AddToCartButton(
      selectedVariant: variantSelection.selectedVariant,
      isLoading: cartState.isLoading,
      onPressed: () async {
        final variant = variantSelection.selectedVariant;
        if (variant == null) return;

        final success = await ref
            .read(cartNotifierProvider.notifier)
            .addToCart(
              variant: variant,
              productTitle: product.title,
              imageUrl: product.featuredImage?.url,
            );

        if (context.mounted) {
          if (success) {
            SnackbarUtils.showSuccess(
              context,
              AppStrings.itemAddedToCart(variant.title),
            );
          } else {
            final error = ref.read(cartNotifierProvider).error;
            SnackbarUtils.showError(context, error ?? AppStrings.errorOccurred);
            ref.read(cartNotifierProvider.notifier).clearError();
          }
        }
      },
    );
  }

  /// Build price section - shows selected variant price or product range
  Widget _buildPriceSection(
    BuildContext context,
    Product product,
    Variant? selectedVariant,
  ) {
    if (selectedVariant != null) {
      final hasDiscount = selectedVariant.hasDiscount;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            selectedVariant.price.formatted,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: hasDiscount ? AppColors.discount : AppColors.primary,
            ),
          ),
          if (hasDiscount && selectedVariant.compareAtPrice != null) ...[
            const SizedBox(width: 12),
            Text(
              selectedVariant.compareAtPrice!.formatted,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.textTertiary,
                decoration: TextDecoration.lineThrough,
                decorationThickness: 2,
              ),
            ),
          ],
        ],
      );
    }

    return Text(
      product.priceRange,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

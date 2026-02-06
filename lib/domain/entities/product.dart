import 'package:freezed_annotation/freezed_annotation.dart';

import 'money.dart';
import 'variant.dart';

part 'product.freezed.dart';

/// Product aggregate with variants, images, and metadata.
@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String handle,
    required String title,
    required String descriptionHtml,
    String? vendor,
    String? productType,
    @Default([]) List<String> tags,
    required List<ProductImage> images,
    required List<Variant> variants,
    required List<ProductOption> options,
    PriceRange? apiPriceRange,
  }) = _Product;

  const Product._();

  // MARK: - Computed Properties

  ProductImage? get featuredImage => images.isNotEmpty ? images.first : null;

  /// Finds first available variant, falls back to first variant if none available.
  /// Used for price display when no variant is explicitly selected.
  Variant? get firstAvailableVariant {
    try {
      return variants.firstWhere((v) => v.availableForSale);
    } catch (_) {
      return variants.isNotEmpty ? variants.first : null;
    }
  }

  /// Get all unique color options
  List<String> get colorOptions {
    try {
      final colorOption = options.firstWhere(
        (o) => o.name.toLowerCase() == 'color',
      );
      return colorOption.values;
    } catch (_) {
      return [];
    }
  }

  /// Get all unique size options
  List<String> get sizeOptions {
    try {
      final sizeOption = options.firstWhere(
        (o) => o.name.toLowerCase() == 'size',
      );
      return sizeOption.values;
    } catch (_) {
      return [];
    }
  }

  /// Find variant by selected options
  Variant? findVariant({String? color, String? size}) {
    try {
      return variants.firstWhere((v) {
        final matchesColor =
            color == null || v.color?.toLowerCase() == color.toLowerCase();
        final matchesSize =
            size == null || v.size?.toLowerCase() == size.toLowerCase();
        return matchesColor && matchesSize;
      });
    } catch (_) {
      return null;
    }
  }

  /// Get formatted price range - uses API data or calculates from variants
  String get priceRange {
    // Use API price range if available
    if (apiPriceRange != null) {
      return apiPriceRange!.formatted;
    }

    // Fallback: calculate from variants
    if (variants.isEmpty) return '';
    final prices = variants.map((v) => double.tryParse(v.price.amount) ?? 0);
    final minPrice = prices.reduce((a, b) => a < b ? a : b);
    final maxPrice = prices.reduce((a, b) => a > b ? a : b);

    if (minPrice == maxPrice) {
      return variants.first.price.formatted;
    }

    final currency = variants.first.price.currencyCode;
    return '$currency ${minPrice.toStringAsFixed(2)} - $currency ${maxPrice.toStringAsFixed(2)}';
  }
}

/// Price Range entity from Shopify API
@freezed
class PriceRange with _$PriceRange {
  const factory PriceRange({required Money minPrice, required Money maxPrice}) =
      _PriceRange;

  const PriceRange._();

  /// Get formatted price range
  String get formatted {
    if (minPrice.amount == maxPrice.amount) {
      return minPrice.formatted;
    }
    return '${minPrice.formatted} - ${maxPrice.formatted}';
  }
}

/// Product Image entity
@freezed
class ProductImage with _$ProductImage {
  const factory ProductImage({
    required String url,
    String? altText,
    int? width,
    int? height,
  }) = _ProductImage;
}

/// Product Option entity (e.g., Color with values [Ice, Syntax, Powder])
@freezed
class ProductOption with _$ProductOption {
  const factory ProductOption({
    required String id,
    required String name,
    required List<String> values,
  }) = _ProductOption;
}

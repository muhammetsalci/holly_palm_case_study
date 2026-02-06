import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/product.dart';
import 'money_model.dart';
import 'variant_model.dart';

part 'product_model.g.dart';

/// Product JSON model for API serialization.
@JsonSerializable()
class ProductModel {
  final String id;
  final String handle;
  final String title;
  final String descriptionHtml;
  final String? vendor;
  final String? productType;
  final List<String> tags;
  final List<ProductImageModel> images;
  final List<VariantModel> variants;
  final List<ProductOptionModel> options;
  final PriceRangeModel? priceRange;

  const ProductModel({
    required this.id,
    required this.handle,
    required this.title,
    required this.descriptionHtml,
    this.vendor,
    this.productType,
    required this.tags,
    required this.images,
    required this.variants,
    required this.options,
    this.priceRange,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  /// Parses GraphQL response into model.
  factory ProductModel.fromGraphQL(Map<String, dynamic> data) {
    final product =
        data['product'] as Map<String, dynamic>? ??
        data['productByHandle'] as Map<String, dynamic>;

    final imagesEdges = product['images']?['edges'] as List<dynamic>? ?? [];
    final images = imagesEdges
        .map(
          (e) => ProductImageModel.fromJson(e['node'] as Map<String, dynamic>),
        )
        .toList();

    final variantsEdges = product['variants']?['edges'] as List<dynamic>? ?? [];
    final variants = variantsEdges
        .map((e) => VariantModel.fromGraphQL(e['node'] as Map<String, dynamic>))
        .toList();

    final optionsList = product['options'] as List<dynamic>? ?? [];
    final options = optionsList
        .map((o) => ProductOptionModel.fromJson(o as Map<String, dynamic>))
        .toList();

    final tagsList = product['tags'] as List<dynamic>? ?? [];
    final tags = tagsList.map((t) => t.toString()).toList();

    PriceRangeModel? priceRangeModel;
    if (product['priceRange'] != null) {
      priceRangeModel = PriceRangeModel.fromJson(
        product['priceRange'] as Map<String, dynamic>,
      );
    }

    return ProductModel(
      id: product['id'] as String,
      handle: product['handle'] as String,
      title: product['title'] as String,
      descriptionHtml: product['descriptionHtml'] as String? ?? '',
      vendor: product['vendor'] as String?,
      productType: product['productType'] as String?,
      tags: tags,
      images: images,
      variants: variants,
      options: options,
      priceRange: priceRangeModel,
    );
  }

  Product toEntity() => Product(
    id: id,
    handle: handle,
    title: title,
    descriptionHtml: descriptionHtml,
    vendor: vendor,
    productType: productType,
    tags: tags,
    images: images.map((i) => i.toEntity()).toList(),
    variants: variants.map((v) => v.toEntity()).toList(),
    options: options.map((o) => o.toEntity()).toList(),
    apiPriceRange: priceRange?.toEntity(),
  );
}

/// Price range JSON model.
@JsonSerializable()
class PriceRangeModel {
  final MoneyModel minVariantPrice;
  final MoneyModel maxVariantPrice;

  const PriceRangeModel({
    required this.minVariantPrice,
    required this.maxVariantPrice,
  });

  factory PriceRangeModel.fromJson(Map<String, dynamic> json) =>
      _$PriceRangeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PriceRangeModelToJson(this);

  PriceRange toEntity() => PriceRange(
    minPrice: minVariantPrice.toEntity(),
    maxPrice: maxVariantPrice.toEntity(),
  );
}

/// Product image JSON model.
@JsonSerializable()
class ProductImageModel {
  final String url;
  final String? altText;
  final int? width;
  final int? height;

  const ProductImageModel({
    required this.url,
    this.altText,
    this.width,
    this.height,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductImageModelToJson(this);

  ProductImage toEntity() =>
      ProductImage(url: url, altText: altText, width: width, height: height);
}

/// Product Option model
@JsonSerializable()
class ProductOptionModel {
  final String id;
  final String name;
  final List<String> values;

  const ProductOptionModel({
    required this.id,
    required this.name,
    required this.values,
  });

  factory ProductOptionModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOptionModelToJson(this);

  ProductOption toEntity() => ProductOption(id: id, name: name, values: values);
}

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/variant.dart';
import 'money_model.dart';

part 'variant_model.g.dart';

/// Variant JSON model for API serialization.
@JsonSerializable()
class VariantModel {
  final String id;
  final String title;
  final bool availableForSale;
  final int? quantityAvailable;
  final MoneyModel price;
  final MoneyModel? compareAtPrice;
  final List<SelectedOptionModel> selectedOptions;
  final VariantImageModel? image;

  const VariantModel({
    required this.id,
    required this.title,
    required this.availableForSale,
    this.quantityAvailable,
    required this.price,
    this.compareAtPrice,
    required this.selectedOptions,
    this.image,
  });

  factory VariantModel.fromJson(Map<String, dynamic> json) =>
      _$VariantModelFromJson(json);

  Map<String, dynamic> toJson() => _$VariantModelToJson(this);

  /// Maps GraphQL node to model, using API data directly.
  /// Avoids artificial data manipulation to maintain data integrity.
  factory VariantModel.fromGraphQL(Map<String, dynamic> node) {
    return VariantModel(
      id: node['id'] as String,
      title: node['title'] as String,
      availableForSale: node['availableForSale'] as bool? ?? false,
      quantityAvailable: node['quantityAvailable'] as int?,
      price: MoneyModel.fromJson(node['price'] as Map<String, dynamic>),
      compareAtPrice: node['compareAtPrice'] != null
          ? MoneyModel.fromJson(node['compareAtPrice'] as Map<String, dynamic>)
          : null,
      selectedOptions: (node['selectedOptions'] as List<dynamic>)
          .map((o) => SelectedOptionModel.fromJson(o as Map<String, dynamic>))
          .toList(),
      image: node['image'] != null
          ? VariantImageModel.fromJson(node['image'] as Map<String, dynamic>)
          : null,
    );
  }

  Variant toEntity() => Variant(
    id: id,
    title: title,
    availableForSale: availableForSale,
    quantityAvailable: quantityAvailable,
    price: price.toEntity(),
    compareAtPrice: compareAtPrice?.toEntity(),
    selectedOptions: selectedOptions.map((o) => o.toEntity()).toList(),
    imageUrl: image?.url,
  );
}

/// Selected option JSON model.
@JsonSerializable()
class SelectedOptionModel {
  final String name;
  final String value;

  const SelectedOptionModel({required this.name, required this.value});

  factory SelectedOptionModel.fromJson(Map<String, dynamic> json) =>
      _$SelectedOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectedOptionModelToJson(this);

  SelectedOption toEntity() => SelectedOption(name: name, value: value);
}

/// Variant image JSON model.
@JsonSerializable()
class VariantImageModel {
  final String url;
  final String? altText;

  const VariantImageModel({required this.url, this.altText});

  factory VariantImageModel.fromJson(Map<String, dynamic> json) =>
      _$VariantImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$VariantImageModelToJson(this);
}

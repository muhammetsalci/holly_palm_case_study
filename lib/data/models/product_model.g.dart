// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: json['id'] as String,
  handle: json['handle'] as String,
  title: json['title'] as String,
  descriptionHtml: json['descriptionHtml'] as String,
  vendor: json['vendor'] as String?,
  productType: json['productType'] as String?,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  images: (json['images'] as List<dynamic>)
      .map((e) => ProductImageModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  variants: (json['variants'] as List<dynamic>)
      .map((e) => VariantModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  options: (json['options'] as List<dynamic>)
      .map((e) => ProductOptionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  priceRange: json['priceRange'] == null
      ? null
      : PriceRangeModel.fromJson(json['priceRange'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'handle': instance.handle,
      'title': instance.title,
      'descriptionHtml': instance.descriptionHtml,
      'vendor': instance.vendor,
      'productType': instance.productType,
      'tags': instance.tags,
      'images': instance.images,
      'variants': instance.variants,
      'options': instance.options,
      'priceRange': instance.priceRange,
    };

PriceRangeModel _$PriceRangeModelFromJson(Map<String, dynamic> json) =>
    PriceRangeModel(
      minVariantPrice: MoneyModel.fromJson(
        json['minVariantPrice'] as Map<String, dynamic>,
      ),
      maxVariantPrice: MoneyModel.fromJson(
        json['maxVariantPrice'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$PriceRangeModelToJson(PriceRangeModel instance) =>
    <String, dynamic>{
      'minVariantPrice': instance.minVariantPrice,
      'maxVariantPrice': instance.maxVariantPrice,
    };

ProductImageModel _$ProductImageModelFromJson(Map<String, dynamic> json) =>
    ProductImageModel(
      url: json['url'] as String,
      altText: json['altText'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductImageModelToJson(ProductImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'altText': instance.altText,
      'width': instance.width,
      'height': instance.height,
    };

ProductOptionModel _$ProductOptionModelFromJson(Map<String, dynamic> json) =>
    ProductOptionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      values: (json['values'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductOptionModelToJson(ProductOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'values': instance.values,
    };

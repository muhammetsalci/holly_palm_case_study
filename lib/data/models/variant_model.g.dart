// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariantModel _$VariantModelFromJson(Map<String, dynamic> json) => VariantModel(
  id: json['id'] as String,
  title: json['title'] as String,
  availableForSale: json['availableForSale'] as bool,
  quantityAvailable: (json['quantityAvailable'] as num?)?.toInt(),
  price: MoneyModel.fromJson(json['price'] as Map<String, dynamic>),
  compareAtPrice: json['compareAtPrice'] == null
      ? null
      : MoneyModel.fromJson(json['compareAtPrice'] as Map<String, dynamic>),
  selectedOptions: (json['selectedOptions'] as List<dynamic>)
      .map((e) => SelectedOptionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  image: json['image'] == null
      ? null
      : VariantImageModel.fromJson(json['image'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VariantModelToJson(VariantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'availableForSale': instance.availableForSale,
      'quantityAvailable': instance.quantityAvailable,
      'price': instance.price,
      'compareAtPrice': instance.compareAtPrice,
      'selectedOptions': instance.selectedOptions,
      'image': instance.image,
    };

SelectedOptionModel _$SelectedOptionModelFromJson(Map<String, dynamic> json) =>
    SelectedOptionModel(
      name: json['name'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$SelectedOptionModelToJson(
  SelectedOptionModel instance,
) => <String, dynamic>{'name': instance.name, 'value': instance.value};

VariantImageModel _$VariantImageModelFromJson(Map<String, dynamic> json) =>
    VariantImageModel(
      url: json['url'] as String,
      altText: json['altText'] as String?,
    );

Map<String, dynamic> _$VariantImageModelToJson(VariantImageModel instance) =>
    <String, dynamic>{'url': instance.url, 'altText': instance.altText};

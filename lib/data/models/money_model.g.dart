// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneyModel _$MoneyModelFromJson(Map<String, dynamic> json) => MoneyModel(
  amount: json['amount'] as String,
  currencyCode: json['currencyCode'] as String,
);

Map<String, dynamic> _$MoneyModelToJson(MoneyModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'currencyCode': instance.currencyCode,
    };

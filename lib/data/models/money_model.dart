import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/money.dart';

part 'money_model.g.dart';

/// Money JSON model for API serialization.
@JsonSerializable()
class MoneyModel {
  final String amount;
  final String currencyCode;

  const MoneyModel({required this.amount, required this.currencyCode});

  factory MoneyModel.fromJson(Map<String, dynamic> json) =>
      _$MoneyModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoneyModelToJson(this);

  Money toEntity() => Money(amount: amount, currencyCode: currencyCode);

  factory MoneyModel.fromEntity(Money entity) =>
      MoneyModel(amount: entity.amount, currencyCode: entity.currencyCode);
}

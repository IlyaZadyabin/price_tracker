import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol_price_schema.freezed.dart';
part 'symbol_price_schema.g.dart';

@freezed
class SymbolPriceSchema with _$SymbolPriceSchema {
  const factory SymbolPriceSchema({
    required TickSchema tick,
    required SubscriptionSchema subscription,
  }) = _SymbolPriceSchema;

  factory SymbolPriceSchema.fromJson(Map<String, Object?> json) =>
      _$SymbolPriceSchemaFromJson(json);
}

@freezed
class TickSchema with _$TickSchema {
  const factory TickSchema({
    required double quote,
    required String symbol,
  }) = _TickSchema;

  factory TickSchema.fromJson(Map<String, Object?> json) =>
      _$TickSchemaFromJson(json);
}

@freezed
class SubscriptionSchema with _$SubscriptionSchema {
  const factory SubscriptionSchema({
    required String id,
  }) = _SubscriptionSchema;

  factory SubscriptionSchema.fromJson(Map<String, Object?> json) =>
      _$SubscriptionSchemaFromJson(json);
}

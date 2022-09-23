import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol_price_schema.freezed.dart';
part 'symbol_price_schema.g.dart';

@freezed
class SymbolPriceSchema with _$SymbolPriceSchema {
  const factory SymbolPriceSchema({
    required TickSchema tick,
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

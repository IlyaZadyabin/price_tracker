import 'package:freezed_annotation/freezed_annotation.dart';

part 'symbol_schema.freezed.dart';
part 'symbol_schema.g.dart';

@freezed
class SymbolSchema with _$SymbolSchema {
  const factory SymbolSchema({
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'market_display_name') required String marketDisplayName,
    required double spot,
  }) = _SymbolSchema;

  factory SymbolSchema.fromJson(Map<String, Object?> json) =>
      _$SymbolSchemaFromJson(json);
}

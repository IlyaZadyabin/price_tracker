import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:price_tracker/data/data.dart';

part 'active_symbols_schema.freezed.dart';
part 'active_symbols_schema.g.dart';

@freezed
class ActiveSymbolsSchema with _$ActiveSymbolsSchema {
  const factory ActiveSymbolsSchema({
    @JsonKey(name: 'active_symbols') required List<SymbolSchema> activeSymbols,
  }) = _ActiveSymbolsSchema;

  factory ActiveSymbolsSchema.fromJson(Map<String, Object?> json) =>
      _$ActiveSymbolsSchemaFromJson(json);
}

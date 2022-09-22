import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/schema/symbol_schema.dart';

part 'active_symbol.freezed.dart';
part 'active_symbol.g.dart';

@freezed
class ActiveSymbol with _$ActiveSymbol {
  const factory ActiveSymbol({
    @Default('') String name,
    @Default('') String market,
    @Default(0.0) double price,
  }) = _ActiveSymbol;

  factory ActiveSymbol.fromJson(Map<String, Object?> json) =>
      _$ActiveSymbolFromJson(json);

  factory ActiveSymbol.fromSchema(SymbolSchema schema) {
    return ActiveSymbol(
      name: schema.displayName,
      market: schema.marketDisplayName,
      price: schema.spot,
    );
  }
}

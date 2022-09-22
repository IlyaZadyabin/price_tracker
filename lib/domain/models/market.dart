import 'package:freezed_annotation/freezed_annotation.dart';

import 'active_symbol.dart';

part 'market.freezed.dart';
part 'market.g.dart';

@freezed
class Market with _$Market {
  const factory Market({
    @Default('') String name,
    required List<ActiveSymbol> assets,
  }) = _Market;

  factory Market.fromJson(Map<String, Object?> json) => _$MarketFromJson(json);
}

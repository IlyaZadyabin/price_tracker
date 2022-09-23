import 'package:price_tracker/data/schema/active_symbols_schema.dart';
import 'package:price_tracker/data/schema/symbol_price_schema.dart';

abstract class IApiService {
  Future<Stream<ActiveSymbolsSchema>> activeSymbols();
  Future<Stream<SymbolPriceSchema>> priceOfSymbol(String symbol);
}

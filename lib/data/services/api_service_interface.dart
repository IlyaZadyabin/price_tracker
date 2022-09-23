import 'package:price_tracker/data/custom/socket_stream.dart';
import 'package:price_tracker/data/schema/active_symbols_schema.dart';
import 'package:price_tracker/data/schema/symbol_price_schema.dart';

abstract class IApiService {
  Future<SocketStream<ActiveSymbolsSchema>> activeSymbols();
  Future<SocketStream<SymbolPriceSchema>> priceOfSymbol(String symbol);
}

import 'package:price_tracker/data/schema/active_symbols_schema.dart';

abstract class IApiService {
  Future<Stream<ActiveSymbolsSchema>> activeSymbols();
}

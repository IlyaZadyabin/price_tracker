import 'package:price_tracker/domain/domain.dart';

final List<Market> fakeMarkets = [
  Market(
    name: 'forex',
    assets: List<ActiveSymbol>.generate(
      10,
      (index) => ActiveSymbol(
        name: 'asset $index',
        market: 'forex',
        symbol: '$index',
        price: index * 1.5,
      ),
    ),
  ),
  Market(
    name: 'market',
    assets: List<ActiveSymbol>.generate(
      2,
      (index) => ActiveSymbol(
        name: 'second asset $index',
        market: 'market',
        symbol: '$index',
        price: index * 1,
      ),
    ),
  ),
  Market(
    name: 'exchange',
    assets: List<ActiveSymbol>.generate(
      4,
      (index) => ActiveSymbol(
        name: 'third asset $index',
        market: 'exchange',
        symbol: '$index',
        price: index * 2,
      ),
    ),
  ),
];

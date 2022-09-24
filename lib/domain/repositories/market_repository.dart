import 'package:dartz/dartz.dart';
import 'package:price_tracker/data/data.dart';
import 'package:price_tracker/domain/models/active_symbol.dart';
import 'package:price_tracker/domain/models/market.dart';
import 'package:price_tracker/domain/repositories/market_repository_interface.dart';

class MarketRepository extends IMarketRepository {
  MarketRepository({required this.apiService});

  final IApiService apiService;

  /// Setup socket stream for active symbols
  @override
  Future<Either<Failure, SocketStream<List<Market>>>> marketWithAssets() async {
    try {
      final stream = await apiService.activeSymbols();
      return Right(
        SocketStream(
          stream: stream.stream.map(
            (data) {
              final markets = <Market>[];
              for (final symbol in data.activeSymbols) {
                final marketName = symbol.marketDisplayName;
                final existingMarketIdx =
                    markets.indexWhere((e) => e.name == marketName);
                if (existingMarketIdx >= 0) {
                  markets[existingMarketIdx] =
                      markets[existingMarketIdx].copyWith(
                    assets: [
                      ...markets[existingMarketIdx].assets,
                      ActiveSymbol.fromSchema(symbol)
                    ],
                  );
                } else {
                  markets.add(
                    Market(
                      name: marketName,
                      assets: [ActiveSymbol.fromSchema(symbol)],
                    ),
                  );
                }
              }
              return markets;
            },
          ),
          close: stream.close,
        ),
      );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  /// Setup socket stream for price of symbol
  @override
  Future<Either<Failure, SocketStream<double>>> priceOfSymbol(
    String symbol,
  ) async {
    try {
      final stream = await apiService.priceOfSymbol(symbol);
      return Right(
        SocketStream(
          stream: stream.stream.map((data) => data.tick.quote),
          close: stream.close,
        ),
      );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

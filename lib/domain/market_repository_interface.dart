import 'package:dartz/dartz.dart';
import 'package:price_tracker/data/error_handling/failure.dart';
import 'package:price_tracker/domain/models/market.dart';

abstract class IMarketRepository {
  Future<Either<Failure, Stream<List<Market>>>> marketWithAssets();
  Future<Either<Failure, Stream<double>>> priceOfSymbol(String symbol);
}

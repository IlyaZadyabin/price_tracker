import 'package:dartz/dartz.dart';
import 'package:price_tracker/data/error_handling/failure.dart';

import 'models/market.dart';

abstract class IMarketRepository {
  Future<Either<Failure, Stream<List<Market>>>> marketWithAssets();
}

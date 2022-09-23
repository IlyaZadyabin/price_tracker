import 'package:dartz/dartz.dart';
import 'package:price_tracker/data/custom/socket_stream.dart';
import 'package:price_tracker/data/error_handling/failure.dart';
import 'package:price_tracker/domain/models/market.dart';

abstract class IMarketRepository {
  Future<Either<Failure, SocketStream<List<Market>>>> marketWithAssets();
  Future<Either<Failure, SocketStream<double>>> priceOfSymbol(String symbol);
}

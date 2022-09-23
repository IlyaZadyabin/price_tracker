import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:price_tracker/data/api_config.dart';
import 'package:price_tracker/data/api_service_interface.dart';
import 'package:price_tracker/data/custom/socket_stream.dart';
import 'package:price_tracker/data/error_handling/exceptions.dart';
import 'package:price_tracker/data/schema/active_symbols_schema.dart';
import 'package:price_tracker/data/schema/symbol_price_schema.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef Json = Map<String, Object?>;

class ApiService implements IApiService {
  ApiService({required this.dio});

  final Dio dio;

  @override
  Future<SocketStream<ActiveSymbolsSchema>> activeSymbols() async {
    const url = ApiConfig.baseUrl;

    try {
      final channel = WebSocketChannel.connect(
        Uri.parse(url),
      );

      final Stream<ActiveSymbolsSchema> streamOfSymbols;
      try {
        streamOfSymbols = channel.stream.map((event) {
          return ActiveSymbolsSchema.fromJson(
            jsonDecode(event as String) as Json,
          );
        });
      } catch (e) {
        await channel.sink.close();
        throw DataParsingException();
      }

      channel.sink.add(
        {'"active_symbols"': '"full"', '"product_type"': '"basic"'}.toString(),
      );

      return SocketStream(
        stream: streamOfSymbols,
        close: () {
          channel.sink.close();
        },
      );
    } catch (e) {
      if ((e is ServerException) || (e is DataParsingException)) {
        rethrow;
      } else {
        throw NoConnectionException();
      }
    }
  }

  @override
  Future<SocketStream<SymbolPriceSchema>> priceOfSymbol(String symbol) async {
    const url = ApiConfig.baseUrl;

    try {
      final channel = WebSocketChannel.connect(
        Uri.parse(url),
      );

      String? subscriptionID;

      final Stream<SymbolPriceSchema> streamOfSymbols;
      try {
        streamOfSymbols = channel.stream.map((event) {
          final schema = SymbolPriceSchema.fromJson(
            jsonDecode(event as String) as Json,
          );
          subscriptionID ??= schema.subscription.id;
          return schema;
        });
      } catch (e) {
        await channel.sink.close();
        throw DataParsingException();
      }

      channel.sink.add(
        {'"ticks"': '"${symbol}"', '"subscribe"': 1}.toString(),
      );

      return SocketStream(
        stream: streamOfSymbols,
        close: () {
          if (subscriptionID != null) {
            channel.sink.add({'"forget"': '"${subscriptionID}"'}.toString());
          }
          channel.sink.close();
        },
      );
    } catch (e) {
      if ((e is ServerException) || (e is DataParsingException)) {
        rethrow;
      } else {
        throw NoConnectionException();
      }
    }
  }
}

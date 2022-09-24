import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:price_tracker/data/data.dart';
import 'package:price_tracker/domain/domain.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.marketRepository}) : super(const HomeState()) {
    _initialize();
  }

  final IMarketRepository marketRepository;
  StreamSubscription<List<Market>>? _marketsSubscription;
  StreamSubscription<double>? _priceSubscription;
  SocketStream<double>? _priceStream;
  SocketStream<List<Market>>? _marketStream;

  /// Connect to server and fetch markets and assets
  void _initialize() {
    marketRepository.marketWithAssets().then(
          (value) => value.fold(
            (error) {
              emit(state.copyWith(status: HomeStateStatus.error));
            },
            (data) {
              _marketStream = data;
              _marketsSubscription = data.stream.listen(
                (data) => emit(
                  state.copyWith(
                    markets: data,
                    status: HomeStateStatus.dataFetched,
                  ),
                ),
              );
            },
          ),
        );
  }

  /// Pick specific market
  Future<void> selectMarket(Market? market) async {
    if (market != state.selectedMarket) {
      await selectAsset(null);
      emit(state.copyWith(selectedMarket: market, selectedAsset: null));
    }
  }

  /// Pick specific asset from selected market
  Future<void> selectAsset(ActiveSymbol? asset) async {
    if (asset != state.selectedAsset) {
      await _priceSubscription?.cancel();
      _priceStream?.close();
      _priceStream = null;
      if (asset != null) {
        emit(
          state.copyWith(
            selectedAsset: asset,
            price: null,
            initialPrice: null,
            status: HomeStateStatus.priceLoading,
          ),
        );
        await marketRepository.priceOfSymbol(asset.symbol).then(
              (value) => value.fold(
                (_) => emit(state.copyWith(status: HomeStateStatus.error)),
                (data) {
                  _priceStream = data;
                  _priceSubscription = data.stream.listen(
                    (data) => emit(
                      state.copyWith(
                        price: data,
                        status: HomeStateStatus.dataFetched,
                        initialPrice: state.initialPrice ?? data,
                      ),
                    ),
                    onError: (_) =>
                        emit(state.copyWith(status: HomeStateStatus.error)),
                  );
                },
              ),
            );
      } else {
        emit(
          state.copyWith(
            selectedAsset: asset,
            price: null,
            initialPrice: null,
            status: HomeStateStatus.dataFetched,
          ),
        );
      }
    }
  }

  @override
  Future<void> close() {
    _marketsSubscription?.cancel();
    _priceSubscription?.cancel();
    _priceStream?.close();
    _marketStream?.close();
    return super.close();
  }
}

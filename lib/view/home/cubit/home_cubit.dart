import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:price_tracker/domain/market_repository_interface.dart';
import 'package:price_tracker/domain/models/active_symbol.dart';

import '../../../domain/models/market.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.marketRepository}) : super(const HomeState()) {
    _initialize();
  }

  final IMarketRepository marketRepository;
  StreamSubscription<List<Market>>? _subscription;

  void _initialize() {
    marketRepository.marketWithAssets().then(
          (value) => value.fold(
            (error) {
              emit(state.copyWith(status: HomeStateStatus.error));
            },
            (data) {
              _subscription =
                  data.listen((data) => emit(state.copyWith(markets: data)));
            },
          ),
        );
  }

  void selectMarket(Market? market) {
    if (market != state.selectedMarket) {
      emit(state.copyWith(selectedMarket: market, selectedAsset: null));
    }
  }

  void selectAsset(ActiveSymbol? asset) {
    if (asset != state.selectedAsset) {
      emit(state.copyWith(selectedAsset: asset));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

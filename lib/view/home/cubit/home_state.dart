part of 'home_cubit.dart';

enum HomeStateStatus {
  initialLoading,
  priceLoading,
  dataFetched,
  error;

  bool get isInitialLoading => this == initialLoading;
  bool get isPriceLoading => this == priceLoading;
  bool get isDataFetched => this == dataFetched;
  bool get isError => this == error;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStateStatus.initialLoading) HomeStateStatus status,
    @Default([]) List<Market> markets,
    Market? selectedMarket,
    ActiveSymbol? selectedAsset,
    String? price,
    bool? isPriceUp,
  }) = _HomeState;
}

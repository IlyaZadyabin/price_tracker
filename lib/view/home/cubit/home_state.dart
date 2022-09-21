part of 'home_cubit.dart';

enum HomeStateStatus {
  initial,
  loading,
  error;

  bool get isInitial => this == initial;

  bool get isLoading => this == loading;

  bool get isError => this == error;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStateStatus.initial) HomeStateStatus status,
    @Default('') String id,
  }) = _HomeState;
}

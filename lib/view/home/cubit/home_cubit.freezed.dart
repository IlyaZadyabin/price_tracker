// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  HomeStateStatus get status => throw _privateConstructorUsedError;
  List<Market> get markets => throw _privateConstructorUsedError;
  Market? get selectedMarket => throw _privateConstructorUsedError;
  ActiveSymbol? get selectedAsset => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get initialPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res>;
  $Res call(
      {HomeStateStatus status,
      List<Market> markets,
      Market? selectedMarket,
      ActiveSymbol? selectedAsset,
      double? price,
      double? initialPrice});

  $MarketCopyWith<$Res>? get selectedMarket;
  $ActiveSymbolCopyWith<$Res>? get selectedAsset;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  final HomeState _value;
  // ignore: unused_field
  final $Res Function(HomeState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? markets = freezed,
    Object? selectedMarket = freezed,
    Object? selectedAsset = freezed,
    Object? price = freezed,
    Object? initialPrice = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeStateStatus,
      markets: markets == freezed
          ? _value.markets
          : markets // ignore: cast_nullable_to_non_nullable
              as List<Market>,
      selectedMarket: selectedMarket == freezed
          ? _value.selectedMarket
          : selectedMarket // ignore: cast_nullable_to_non_nullable
              as Market?,
      selectedAsset: selectedAsset == freezed
          ? _value.selectedAsset
          : selectedAsset // ignore: cast_nullable_to_non_nullable
              as ActiveSymbol?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      initialPrice: initialPrice == freezed
          ? _value.initialPrice
          : initialPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }

  @override
  $MarketCopyWith<$Res>? get selectedMarket {
    if (_value.selectedMarket == null) {
      return null;
    }

    return $MarketCopyWith<$Res>(_value.selectedMarket!, (value) {
      return _then(_value.copyWith(selectedMarket: value));
    });
  }

  @override
  $ActiveSymbolCopyWith<$Res>? get selectedAsset {
    if (_value.selectedAsset == null) {
      return null;
    }

    return $ActiveSymbolCopyWith<$Res>(_value.selectedAsset!, (value) {
      return _then(_value.copyWith(selectedAsset: value));
    });
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {HomeStateStatus status,
      List<Market> markets,
      Market? selectedMarket,
      ActiveSymbol? selectedAsset,
      double? price,
      double? initialPrice});

  @override
  $MarketCopyWith<$Res>? get selectedMarket;
  @override
  $ActiveSymbolCopyWith<$Res>? get selectedAsset;
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res> extends _$HomeStateCopyWithImpl<$Res>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, (v) => _then(v as _$_HomeState));

  @override
  _$_HomeState get _value => super._value as _$_HomeState;

  @override
  $Res call({
    Object? status = freezed,
    Object? markets = freezed,
    Object? selectedMarket = freezed,
    Object? selectedAsset = freezed,
    Object? price = freezed,
    Object? initialPrice = freezed,
  }) {
    return _then(_$_HomeState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeStateStatus,
      markets: markets == freezed
          ? _value._markets
          : markets // ignore: cast_nullable_to_non_nullable
              as List<Market>,
      selectedMarket: selectedMarket == freezed
          ? _value.selectedMarket
          : selectedMarket // ignore: cast_nullable_to_non_nullable
              as Market?,
      selectedAsset: selectedAsset == freezed
          ? _value.selectedAsset
          : selectedAsset // ignore: cast_nullable_to_non_nullable
              as ActiveSymbol?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      initialPrice: initialPrice == freezed
          ? _value.initialPrice
          : initialPrice // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {this.status = HomeStateStatus.initialLoading,
      final List<Market> markets = const [],
      this.selectedMarket,
      this.selectedAsset,
      this.price,
      this.initialPrice})
      : _markets = markets;

  @override
  @JsonKey()
  final HomeStateStatus status;
  final List<Market> _markets;
  @override
  @JsonKey()
  List<Market> get markets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markets);
  }

  @override
  final Market? selectedMarket;
  @override
  final ActiveSymbol? selectedAsset;
  @override
  final double? price;
  @override
  final double? initialPrice;

  @override
  String toString() {
    return 'HomeState(status: $status, markets: $markets, selectedMarket: $selectedMarket, selectedAsset: $selectedAsset, price: $price, initialPrice: $initialPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._markets, _markets) &&
            const DeepCollectionEquality()
                .equals(other.selectedMarket, selectedMarket) &&
            const DeepCollectionEquality()
                .equals(other.selectedAsset, selectedAsset) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality()
                .equals(other.initialPrice, initialPrice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_markets),
      const DeepCollectionEquality().hash(selectedMarket),
      const DeepCollectionEquality().hash(selectedAsset),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(initialPrice));

  @JsonKey(ignore: true)
  @override
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final HomeStateStatus status,
      final List<Market> markets,
      final Market? selectedMarket,
      final ActiveSymbol? selectedAsset,
      final double? price,
      final double? initialPrice}) = _$_HomeState;

  @override
  HomeStateStatus get status;
  @override
  List<Market> get markets;
  @override
  Market? get selectedMarket;
  @override
  ActiveSymbol? get selectedAsset;
  @override
  double? get price;
  @override
  double? get initialPrice;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

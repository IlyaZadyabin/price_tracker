import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:price_tracker/data/custom/socket_stream.dart';
import 'package:price_tracker/domain/domain.dart';
import 'package:price_tracker/view/home/cubit/home_cubit.dart';

import '../../helpers/test_data.dart';

class MockRepository extends Mock implements MarketRepository {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HomeCubit', () {
    late IMarketRepository repository;

    setUp(() {
      repository = MockRepository();
      final stream = Stream.value(fakeMarkets);
      when(() => repository.marketWithAssets()).thenAnswer(
        (_) async => Future.value(
          Right(
            SocketStream(
              stream: stream,
              close: () {},
            ),
          ),
        ),
      );
    });

    test('initial markets are empty', () {
      expect(
        HomeCubit(marketRepository: repository).state.markets,
        equals([]),
      );
    });

    blocTest<HomeCubit, HomeState>(
      'return markets when selectMarket() is called',
      build: () => HomeCubit(marketRepository: repository),
      seed: () => HomeState(markets: fakeMarkets),
      act: (cubit) => cubit.selectMarket(fakeMarkets[2]),
      skip: 1,
      expect: () => [
        isA<HomeState>()
            .having(
              (state) => state.status,
              'status',
              equals(HomeStateStatus.dataFetched),
            )
            .having(
              (state) => state.selectedMarket,
              'selectedMarket',
              equals(fakeMarkets[2]),
            ),
      ],
    );
  });
}

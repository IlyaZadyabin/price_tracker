import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:price_tracker/data/data.dart';
import 'package:price_tracker/domain/domain.dart';
import 'package:price_tracker/view/home/cubit/home_cubit.dart';
import 'package:price_tracker/view/home/screen/home_screen.dart';

import '../../helpers/helpers.dart';
import '../../helpers/test_data.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {
  MockHomeCubit({required this.marketRepository});

  @override
  final IMarketRepository marketRepository;
}

class MockRepository extends Mock implements MarketRepository {}

void main() {
  group('HomeScreen', () {
    late HomeCubit homeCubit;
    late IMarketRepository repository;

    setUp(() {
      repository = MockRepository();
      homeCubit = MockHomeCubit(marketRepository: repository);
    });

    testWidgets('renders current state', (tester) async {
      const state = HomeState();
      final stream = Stream.value(fakeMarkets);

      when(repository.marketWithAssets).thenAnswer(
        (_) async => Future.value(
          Right(
            SocketStream(
              stream: stream,
              close: () {},
            ),
          ),
        ),
      );

      when(() => repository.priceOfSymbol(any())).thenAnswer(
        (_) async => Future.value(
          Right(
            SocketStream(
              stream: Stream.fromIterable(<double>[1, 0, 15, -5]),
              close: () {},
            ),
          ),
        ),
      );
      when(() => homeCubit.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          value: homeCubit,
          child: const HomeScreen(),
        ),
      );
      expect(find.text('Price tracker'), findsOneWidget);
    });
  });
}

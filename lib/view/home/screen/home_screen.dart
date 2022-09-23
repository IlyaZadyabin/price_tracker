import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:price_tracker/data/api_service.dart';
import 'package:price_tracker/domain/market_repository.dart';
import 'package:price_tracker/domain/models/active_symbol.dart';
import 'package:price_tracker/domain/models/market.dart';
import 'package:price_tracker/view/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        marketRepository: MarketRepository(
          apiService: ApiService(dio: GetIt.instance.get<Dio>()),
        ),
      ),
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();
    final state = cubit.state;

    final dropdownMarkets = state.markets
        .map((e) => DropdownMenuItem<Market>(value: e, child: Text(e.name)))
        .toList();
    final dropdownAssets = state.selectedMarket?.assets
        .map(
          (e) => DropdownMenuItem<ActiveSymbol>(value: e, child: Text(e.name)),
        )
        .toList();

    Color priceColor = Colors.grey;
    final price = state.price;
    final initialPrice = state.initialPrice;

    if (price != null && initialPrice != null) {
      if (price > initialPrice) {
        priceColor = Colors.green;
      } else if (price < initialPrice) {
        priceColor = Colors.red;
      } else {
        priceColor = Colors.grey;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Price tracker')),
      body: Center(
        child: (state.status.isInitialLoading)
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    hint: const Text('Select a Market'),
                    value: state.selectedMarket,
                    items: dropdownMarkets,
                    onChanged: cubit.selectMarket,
                  ),
                  const SizedBox(height: 15),
                  DropdownButton(
                    hint: const Text('Select an Asset'),
                    value: state.selectedAsset,
                    items: dropdownAssets,
                    onChanged: cubit.selectAsset,
                  ),
                  const SizedBox(height: 15),
                  if (state.status.isPriceLoading)
                    const CircularProgressIndicator()
                  else if (price != null)
                    Text(
                      price.toString(),
                      style: TextStyle(
                        color: priceColor,
                        fontSize: 30,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}

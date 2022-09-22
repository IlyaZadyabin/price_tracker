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
    final dropdownMarkets = cubit.state.markets
        .map((e) => DropdownMenuItem<Market>(value: e, child: Text(e.name)))
        .toList();
    final dropdownAssets = cubit.state.selectedMarket?.assets
        .map(
          (e) => DropdownMenuItem<ActiveSymbol>(value: e, child: Text(e.name)),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Price tracker')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              hint: const Text('Select a Market'),
              value: cubit.state.selectedMarket,
              items: dropdownMarkets,
              onChanged: cubit.selectMarket,
            ),
            const SizedBox(height: 15),
            DropdownButton(
              hint: const Text('Select an Asset'),
              value: cubit.state.selectedAsset,
              items: dropdownAssets,
              onChanged: cubit.selectAsset,
            ),
          ],
        ),
      ),
    );
  }
}

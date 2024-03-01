import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/search_button.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  Timer? _timer;
  final _searchController = TextEditingController();
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());
  List<CryptoCoin> filteredCoinList = [];
  void filterCoinsByName(String name) async {
    var bb = await _cryptoListBloc.coinsRepository.getCoinsList();

    setState(() {
      filteredCoinList = bb.where((coin) {
        return coin.name.toLowerCase().contains(name.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _cryptoListBloc.add(LoadCryptoList());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async {
        final completer = Completer();
        _cryptoListBloc.add(LoadCryptoList(completer: completer));
        return completer.future;
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: theme.scaffoldBackgroundColor,
            surfaceTintColor: Colors.transparent,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: SearchButton(
                  controller: _searchController,
                  onChanged: (value) => filterCoinsByName(value)),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 16),
            sliver: BlocBuilder<CryptoListBloc, CryptoListState>(
              bloc: _cryptoListBloc,
              builder: (context, state) {
                if (state is CryptoListLoaded) {
                  final displayedCoins = filteredCoinList.isNotEmpty
                      ? filteredCoinList
                      : state.coinList;

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final coin = _searchController.text.isNotEmpty
                            ? displayedCoins[index]
                            : state.coinList[index];
                        return Column(
                          children: [
                            CryptoCoinTile(coin: coin),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                      childCount: displayedCoins.length,
                    ),
                  );
                } else if (state is CryptoListLoadingFailure) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Column(
                        children: [
                          const Text('Error, please try again later'),
                          const SizedBox(height: 35),
                          TextButton(
                            onPressed: () {
                              _cryptoListBloc.add(LoadCryptoList());
                            },
                            child: const Text('Refresh'),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    ));
  }
}

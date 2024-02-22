import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/search_bottom_sheet.dart';
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
  final _searchController = TextEditingController();
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text('Crypto Currencies List'),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           Navigator.of(context).push(MaterialPageRoute(
        //               builder: (context) =>
        //                   TalkerScreen(talker: GetIt.I<Talker>())));
        //         },
        //         icon: Icon(
        //           Icons.document_scanner,
        //           color: Colors.white,
        //         ))
        //   ],
        // ),
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
                onTap: () => _showSearchButtonSheet(
                  context,
                ),
                controller: _searchController,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 16),
            sliver: BlocBuilder<CryptoListBloc, CryptoListState>(
              bloc: _cryptoListBloc,
              builder: (context, state) {
                if (state is CryptoListLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final coin = state.coinList[index];
                        return Column(
                          children: [
                            CryptoCoinTile(coin: coin),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                      childCount: state.coinList.length,
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

  Future<void> _showSearchButtonSheet(BuildContext context) async {
    final query = await showModalBottomSheet<String>(
        //параметр который открывает на весь экран
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.only(top: 80),
              child: SearchCoinBottomSheet(
                searchController: _searchController,
              ),
            ));
  }
}

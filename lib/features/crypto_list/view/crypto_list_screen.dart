import 'dart:async';

import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins_list/features/crypto_list/widgets/widgets.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Crypto Currencies List'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          TalkerScreen(talker: GetIt.I<Talker>())));
                },
                icon: Icon(
                  Icons.document_scanner,
                  color: Colors.white,
                ))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cryptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: state.coinList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final coin = state.coinList[index];

                    return CryptoCoinTile(coin: coin);
                  },
                );
              }
              if (state is CryptoListLoadingFailure) {
                return Center(
                  child: Column(
                    children: [
                      const Text('Error , please try again later'),
                      const SizedBox(height: 35),
                      TextButton(
                          onPressed: () {
                            _cryptoListBloc.add(LoadCryptoList());
                          },
                          child: const Text('Refresh'))
                    ],
                  ),
                );
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              ));
            },
          ),
        )

        // (_cryptoCoinsList == null)
        // ? const Center(
        //     child: CircularProgressIndicator(
        //     color: Colors.blue,
        //   ))
        // : ListView.separated(
        //     padding: const EdgeInsets.only(top: 16),
        //     separatorBuilder: (BuildContext context, int index) =>
        //         const Divider(),
        //     itemCount: _cryptoCoinsList!.length,
        //     itemBuilder: (BuildContext context, int index) {
        //       final coin = _cryptoCoinsList![index];

        //       return CryptoCoinTile(coin: coin);
        //     },
        //   ),
        );
  }
}
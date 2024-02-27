import 'dart:isolate';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto_coin/bloc/crypto_coin_details/crypto_coin_details_bloc.dart';
import 'package:crypto_coins_list/features/crypto_coin/view/charts.dart';
import 'package:crypto_coins_list/features/crypto_coin/widgets/base_card.dart';
import 'package:crypto_coins_list/in_app_push_notif.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key, required this.coin});

  final CryptoCoin coin;

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  final _coinDetailsBloc = CryptoCoinDetailsBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  void initState() {
    _coinDetailsBloc.add(LoadCryptoCoinDetails(currencyCode: widget.coin.name));
// здесь нужно будет дописать таймер на обновление цены монеты каждые несколько сек
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        iconTheme: theme.appBarTheme.actionsIconTheme,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: [
        BlocBuilder<CryptoCoinDetailsBloc, CryptoCoinDetailsState>(
          bloc: _coinDetailsBloc,
          builder: (context, state) {
            if (state is CryptoCoinDetailsLoaded) {
              final coin = state.coin;
              final coinDetails = coin.details;
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: Image.network(coinDetails.fullImageUrl),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      coin.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    BaseCard(
                      child: Center(
                        child: Text(
                          '${coinDetails.priceInUSD} \$',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    BaseCard(
                      child: Column(
                        children: [
                          _DataRow(
                            title: 'Hight 24 Hour',
                            value:
                                '${coinDetails.hight24Hour.toStringAsFixed(1)} \$',
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              height: 1,
                            ),
                          ),
                          _DataRow(
                            title: 'Low 24 Hour',
                            value:
                                '${coinDetails.low24Hours.toStringAsFixed(1)} \$',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: double.infinity,
                          height: 330,
                          child: ChartsLine(coin: coin)
                          //  ChartsLine(
                          //   coin: coin,
                          // )
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                          height: 250,
                          width: 350,
                          child: CryptoPriceTracker(
                            coin: coin,
                          )),
                    ),
                    Center(
                        child: TextButton(
                            onPressed: () {
                              final recivePort = ReceivePort();
                              Isolate.spawn(summ, recivePort.sendPort);
                              recivePort.listen((total) {
                                debugPrint('Result 1: $total');
                              });
                            },
                            child: const Text('sdasd')))
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ]),
    );
  }
}

class _DataRow extends StatelessWidget {
  const _DataRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 140, child: Text(title)),
        Flexible(
          child: Text(value),
        ),
      ],
    );
  }
}

summ(SendPort sendPort) {
  var total = 0;
  for (var i = 0; i <= 1000000000; i++) {
    total = i;
  }
  sendPort.send(total);
}

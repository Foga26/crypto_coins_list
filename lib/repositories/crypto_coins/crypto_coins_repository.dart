// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/news_list.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'models/crypto_coin_details.dart';

class CryptoCoinRepository implements AbstractCoinsRepository {
  final Dio dio;
  final Box<CryptoCoin> cryptoCoinsBox;
  CryptoCoinRepository({
    required this.dio,
    required this.cryptoCoinsBox,
  });
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    var cryptoCoinsList = <CryptoCoin>[];
    try {
      cryptoCoinsList = await _fetchCoinsListFromApi();
      final cryptoCoinsMap = {for (var e in cryptoCoinsList) e.name: e};
      await cryptoCoinsBox.putAll(cryptoCoinsMap);
    } catch (e, st) {
      GetIt.instance<Talker>().handle(e, st);
      cryptoCoinsList = cryptoCoinsBox.values.toList();
    }
    //сортировка локальных данных по цене
    cryptoCoinsList
        .sort((a, b) => b.details.priceInUSD.compareTo(a.details.priceInUSD));
    return cryptoCoinsList;
  }

  Future<List<CryptoCoin>> _fetchCoinsListFromApi() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ADA,DOGE,KAS,ETC,DAI,IMXm,ICP,GRT,STXk,VET,SHIB,TON,TRX,ETH,BNB,USDC,AID,AERGO,KAS,AGI,DAI,AVAX,MATIC,LINK,BRAT,BRD,BSTN,BQTX&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final details = CryptoCoinDetail.fromJson(usdData);
      return CryptoCoin(name: e.key, details: details);
    }).toList();
    return cryptoCoinsList;
  }

  @override
  Future<CryptoCoin> getCoinDetails(String currencyCode) async {
    try {
      final coin = await _fetchCoinDetailsFromApi(currencyCode);
      cryptoCoinsBox.put(currencyCode, coin);
      return coin;
    } catch (e, st) {
      GetIt.instance<Talker>().handle(e, st);
      return cryptoCoinsBox.get(currencyCode)!;
    }
  }

  Future<CryptoCoin> _fetchCoinDetailsFromApi(String currencyCode) async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=$currencyCode&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final coinData = dataRaw[currencyCode] as Map<String, dynamic>;
    final usdData = coinData['USD'] as Map<String, dynamic>;
    final details = CryptoCoinDetail.fromJson(usdData);
    return CryptoCoin(name: currencyCode, details: details);
  }

  @override
  Future<List<NewsList>> getNewsList() async {
    final response = await dio
        .get('https://min-api.cryptocompare.com/data/v2/news/?lang=EN');
    final data = response.data['Data'] as List<dynamic>;

    final newsList = data.map((news) {
      return NewsList(
          title: news['title'] as String,
          body: news['body'] as String,
          id: int.parse(news['id']),
          imageurl: news['imageurl'],
          guid: news['guid']);
    }).toList();

    return newsList;
  }
}

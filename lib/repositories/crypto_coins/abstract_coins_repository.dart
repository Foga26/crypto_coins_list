import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/news_list.dart';

abstract class AbstractCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList();
  Future<CryptoCoin> getCoinDetails(String currencyCode);
  Future<List<NewsList>> getNewsList();
}

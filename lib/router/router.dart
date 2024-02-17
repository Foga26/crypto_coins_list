import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';
import 'package:crypto_coins_list/features/news/view/news_screen_full.dart';
import 'package:crypto_coins_list/main_screen_widget.dart';

final routes = {
  '/': (context) => const MainScreenwidget(),
  '/coin': (context) => CryptoCoinScreen(),
  '/news': (context) => NewsScreenFull(),
};

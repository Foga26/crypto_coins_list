import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';
import 'package:crypto_coins_list/features/news/view/news_screen.dart';
import 'package:crypto_coins_list/features/news/view/news_screen_full.dart';
import 'package:crypto_coins_list/features/settings/view/settings_screen.dart';
import 'package:crypto_coins_list/main_screen/lottie.dart';
import 'package:crypto_coins_list/main_screen/main_screen_widget.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/news_list.dart';
import 'package:flutter/material.dart';

import '../repositories/crypto_coins/models/crypto_coin.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  //обязательно после генирации добавляем сюда каждую страницу которая нужна для переходов
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LottieRouteWidget.page,
          path: '/',
          children: [
            AutoRoute(page: MainRoutewidget.page, path: 'main'),
            AutoRoute(page: NewsRoute.page, path: 'news'),
            AutoRoute(page: CryptoListRoute.page, path: 'cryptoList'),
            AutoRoute(page: SettingRouteWidget.page, path: 'settings'),
          ],
        ),
        AutoRoute(page: NewsRouteFull.page, path: '/newFull'),
        AutoRoute(page: CryptoCoinRoute.page, path: '/cryptoCoin'),
      ];
}






// final routes = {
//   '/': (context) => const MainScreenwidget(),
//   '/coin': (context) => CryptoCoinScreen(),
//   '/news': (context) => NewsScreenFull(),
// };

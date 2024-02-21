import 'package:crypto_coins_list/main_screen_widget.dart';
import 'package:crypto_coins_list/router/router.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCurrenciesListApp extends StatefulWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  State<CryptoCurrenciesListApp> createState() =>
      _CryptoCurrenciesListAppState();
}

class _CryptoCurrenciesListAppState extends State<CryptoCurrenciesListApp> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    // при генерации роутеров обязательно ставим материал.роутер
    //указываем обязательно роутер конфиг и в него можно добавить обсервы
    //есть еще route guards можно сделать настройки авторизации если авторизован кидает на страницу если нет кидает экран авторизации
    return MaterialApp.router(
      title: 'Crypto Currencies List',
      theme: darkTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
      ),
    );
  }
}

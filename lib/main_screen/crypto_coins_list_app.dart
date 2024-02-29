import 'package:crypto_coins_list/features/theme/theme_provider.dart';
import 'package:crypto_coins_list/router/router.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCurrenciesListApp extends StatefulWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  State<CryptoCurrenciesListApp> createState() =>
      _CryptoCurrenciesListAppState();
}

class _CryptoCurrenciesListAppState extends State<CryptoCurrenciesListApp> {
  final _appRouter = AppRouter();
  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    var isLight = Provider.of<ThemeTest>(context).isLightTheme;
    // при генерации роутеров обязательно ставим материал.роутер
    //указываем обязательно роутер конфиг и в него можно добавить обсервы
    //есть еще route guards можно сделать настройки авторизации если авторизован кидает на страницу если нет кидает экран авторизации
    return MaterialApp.router(
      title: 'Crypto Currencies List',
      theme: isLight ? darkTheme : lightTheme,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [TalkerRouteObserver(GetIt.I<Talker>())],
      ),
    );
  }
}

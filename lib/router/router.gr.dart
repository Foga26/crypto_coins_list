// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CryptoCoinRoute.name: (routeData) {
      final args = routeData.argsAs<CryptoCoinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CryptoCoinScreen(
          key: args.key,
          coin: args.coin,
        ),
      );
    },
    CryptoListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CryptoListScreen(),
      );
    },
    LottieRouteWidget.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LottieScreenWidget(),
      );
    },
    MainRoutewidget.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreenwidget(),
      );
    },
    NewsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsScreen(),
      );
    },
    NewsRouteFull.name: (routeData) {
      final args = routeData.argsAs<NewsRouteFullArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsScreenFull(
          key: args.key,
          news: args.news,
        ),
      );
    },
    SettingRouteWidget.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingScreenWidget(),
      );
    },
  };
}

/// generated route for
/// [CryptoCoinScreen]
class CryptoCoinRoute extends PageRouteInfo<CryptoCoinRouteArgs> {
  CryptoCoinRoute({
    Key? key,
    required CryptoCoin coin,
    List<PageRouteInfo>? children,
  }) : super(
          CryptoCoinRoute.name,
          args: CryptoCoinRouteArgs(
            key: key,
            coin: coin,
          ),
          initialChildren: children,
        );

  static const String name = 'CryptoCoinRoute';

  static const PageInfo<CryptoCoinRouteArgs> page =
      PageInfo<CryptoCoinRouteArgs>(name);
}

class CryptoCoinRouteArgs {
  const CryptoCoinRouteArgs({
    this.key,
    required this.coin,
  });

  final Key? key;

  final CryptoCoin coin;

  @override
  String toString() {
    return 'CryptoCoinRouteArgs{key: $key, coin: $coin}';
  }
}

/// generated route for
/// [CryptoListScreen]
class CryptoListRoute extends PageRouteInfo<void> {
  const CryptoListRoute({List<PageRouteInfo>? children})
      : super(
          CryptoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'CryptoListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LottieScreenWidget]
class LottieRouteWidget extends PageRouteInfo<void> {
  const LottieRouteWidget({List<PageRouteInfo>? children})
      : super(
          LottieRouteWidget.name,
          initialChildren: children,
        );

  static const String name = 'LottieRouteWidget';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreenwidget]
class MainRoutewidget extends PageRouteInfo<void> {
  const MainRoutewidget({List<PageRouteInfo>? children})
      : super(
          MainRoutewidget.name,
          initialChildren: children,
        );

  static const String name = 'MainRoutewidget';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsScreen]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewsScreenFull]
class NewsRouteFull extends PageRouteInfo<NewsRouteFullArgs> {
  NewsRouteFull({
    Key? key,
    required NewsList news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsRouteFull.name,
          args: NewsRouteFullArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsRouteFull';

  static const PageInfo<NewsRouteFullArgs> page =
      PageInfo<NewsRouteFullArgs>(name);
}

class NewsRouteFullArgs {
  const NewsRouteFullArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final NewsList news;

  @override
  String toString() {
    return 'NewsRouteFullArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [SettingScreenWidget]
class SettingRouteWidget extends PageRouteInfo<void> {
  const SettingRouteWidget({List<PageRouteInfo>? children})
      : super(
          SettingRouteWidget.name,
          initialChildren: children,
        );

  static const String name = 'SettingRouteWidget';

  static const PageInfo<void> page = PageInfo<void>(name);
}

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
    MainRoutewidget.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreenwidget(),
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

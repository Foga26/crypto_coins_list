import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/news/widgets/news_full_screen_list_view.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/news_list.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewsScreenFull extends StatelessWidget {
  const NewsScreenFull({
    super.key,
    required this.news,
  });
  final NewsList news;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          iconTheme: theme.appBarTheme.actionsIconTheme,
          backgroundColor: Colors.transparent,
        ),
        body: NewsFullScreenListView(
          news: news,
        ));
  }
}

import 'package:crypto_coins_list/features/news/widgets/news_full_screen_list_view.dart';
import 'package:flutter/material.dart';

class NewsScreenFull extends StatelessWidget {
  NewsScreenFull({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('News'),
        ),
        body: NewsFullScreenListView());
  }
}

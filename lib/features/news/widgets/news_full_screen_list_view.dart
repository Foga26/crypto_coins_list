import 'package:crypto_coins_list/features/news/bloc/news_list/new_list_bloc.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/news_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFullScreenListView extends StatefulWidget {
  const NewsFullScreenListView({super.key, required this.news});
  final NewsList news;

  @override
  State<NewsFullScreenListView> createState() => _NewsFullScreenListViewState();
}

class _NewsFullScreenListViewState extends State<NewsFullScreenListView> {
  void _launchURL(String url) async {
    await launch(url);
  }

  final _newsListBloc = NewsListBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );
  @override
  void initState() {
    _newsListBloc.add(LoadNewsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '<<${widget.news.title}>>',
                style: theme.textTheme.headlineLarge,
              ),
            ),
            SizedBox(
                width: 200,
                height: 200,
                child: Image.network(widget.news.imageurl)),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.news.body,
                  style: theme.textTheme.headlineSmall!.copyWith(fontSize: 17),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: theme.textButtonTheme.style,
                  onPressed: () {
                    _launchURL(widget.news.guid);
                  },
                  child: Text(
                    'Read More',
                    style: theme.textTheme.headlineMedium,
                  )),
            )
          ],
        ),
      ),
    ]);
  }
}

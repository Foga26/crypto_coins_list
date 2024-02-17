import 'package:crypto_coins_list/features/news/bloc/news_list/new_list_bloc.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/news_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFullScreenListView extends StatefulWidget {
  const NewsFullScreenListView({super.key});

  @override
  State<NewsFullScreenListView> createState() => _NewsFullScreenListViewState();
}

class _NewsFullScreenListViewState extends State<NewsFullScreenListView> {
  void _launchURL(String url) async {
    await launch(url);
  }

  NewsList? news;
  final _newsListBloc = NewsListBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;

    news = args as NewsList;
    _newsListBloc.add(LoadNewsList());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '<<${news!.title}>>',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                width: 200, height: 200, child: Image.network(news!.imageurl)),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  news!.body,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () {
                    _launchURL(news!.guid);
                  },
                  child: Text(
                    'Read More',
                    style: TextStyle(color: Colors.black),
                  )),
            )
          ],
        ),
      ),
    ]);
  }
}

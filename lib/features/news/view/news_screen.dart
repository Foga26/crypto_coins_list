import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/news/bloc/news_list/new_list_bloc.dart';
import 'package:crypto_coins_list/features/news/widgets/news_tile.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final _newsListBloc = NewsListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _newsListBloc.add(LoadNewsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _newsListBloc.add(LoadNewsList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<NewsListBloc, NewsListState>(
          bloc: _newsListBloc,
          builder: (context, state) {
            if (state is NewsListLoaded) {
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  height: 1,
                ),
                itemCount: state.newsList.length,
                itemBuilder: (BuildContext context, int index) {
                  final news = state.newsList[index];

                  return NewsTile(
                    news: news,
                  );
                },
              );
            }
            if (state is NewsListLoadingFailure) {
              return Center(
                child: Column(
                  children: [
                    const Text('Error , please try again later'),
                    const SizedBox(height: 35),
                    TextButton(
                        onPressed: () {
                          _newsListBloc.add(LoadNewsList());
                        },
                        child: const Text('Refresh'))
                  ],
                ),
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          },
        ),
      ),
    );
  }
}

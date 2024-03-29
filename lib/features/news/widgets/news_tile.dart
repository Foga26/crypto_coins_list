import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/news_list.dart';
import 'package:crypto_coins_list/router/router.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});
  final NewsList news;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black, width: 4),
              borderRadius: BorderRadius.circular(10)),
          tileColor: Colors.black.withOpacity(0.1),
          onTap: () {
            AutoRouter.of(context).push(NewsRouteFull(news: news));
          },
          title: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  news.title,
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    news.body,
                    softWrap: true,
                    style: theme.textTheme.headlineSmall),
              ],
            ),
          ),
          subtitle: SizedBox(
              height: 150,
              width: 150,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35),
                  ),
                  child: Image.network(news.imageurl))),
        ),
      ),
    );
  }
}

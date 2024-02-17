import 'package:crypto_coins_list/repositories/crypto_coins/models/news_list.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.news});
  final NewsList news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushNamed('/news', arguments: news);
          },
          title: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              news.title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
          ),
          subtitle: Text(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            news.body,
            softWrap: true,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          leading: SizedBox(
              height: 70,
              width: 70,
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

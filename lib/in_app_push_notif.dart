import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CryptoPriceTracker extends StatefulWidget {
  final CryptoCoin coin;
  const CryptoPriceTracker({super.key, required this.coin});

  @override
  _CryptoPriceTrackerState createState() => _CryptoPriceTrackerState();
}

class _CryptoPriceTrackerState extends State<CryptoPriceTracker> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  // Пример переменной с ценой

  @override
  void initState() {
    super.initState();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var androidInitialize = const AndroidInitializationSettings('app_icon');

    var initializationSettings = InitializationSettings(
      android: androidInitialize,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _displayNotification(String title, String body) async {
    var androidDetails = const AndroidNotificationDetails(
        'channel id', 'channel name',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');

    var platformDetails = NotificationDetails(
      android: androidDetails,
    );
    await flutterLocalNotificationsPlugin.show(0, title, body, platformDetails,
        payload: 'crypto_price');
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0, title, body, RepeatInterval.everyMinute, platformDetails,
        // ignore: deprecated_member_use
        androidAllowWhileIdle: true);
  }

  void checkPrice() {
    // Пример метода, проверяющего цены криптовалют и вызывающего уведомления
    if (widget.coin.details.priceInUSD > 1 ||
        widget.coin.details.priceInUSD < 1) {
      _displayNotification('${widget.coin.name} Price Alert',
          '${widget.coin.name} price is \$ ${widget.coin.details.priceInUSD}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.coin.name}: \$ ${widget.coin.details.priceInUSD}',
              style: const TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: checkPrice,
              child: const Text('Check Price'),
            ),
          ],
        ),
      ),
    );
  }
}

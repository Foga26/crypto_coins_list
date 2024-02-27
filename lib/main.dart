import 'dart:async';

import 'package:crypto_coins_list/crypto_coins_list_app.dart';
import 'package:crypto_coins_list/features/theme/theme_provider.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  const cryptoCoinsBoxName = 'crypto_coins_box';
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>();

  Hive.registerAdapter(CryptoCoinAdapter());
  Hive.registerAdapter(CryptoCoinDetailAdapter());
  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);
  //Сущность создана 1 раз и на все приложение существует только 1 такая сущность
  final dio = Dio();

  dio.interceptors.add(TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      )));
  Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
          printStateFullData: false, printEventFullData: false));
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinRepository(dio: dio, cryptoCoinsBox: cryptoCoinsBox));

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);
  runZonedGuarded(
      () => runApp(ChangeNotifierProvider(
          create: (context) => ThemeTest(),
          child: const CryptoCurrenciesListApp())),
      (error, stack) => GetIt.I<Talker>().handle(error, stack));
}

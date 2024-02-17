import 'dart:async';

import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/news_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  NewsListBloc(
    this.coinsRepository,
  ) : super(NewsListInitial()) {
    // Регистрация обработчика ивента
    on<LoadNewsList>((event, emit) async {
      try {
        if (state is! NewsListLoaded) {
          emit(NewsListLoading());
        }

        final newsList = await coinsRepository.getNewsList();
        emit(NewsListLoaded(newsList: newsList));
      } catch (e, st) {
        emit(NewsListLoadingFailure(exeption: e));
        GetIt.I<Talker>().handle(e, st);
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;
}

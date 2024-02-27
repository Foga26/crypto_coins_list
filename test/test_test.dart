import 'package:crypto_coins_list/features/news/bloc/news_list/new_list_bloc.dart';
import 'package:crypto_coins_list/features/news/view/news_screen.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/news_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockNewsListBloc extends Mock implements NewsListBloc {}

class MockAbstractCoinsRepository extends Mock
    implements AbstractCoinsRepository {}

void main() {
  group('NewsScreen Widget Test', () {
    MockNewsListBloc mockNewsListBloc;
    MockAbstractCoinsRepository mockAbstractCoinsRepository;

    setUp(() {
      mockNewsListBloc = MockNewsListBloc();
      mockAbstractCoinsRepository = MockAbstractCoinsRepository();

      GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
          () => mockAbstractCoinsRepository);
    });

    testWidgets('Widget builds properly', (WidgetTester tester) async {
      mockNewsListBloc = MockNewsListBloc();
      when(mockNewsListBloc.state).thenAnswer((_) => NewsListLoading());

      await tester.pumpWidget(
        BlocProvider.value(
          value: mockNewsListBloc,
          child: const MaterialApp(
            home: NewsScreen(),
          ),
        ),
      );

      expect(find.byType(RefreshIndicator), findsOneWidget);
      expect(find.byType(BlocBuilder<NewsListBloc, NewsListState>),
          findsOneWidget);
    });
    testWidgets('Widget displays loading state properly',
        (WidgetTester tester) async {
      mockNewsListBloc = MockNewsListBloc();
      when(mockNewsListBloc.state).thenAnswer((_) => NewsListLoading());

      await tester.pumpWidget(
        const MaterialApp(
          home: NewsScreen(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Widget displays data loaded state properly',
        (WidgetTester tester) async {
      mockNewsListBloc = MockNewsListBloc();
      final List<NewsList> newsList = [
        NewsList(
            id: 1,
            imageurl: '',
            title: 'adasdasdasd',
            body: 'sadasd',
            guid: 'asdasd'),
        NewsList(
            id: 2,
            imageurl: 'sxcxcascas',
            title: 'dsadasd',
            body: 'sadsad',
            guid: 'asdasd')
      ];
      when(mockNewsListBloc.state)
          .thenAnswer((_) => NewsListLoaded(newsList: newsList));

      await tester.pumpWidget(
        BlocProvider.value(
          value: mockNewsListBloc,
          child: const MaterialApp(
            home: NewsScreen(),
          ),
        ),
      );

      expect(find.text('News 1'), findsOneWidget);
      expect(find.text('News 2'), findsOneWidget);
      expect(find.text('News 3'), findsOneWidget);
    });

    testWidgets('Widget displays error state properly',
        (WidgetTester tester) async {
      mockNewsListBloc = MockNewsListBloc();
      when(mockNewsListBloc.state).thenAnswer((_) => NewsListLoadingFailure());

      await tester.pumpWidget(
        const MaterialApp(
          home: NewsScreen(),
        ),
      );

      expect(find.text('Error , please try again later'), findsOneWidget);
      expect(find.text('Refresh'), findsOneWidget);
    });

    tearDown(() {
      GetIt.I.unregister<AbstractCoinsRepository>();
    });
  });
}

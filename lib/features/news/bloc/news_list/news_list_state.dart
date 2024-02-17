part of 'new_list_bloc.dart';

abstract class NewsListState extends Equatable {}

class NewsListInitial extends NewsListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsListLoading extends NewsListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsListLoaded extends NewsListState {
  final List<NewsList> newsList;

  NewsListLoaded({
    required this.newsList,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [newsList];
}

class NewsListLoadingFailure extends NewsListState {
  NewsListLoadingFailure({
    this.exeption,
  });
  final Object? exeption;

  @override
  // TODO: implement props
  List<Object?> get props => [exeption];
}

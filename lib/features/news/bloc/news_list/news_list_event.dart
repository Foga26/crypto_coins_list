part of 'new_list_bloc.dart';

abstract class NewsListEvent extends Equatable {}

class LoadNewsList extends NewsListEvent {
  LoadNewsList({
    this.completer,
  });

  final Completer? completer;

  @override
  // TODO: implement props
  List<Object?> get props => [completer];
}

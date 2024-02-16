// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  final List<CryptoCoin> coinList;

  CryptoListLoaded({
    required this.coinList,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [coinList];
}

class CryptoListLoadingFailure extends CryptoListState {
  CryptoListLoadingFailure({
    this.exeption,
  });
  final Object? exeption;

  @override
  // TODO: implement props
  List<Object?> get props => [exeption];
}

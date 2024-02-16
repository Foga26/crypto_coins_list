// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_details.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'crypto_coin.g.dart';

@HiveType(typeId: 2)
class CryptoCoin extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final CryptoCoinDetail details;

  CryptoCoin({
    required this.name,
    required this.details,
  });

  @override
  // TODO: implement props
  List<Object> get props => [name, details];
}

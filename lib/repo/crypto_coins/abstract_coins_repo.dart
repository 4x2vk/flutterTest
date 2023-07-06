import 'package:flutter_test_demo/repo/crypto_coins/models/crypto_coin.dart';

abstract class AbstractCoinsRepo {
  Future<List<CryptoCoin>> getCoinList();
 }
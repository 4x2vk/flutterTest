import 'package:dio/dio.dart';
import 'package:flutter_test_demo/repo/crypto_coins/models/crypto_coin.dart';

class CryptoCoinRepo {
  Future<List<CryptoCoin>> getCoinList() async {
    final response = await Dio().get('https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB&tsyms=USD,KRW');
    final data = response.data as Map<String, dynamic>;
    final cryptoCoinsList = data.entries.map((e) => CryptoCoin(name: e.key, priceInUSD: (e.value as Map<String, dynamic>)['USD'],)).toList();
    return cryptoCoinsList;  
  }
}
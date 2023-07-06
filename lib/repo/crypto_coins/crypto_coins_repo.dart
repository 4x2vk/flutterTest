import 'package:dio/dio.dart';
import 'package:flutter_test_demo/repo/crypto_coins/crypto_coins.dart';
 
class CryptoCoinRepo implements AbstractCoinsRepo{
  CryptoCoinRepo({
    required this.dio,
  });
  
  final Dio dio;

  @override
  Future<List<CryptoCoin>> getCoinList() async {
    final response = await dio.get('https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID&tsyms=USD,KRW');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data ['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) { 
      final usdData = (e.value as Map<String, dynamic>) ['USD'] as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return CryptoCoin(
        name: e.key, 
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com/$imageUrl',
      );
    }).toList();
    return cryptoCoinsList;  
  }
}
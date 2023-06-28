import 'package:flutter_test_demo/features/crypto_list/crypto_list.dart';
import 'package:flutter_test_demo/features/crypto_coin/crypto_coin.dart';

final routes = {
  '/': (context) => const CryptoListScreen(),
  '/coin': (context) => const CryptoCoinScreen(),
};
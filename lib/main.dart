import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_test_demo/crypto_coins_list_app.dart';
import 'package:flutter_test_demo/repo/crypto_coins/crypto_coins.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepo>(
      () => CryptoCoinRepo(dio: Dio()));
  runApp(const CryptoCurrenciesListApp());
}

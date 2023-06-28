import 'package:flutter/material.dart';
import 'package:flutter_test_demo/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_test_demo/repo/crypto_coins/crypto_coins_repo.dart';
import 'package:flutter_test_demo/repo/crypto_coins/models/crypto_coin.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key,});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  List<CryptoCoin>? _cryptoCoinsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoCurrenciesList'),
      ),
      body: (_cryptoCoinsList == null) 
        ? const SizedBox() 
        :ListView.separated(
          itemCount: _cryptoCoinsList!.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) {
            final coin = _cryptoCoinsList![i];
            final coinName = coin.name;
            return CryptoCoinTile(coinName: coinName);
          }, 
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.download), 
          onPressed: () async {
          _cryptoCoinsList = await CryptoCoinRepo().getCoinList();
          setState(() {});
        }
      ),
    );
  }
}
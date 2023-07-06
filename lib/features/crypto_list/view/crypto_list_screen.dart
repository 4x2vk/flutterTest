import 'package:flutter/material.dart';
import 'package:flutter_test_demo/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_test_demo/repo/crypto_coins/abstract_coins_repo.dart';
import 'package:flutter_test_demo/repo/crypto_coins/models/crypto_coin.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('CryptoCurrenciesList')),
      ),
      body: (_cryptoCoinsList == null)
          ? Center(child: const CircularProgressIndicator())
          : ListView.separated(
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _cryptoCoinsList![i];
                return CryptoCoinTile(coin: coin);
              },
            ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await GetIt.I<AbstractCoinsRepo>().getCoinList();
    setState(() {});
  }
}

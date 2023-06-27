import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FlutterTest extends StatefulWidget {
  const FlutterTest({super.key,});

  @override
  State<FlutterTest> createState() => _FlutterTestState();
}

class _FlutterTestState extends State<FlutterTest> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterTest'),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          const coinName = 'Bitcoin';
          return ListTile(
          leading: SvgPicture.asset('assets/svg/bitcoinLogo.svg', height: 30, width: 30,),
          title: Text(coinName, style: theme.textTheme.bodyMedium),
          subtitle: Text('200000\$', style: theme.textTheme.labelSmall),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).pushNamed('/coin', arguments: coinName,);
            },
          );
        }, 
      ),
    );
  }
}
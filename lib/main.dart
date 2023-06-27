import 'package:flutter/material.dart';
import 'package:flutter_test_demo/features/crypto_list/crypto_list.dart';

void main() {
  runApp(const FlutterTestApp());
}

class FlutterTestApp extends StatelessWidget {
  const FlutterTestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterTest',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        primarySwatch: Colors.yellow,
        dividerColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Color.fromARGB(255, 31, 31, 31), titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
          labelSmall: TextStyle(color: Colors.white.withOpacity(0.6), fontWeight: FontWeight.w500, fontSize: 14),
        ),
      ),
      routes: {
        '/': (context) => FlutterTest(),
        '/coin': (context) => FlutterTest2(),
      },
    );
  }
}

class FlutterTest2 extends StatefulWidget {
  const FlutterTest2({super.key});

  @override
  State<FlutterTest2> createState() => _FlutterTest2State();
}

class _FlutterTest2State extends State<FlutterTest2> {
  String? coinName;
  
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'Provide String args');
    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...')),
    );
  }
}
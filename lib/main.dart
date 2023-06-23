import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      home: const MyHomePage(title: 'Flutter Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset('assets/svg/bitcoinLogo.svg', height: 30, width: 30,),
          title: Text('Bitcoin', style: theme.textTheme.bodyMedium),
          subtitle: Text('200000\$', style: theme.textTheme.labelSmall),
          trailing: const Icon(Icons.arrow_forward_ios),
        ), 
      ),
    );
  }
}

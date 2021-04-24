import 'package:carrito_tul/src/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(TulApp());

class TulApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tul App',
      initialRoute: 'homePage',
      routes: {'homePage': (BuildContext context) => HomePage()},
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    );
  }
}

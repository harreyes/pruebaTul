import 'package:flutter/material.dart';
import 'package:carrito_tul/pages/home_page.dart';

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

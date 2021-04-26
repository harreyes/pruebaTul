import 'package:carrito_tul/src/bloc/cart/cart_bloc.dart';
import 'package:carrito_tul/src/presentation/pages/confirm_cart.dart';
import 'package:carrito_tul/src/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      child: TulApp(),
      providers: [BlocProvider(create: (_) => CartBloc())],
    );
  }
}

class TulApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tul App',
      initialRoute: 'homePage',
      routes: {
        'homePage': (BuildContext context) => HomePage(),
        'confirmCartPage': (BuildContext context) => ConirmCartPage()
      },
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:carrito_tul/src/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return Stack(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              if (state.countCart == 0) {
                _alert(context);
              } else {
                Navigator.pushNamed(context, 'confirmCartPage');
              }
            },
          ),
          Text('(' + state.countCart.toString() + ')')
        ],
      );
    });
  }

  void _alert(context) {
    showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          title: Text('Exitoso'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Debe añadir primero un elemento al carrito'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

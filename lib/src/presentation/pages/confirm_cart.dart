import 'package:flutter/material.dart';
import 'package:carrito_tul/src/bloc/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConirmCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              ListProducts(),
              ButtonConfirm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      // final cartBloc = BlocProvider.of<CartBloc>(context);
      return Text(state.docId);
    });
  }
}

class ButtonConfirm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.all(20),
          child: SizedBox(
            width: 250.0,
            height: 45.0,
            child: RaisedButton.icon(
                color: Colors.green,
                onPressed: () {
                  cartBloc.add(ConfirmCart());
                  cartBloc.add(SetIdCart(''));
                  Navigator.pop(context);
                  _alert(context);
                },
                icon: Icon(
                  Icons.shopping_bag_sharp,
                  color: Colors.white,
                  size: 30,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                label: Text(
                  'Realizar orden',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )),
          ),
        )
      ],
    );
  }
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
              Text('Orden realizada con éxito'),
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

import 'package:carrito_tul/src/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Carrito'),
            ),
            body: Center(
              child: ListView.builder(
                  itemCount: state.listProducts.length,
                  itemBuilder: (_, index) {
                    final List ids = [];
                    ids.add(state.listProducts[index].id);
                    print(ids);
                    return ListTile(
                      leading: Image.network(
                        state.listProducts[index]['img'],
                        height: 50,
                      ),
                      title: Text(state.listProducts[index]['nombre']),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          print('remove');
                          BlocProvider.of<CartBloc>(context)
                              .add(OnRemoveCart(state.listProducts[index]));
                        },
                      ),
                      subtitle: Text(state.listProducts[index]['descripcion']),
                    );
                  }),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.green,
              child: RaisedButton.icon(
                  color: Colors.green,
                  onPressed: () {
                    _alert(context, state);
                  },
                  icon: Icon(
                    Icons.shopping_bag_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: new BorderRadius.circular(30.0)),
                  label: Text(
                    'Realizar orden',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
            ));
      },
    );
  }
}

// class ButtonConfirm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return RaisedButton.icon(
//         color: Colors.green,
//         onPressed: () {
//           _alert(context);
//         },
//         icon: Icon(
//           Icons.shopping_bag_sharp,
//           color: Colors.white,
//           size: 30,
//         ),
//         // shape: RoundedRectangleBorder(
//         //     borderRadius: new BorderRadius.circular(30.0)),
//         label: Text(
//           'Realizar orden',
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ));
//   }
// }

void _alert(context, CartState state) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (context) {
      return AlertDialog(
        title: Text('CONFIRMAR'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Al dar clic en confirmar se iniciará la orden.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('CONFIRMAR'),
            onPressed: () {
              BlocProvider.of<CartBloc>(context).add(OnConfirmCart());
              Navigator.pushNamed(context, 'homePage');
            },
          ),
          TextButton(
            child: Text('CANCELAR'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

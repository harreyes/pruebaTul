import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:carrito_tul/src/presentation/widgets/shopping_cart.dart';

import 'package:carrito_tul/src/bloc/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
        actions: <Widget>[ShoppingCartIcon()],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("products").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return new ListView(
                children:
                    snapshot.data.documents.map((DocumentSnapshot document) {
                  // print(document.reference.documentID);
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: 210,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.35))
                      ],
                    ),
                    child: Column(
                      children: [
                        new ListTile(
                          title: new Text(
                            document['nombre'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: new Text(
                            document['descripcion'],
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20, left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                document['img'],
                                height: 130,
                              ),
                              RaisedButton.icon(
                                  color: Colors.green,
                                  onPressed: () async {
                                    // if (cartBloc. == '') {
                                    //   DocumentReference docRef = await Firestore
                                    //       .instance
                                    //       .collection('carts')
                                    //       .add({'status': 'pending'});
                                    //   print(docRef.documentID);
                                    //   cartBloc
                                    //       .add(SetIdCart(docRef.documentID));
                                    //   cartBloc.add(AddCart(0));
                                    // } else {
                                    //   cartBloc.add(AddCart(0));
                                    // }
                                    // print(document.reference.documentID);
                                  },
                                  icon: Icon(Icons.add_shopping_cart,
                                      color: Colors.white),
                                  label: Text(
                                    'Añadir producto',
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              );
          }
        },
      ),
    );
  }
}

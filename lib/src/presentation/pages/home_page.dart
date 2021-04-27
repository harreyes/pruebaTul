import 'package:carrito_tul/src/bloc/cart/cart_bloc.dart';
import 'package:carrito_tul/src/presentation/widgets/shopping_cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [ShoppingCartIcon()],
          title: Text('Listado Productos'),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CupertinoActivityIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data.size,
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      ListTile(
                          onTap: () {
                            BlocProvider.of<CartBloc>(context)
                                .add(OnAddCart(snapshot.data.docs[index]));
                          },
                          trailing: Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.black,
                          ),
                          // leading: Image.network(
                          //   snapshot.data.docs[index]['img'],
                          //   height: 50,
                          // ),
                          title: Text(snapshot.data.docs[index]['nombre']),
                          subtitle:
                              Text(snapshot.data.docs[index]['descripcion'])),
                      Image.network(
                        snapshot.data.docs[index]['img'],
                        height: 130,
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

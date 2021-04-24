import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final databaseReference = Firestore.instance;

  int number = 0;
  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Productos"),
        actions: <Widget>[shoppingCartIcon(context)],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("products").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<DocumentSnapshot> docs = snapshot.data.documents;

          return Container(
            // height: 300.0, // Change as per your requirement
            // width: 500.0,
            child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, i) {
                Map<String, dynamic> data = docs[i].data;
                print('-___-');
                print(data);
                print(data);
                return SingleChildScrollView(
                  child: Container(
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
                        ListTile(
                          title: Text(
                            data['nombre'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(data['descripcion']),
                        ),
                        Container(
                            width: 330,
                            height: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // PinchZoom(
                                //   image:
                                Image.network(
                                  data['img'],
                                  height: 125,
                                ),
                                //   zoomedBackgroundColor:
                                //       Colors.black.withOpacity(0.5),
                                //   resetDuration:
                                //       const Duration(milliseconds: 100),
                                //   maxScale: 2.5,
                                //   onZoomStart: () {
                                //     print('Start zooming');
                                //   },
                                //   onZoomEnd: () {
                                //     print('Stop zooming');
                                //   },
                                // ),
                                RaisedButton.icon(
                                    color: Colors.green,
                                    onPressed: () {
                                      // print(data[i]);
                                    },
                                    icon: Icon(Icons.add, color: Colors.white),
                                    label: Text(
                                      'Añadir producto',
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget shoppingCartIcon(BuildContext context) {
    // Using Stack to show Notification Badge
    return Stack(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        Text('($number)')
      ],
    );
  }

  // Stream<List<Product>> _data() async {
  //   List<Product> lista = await DBServicePockets.db.obtenerDatos();
  //   // if (lista.length == 0) {
  //   //   Navigator.pushNamed(context, 'pockets_step1');
  //   // }
  //   return lista;
  // }

  // void getData() async {
  //   databaseReference
  //       .collection("products")
  //       .getDocuments()
  //       .then((QuerySnapshot snapshot) {
  //     snapshot.documents
  //         .forEach((f) => print('${f.data}}' + '${f.reference.documentID}}'));
  //   });

  // var doc_ref = await Firestore.instance
  //     .collection("board")
  //     .document(doc_id)
  //     .collection("products")
  //     .getDocuments();
  // doc_ref.documents.forEach((result) {
  //   print("--------------");
  //   print(result.documentID);

  // Firestore.instance.collection('products').getDocuments().then(
  //       (QuerySnapshot snapshot) => {
  //         snapshot.documents.forEach((f) {
  //           print("documentID---- " + f.reference.documentID);
  //         }),
  //       },
  //     );
}

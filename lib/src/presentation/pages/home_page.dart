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
                  print(document.reference.documentID);
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
                              // PinchZoom(
                              //   image:
                              Image.network(
                                document['img'],
                                height: 130,
                              ),
                              //   zoomedBackgroundColor:
                              //       Colors.black.withOpacity(0.5),
                              //   resetDuration: const Duration(milliseconds: 100),
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
                                    print(document.reference.documentID);
                                  },
                                  icon: Icon(Icons.add, color: Colors.white),
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

  void getData() {
    databaseReference
        .collection("products")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents
          .forEach((f) => print('${f.data}}' + '${f.reference.documentID}}'));
    });

    // var doc_ref = await Firestore.instance
    //     .collection("board")
    //     .document(doc_id)
    //     .collection("products")
    //     .getDocuments();
    // doc_ref.documents.forEach((result) {
    //   print("--------------");
    //   print(result.documentID);

//  var a = Firestore.instance.collection('products').getDocuments().then(
//         (QuerySnapshot snapshot) => {
//           snapshot.documents.forEach((f) {
//             print("documentID---- " + f.reference.documentID);
//           }),
//         },
//       );
  }
}

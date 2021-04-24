import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final databaseReference = Firestore.instance;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Productos"),
        ),
        body: Container(
          color: Colors.white,
        )
        //  StreamBuilder(
        //   stream: (FirebaseFirestore.instance.collection("products").snapshots),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
        );
  }

  void getData() async {
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

    // Firestore.instance.collection('products').getDocuments().then(
    //       (QuerySnapshot snapshot) => {
    //         snapshot.documents.forEach((f) {
    //           print("documentID---- " + f.reference.documentID);
    //         }),
    //       },
    //     );
  }

//   Future getMembers() async {
//     var firestore = FirebaseFirestore.instance;
//     QuerySnapshot querySnapshot = await firestore.collection("Members").get();
//     final documents = querySnapshot.docs;
//     return documents
// }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Test001 extends StatelessWidget {
  final String documentId;

  Test001({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future:
          FirebaseFirestore.instance.collection('place').doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Place: ${data['name']}");
        }

        return Text("loading");
      },
    );
  }
}

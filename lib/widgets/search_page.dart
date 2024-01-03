import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pondyapp/screens.dart/detailcard.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List placeResult = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance.collection('place').get();

    setState(() {
      placeResult = result.docs
          .where((doc) => doc['name'].contains(query))
          .map((e) => {
                'id': e.id,
                ...e.data(),
              })
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey, title: Text('Search')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Search Places",
              ),
              onChanged: (query) {
                searchFromFirebase(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: placeResult.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCard(
                          documentId: placeResult[index]
                              ['id'], // replace 'id' with the actual id field
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(placeResult[index]['name']),
                    subtitle: Text(placeResult[index]['type']),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

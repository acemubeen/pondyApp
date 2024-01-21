import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pondyapp/widgets/search_page.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final streamController = StreamController<List<DocumentSnapshot>>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('place').get();
    streamController.add(querySnapshot.docs);
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchPage(),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 202, 232, 255),
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: screenheight * 0.057,
        width: screenwidth * 0.890,
        margin: EdgeInsets.symmetric(
            horizontal: screenwidth * 0.070, vertical: screenheight * 0.040),
        child: Center(
          child: Text(
            "Search for the best",
            style: TextStyle(
              fontSize: screenheight * 0.0210,
              color: const Color.fromARGB(255, 58, 137, 183),
            ),
          ),
        ),
      ),
    );
  }
}



// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:pondyapp/widgets/category_document_screen.dart';
import '../constants.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  Future<List<DocumentSnapshot>> getDocumentsByCategory(String category) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('place')
        .where('type', isEqualTo: category)
        .get();
    return querySnapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xfff5f2e8),
        appBar: AppBar(
          backgroundColor: const Color(0xff67c2bf),
          title: const Text(
            "Category",
            style: TextStyle(color: Color(0xfff5f2e8)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    categoryLists(context, cat1, 'm1'),
                    categoryLists(context, cat2, 'm2'),
                    categoryLists(context, cat3, 'm3'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    categoryLists(context, cat4, 'm4'),
                    categoryLists(context, cat5, 'm5'),
                    categoryLists(context, cat6, 'm6'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryLists(BuildContext context, String catname, String catimage) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDocumentScreen(category: catname),
            ));
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.025,
              MediaQuery.of(context).size.height * 0.005,
              MediaQuery.of(context).size.width * 0.020,
              MediaQuery.of(context).size.height * 0.000,
            ),
            child: Column(
              children: <Widget>[
                FutureBuilder<List<DocumentSnapshot>>(
                  future: Future.wait([
                    Future.delayed(const Duration(
                        seconds: 2)), // This introduces a 2-second delay.
                    getDocumentsByCategory(catname),
                  ]).then((results) => results.last as List<
                      DocumentSnapshot>), // Use the result of getDocumentsByCategory after the delay.
                  builder: (BuildContext context,
                      AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error ${snapshot.error}");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Container();
                    } else {
                      return Container();
                    }
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Color.fromARGB(251, 0, 0, 0),
                    border: Border.all(
                      color: const Color.fromARGB(34, 133, 129, 104),
                      width: 5.9,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/categories/$catimage.jpeg',
                      ),
                    ),
                  ),
                  margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.000,
                    MediaQuery.of(context).size.height * 0.020,
                    MediaQuery.of(context).size.width * 0.000,
                    MediaQuery.of(context).size.height * 0.000,
                  ),
                  // color: Color.fromARGB(255, 156, 134, 48),
                  height: screenheight * 0.270,
                  width: screenwidth * 0.270,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.000,
                    MediaQuery.of(context).size.height * 0.008,
                    MediaQuery.of(context).size.width * 0.000,
                    MediaQuery.of(context).size.height * 0.000,
                  ),
                  padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.000,
                    MediaQuery.of(context).size.height * 0.00,
                    MediaQuery.of(context).size.width * 0.000,
                    MediaQuery.of(context).size.height * 0.000,
                  ),
                  //color: Color.fromARGB(112, 130, 130, 130),
                  height: screenheight * 0.100,
                  width: screenwidth * 0.250,
                  child: Center(
                    child: Text(
                      catname,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                          shadows: const [
                            Shadow(
                              color: Color.fromRGBO(0, 0, 0, 0.511),
                              // color: Color.fromARGB(255, 159, 159, 159),
                              offset: Offset(0, 0),
                              blurRadius: 70,
                            )
                          ],
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: screenheight * .035,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<List<DocumentSnapshot>>(
              future: getDocumentsByCategory(catname),
              builder: (BuildContext context,
                  AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: null);
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}

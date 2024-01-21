import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pondyapp/screens.dart/detailcard.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

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
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff67c2bf),
          title: const Text(
            'Search',
            style: TextStyle(color: Color(0xfff5f2e8)),
          )),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(177, 255, 204, 190),
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: screenheight * 0.057,
            width: screenwidth * 0.890,
            margin: EdgeInsets.symmetric(
              horizontal: screenwidth * 0.070,
              vertical: screenheight * 0.040,
            ),
            child: TextField(
              onChanged: (query) {
                searchFromFirebase(query);
              },
              style: TextStyle(
                fontSize: screenheight * .023,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(
                    255, 182, 119, 103), // Set your desired color here
              ),
              decoration: InputDecoration(
                hintText: "Search for the best",
                hintStyle: TextStyle(
                  fontSize: screenheight * 0.0210,
                  color: const Color.fromARGB(255, 182, 119, 103),
                ),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: const Color.fromARGB(255, 182, 119, 103),
                  size: screenheight * .045,
                ),
              ),
            ),
          ),

          /// V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^V^

          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       border: OutlineInputBorder(),
          //       hintText: "Search Places",
          //     ),
          //     onChanged: (query) {
          //       searchFromFirebase(query);
          //     },
          //   ),
          // ),
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

/*
child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(177, 255, 204, 190),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    height: screenheight * 0.057,
                    width: screenwidth * 0.890,
                    margin: EdgeInsets.symmetric(
                        horizontal: screenwidth * 0.070,
                        vertical: screenheight * 0.040),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: screenwidth * .05,
                        ),
                        Text(
                          "Search for the best",
                          style: TextStyle(
                            fontSize: screenheight * 0.0210,
                            color: Color.fromARGB(255, 182, 119, 103),
                          ),
                        ),
                        SizedBox(
                          width: screenwidth * .290,
                        ),
                        Icon(
                          Icons.search_rounded,
                          color: Color.fromARGB(255, 182, 119, 103),
                          size: screenheight * .045,
                        ),
                      ],
                    ),
                  ),
*/
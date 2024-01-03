import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pondyapp/screens.dart/detailcard.dart';

class CategoryDocumentScreen extends StatelessWidget {
  final String category;

  CategoryDocumentScreen({required this.category});
  Future<List<DocumentSnapshot>> getDocumentsByCategory(String category) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('place')
        .where('type', isEqualTo: category)
        .get();
    return querySnapshot.docs ?? [];
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: getDocumentsByCategory(category),
        builder: (BuildContext context,
            AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            List<DocumentSnapshot> documents = snapshot.data ?? [];
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                /////
                ///      implement the code  | |
                ///                          V V
                ///
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailCard(documentId: documents[index].id),
                        ));
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.00,
                        MediaQuery.of(context).size.height * 0.020,
                        MediaQuery.of(context).size.width * 0.00,
                        MediaQuery.of(context).size.height * 0.00,
                      ),
                      height: screenheight * 0.130,
                      width: screenwidth * 0.870,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: screenheight * 0.130,
                            width: screenwidth * 0.260,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      NetworkImage(documents[index]['image'])),
                            ),
                          ),
                          Expanded(
                              child: Container(
                                  height: screenheight * 0.250,
                                  width: screenwidth * 0.650,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(234, 255, 255, 255),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      )),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                          MediaQuery.sizeOf(context).width *
                                              0.027,
                                          MediaQuery.sizeOf(context).height *
                                              0.010,
                                          MediaQuery.sizeOf(context).width *
                                              0.000,
                                          MediaQuery.sizeOf(context).height *
                                              0.005,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              child: Expanded(
                                                  child: Text(
                                                documents[index]['name'],
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize:
                                                        screenwidth * 0.040,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        211, 21, 21, 21)),
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                          MediaQuery.sizeOf(context).width *
                                              0.040,
                                          MediaQuery.sizeOf(context).height *
                                              0.000,
                                          MediaQuery.sizeOf(context).width *
                                              0.000,
                                          MediaQuery.sizeOf(context).height *
                                              0.000,
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              size: screenheight * 0.030,
                                              Icons.location_on_outlined,
                                              color: Color.fromARGB(
                                                  255, 242, 155, 155),
                                            ),
                                            SizedBox(
                                              width: screenwidth * .47,
                                              child: Text(
                                                documents[index]['location'],
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize:
                                                        screenwidth * 0.029,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        211, 21, 21, 21)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                          MediaQuery.sizeOf(context).width *
                                              0.075,
                                          MediaQuery.sizeOf(context).height *
                                              0.007,
                                          MediaQuery.sizeOf(context).width *
                                              0.000,
                                          MediaQuery.sizeOf(context).height *
                                              0.000,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Type: ",
                                              style: TextStyle(
                                                  fontSize: screenwidth * 0.030,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      145, 0, 0, 0)),
                                            ),
                                            FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                documents[index]['type'],
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize:
                                                        screenwidth * 0.030,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color.fromARGB(
                                                        211, 21, 21, 21)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

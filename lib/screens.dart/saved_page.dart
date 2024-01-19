import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pondyapp/savedcards.dart';
import 'package:pondyapp/screens.dart/detailcard.dart';
import 'package:pondyapp/screens.dart/home_screen.dart';
import 'package:pondyapp/screens.dart/profile.dart';
import 'package:provider/provider.dart';

class SavedPage extends StatefulWidget {
  final CollectionReference _place =
      FirebaseFirestore.instance.collection('place');

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final CollectionReference _place =
      FirebaseFirestore.instance.collection('place');
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    // Get the list of saved items from the provider
    List<String> savedItems =
        Provider.of<SavedItemsProvider>(context).savedItems;

    // If there are no saved items, display a message
    if (savedItems.isEmpty) {
      return Scaffold(
        backgroundColor: Color(0xfff5f2e8),
        appBar: AppBar(
          title: Text('Saved Places'),
          backgroundColor: Color.fromARGB(255, 58, 137, 183),
        ),
        body: Center(
          child: Text("No Saved items"),
        ),
      );
    }

    // Otherwise, build the list of saved items
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved Places",
          style: TextStyle(
            color: Colors.grey[200],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 58, 137, 183),
      ),
      backgroundColor: Color(0xfff5f2e8),
      body: ListView.builder(
        itemCount: savedItems.length,
        itemBuilder: (context, index) {
          String documentId = savedItems[index];

          // Fetch the document with the saved documentId from Firestore
          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('place')
                .doc(documentId)
                .get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailCard(documentId: snapshot.data!.id),
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
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 111, 111, 111)
                                      .withOpacity(0.2), // Shadow color
                                  offset: Offset(2, 3), // Offset of the shadow
                                  blurRadius: 30, // Amount of blur
                                  spreadRadius: 6,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(snapshot.data!['image'])),
                            ),
                          ),
                          Expanded(
                              child: Container(
                                  height: screenheight * 0.250,
                                  width: screenwidth * 0.650,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(86, 174, 204, 211),
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
                                                snapshot.data!['name'],
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: screenwidth * 0.040,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff142850),
                                                ),
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
                                              color: Color(0xff67c2bf),
                                            ),
                                            SizedBox(
                                              width: screenwidth * .47,
                                              child: Text(
                                                snapshot.data!['location'],
                                                maxLines: 2,
                                                style: TextStyle(
                                                  fontSize: screenwidth * 0.029,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      195, 39, 73, 109),
                                                ),
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
                                                snapshot.data!['type'],
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: screenwidth * 0.030,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff2364aa),
                                                ),
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
              }

              return Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}

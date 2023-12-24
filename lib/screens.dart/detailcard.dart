import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pondyapp/authenticate/googlemaps.dart';
import 'package:pondyapp/constants.dart';

class DetailCard extends StatelessWidget {
  void openGoogleMap(String placeName) async {
    String encodedPlaceName = Uri.encodeFull(placeName);
    Uri uri = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=$encodedPlaceName");

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not open the map.';
    }
  }

  final String documentId;
  DetailCard({required this.documentId, Key? key}) : super(key: key);
  final CollectionReference _place =
      FirebaseFirestore.instance.collection('place');
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Detail Card'),
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 195, 126, 206),
      ),
      body: StreamBuilder(
        stream: _place.doc(documentId).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final DocumentSnapshot documentSnapshot = streamSnapshot.data!;

            /*

                    Where the code Starts

                    */
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.00,
                        MediaQuery.of(context).size.height * 0.015,
                        MediaQuery.of(context).size.width * 0.00,
                        MediaQuery.of(context).size.height * 0.00,
                      ),
                      height: screenheight * 0.3,
                      width: screenwidth * 0.96,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 186, 253),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Image.network(
                          documentSnapshot['image'],
                          fit: BoxFit.cover,
                          width: double.maxFinite,
                        ),
                      ),
                    ),
                    Container(
                      width: screenwidth,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(55, 0, 170, 255),
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Center(
                        child: Expanded(
                          child: Text(
                            documentSnapshot['name'],
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: screenheight * .027,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 50),
                        Container(
                          height: screenheight * .070,
                          width: screenwidth * .270,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 203, 203),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Type: ',
                                  style: TextStyle(
                                    fontSize: screenheight * .020,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(documentSnapshot['type'],
                                    style: TextStyle(
                                        fontSize: screenheight * .020,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 60),
                        Container(
                          width: 50,
                          height: 50,
                          color: Color.fromARGB(106, 250, 221, 255),
                          child: Icon(Icons.share,
                              size: screenheight * .060,
                              shadows: [
                                BoxShadow(
                                    offset: Offset(2, 2),
                                    color: Colors.black54),
                              ],
                              color: Color.fromARGB(255, 76, 151, 255)),
                        ),
                        SizedBox(width: 60),
                        Container(
                          width: 50,
                          height: 50,
                          color: Color.fromARGB(106, 250, 221, 255),
                          child: Icon(Icons.save_rounded,
                              size: screenheight * .060,
                              shadows: [
                                BoxShadow(
                                    offset: Offset(2, 2),
                                    color: Colors.black54),
                              ],
                              color: Color.fromARGB(255, 255, 177, 76)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * .045,
                              left: MediaQuery.of(context).size.width * .045),
                          child: Text(
                            'Description:',
                            style: TextStyle(fontSize: screenheight * .025),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: screenheight * .2,
                      width: screenwidth * .9,
                      color: const Color.fromARGB(20, 158, 158, 158),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          documentSnapshot['description'],
                          maxLines: 6,
                          style: TextStyle(fontSize: screenheight * .020),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.000,
                        MediaQuery.of(context).size.height * 0.035,
                        MediaQuery.of(context).size.width * 0.000,
                        MediaQuery.of(context).size.height * 0.000,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 205, 133, 218)),
                        onPressed: () {
                          openGoogleMap("Ameer Oil Trade"); // S
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(70))),
                          height: screenheight * 0.070,
                          width: screenwidth * 0.550,
                          child: Center(
                            child: Text(
                              "Locate on Google",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }
}

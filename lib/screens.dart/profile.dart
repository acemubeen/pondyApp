import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pondyapp/screens.dart/detailcard.dart';
import 'package:pondyapp/screens.dart/explore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:pondyapp/authenticate/googlemaps.dart';
import 'package:pondyapp/constants.dart';
import 'package:pondyapp/testfolder/test001.dart';

class ProfileNb extends StatefulWidget {
/*  
  PlaceCard({required this.documentId, Key? key}) : super(key: key);
  final CollectionReference _place =
      FirebaseFirestore.instance.collection('place');
*/
  final CollectionReference _place =
      FirebaseFirestore.instance.collection('place');
  @override
  State<ProfileNb> createState() => _ProfileNbState();
}

class _ProfileNbState extends State<ProfileNb> {
  final CollectionReference _place =
      FirebaseFirestore.instance.collection('place');
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(26, 0, 0, 0),
      body: FutureBuilder(
          future: Future.delayed(Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return ListView.builder(
                itemCount: 10, // Adjust the number of items as needed
                itemBuilder: (context, index) =>
                    _buildShimmerPlaceholder(context),
              );
            }
            return StreamBuilder(
                stream: _place.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailCard(
                                      documentId: documentSnapshot.id),
                                  // (documentId: documentSnapshot.id),
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
                                //color: Color.fromARGB(147, 218, 86, 86),
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
                                          image: NetworkImage(
                                              documentSnapshot['image'])),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                          height: screenheight * 0.250,
                                          width: screenwidth * 0.650,
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  234, 255, 255, 255),
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              )),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.027,
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.010,
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.000,
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.005,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Expanded(
                                                          child: Text(
                                                        documentSnapshot[
                                                            'name'],
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontSize:
                                                                screenwidth *
                                                                    0.040,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Color.fromARGB(
                                                                    211,
                                                                    21,
                                                                    21,
                                                                    21)),
                                                      )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.040,
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.000,
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.000,
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.000,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      size:
                                                          screenheight * 0.030,
                                                      Icons
                                                          .location_on_outlined,
                                                      color: Color.fromARGB(
                                                          255, 242, 155, 155),
                                                    ),
                                                    SizedBox(
                                                      width: screenwidth * .47,
                                                      child: Text(
                                                        documentSnapshot[
                                                            'location'],
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            fontSize:
                                                                screenwidth *
                                                                    0.029,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Color.fromARGB(
                                                                    211,
                                                                    21,
                                                                    21,
                                                                    21)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.075,
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.007,
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.000,
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.000,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Type: ",
                                                      style: TextStyle(
                                                          fontSize:
                                                              screenwidth *
                                                                  0.030,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromARGB(
                                                              145, 0, 0, 0)),
                                                    ),
                                                    FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        documentSnapshot[
                                                            'type'],
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontSize:
                                                                screenwidth *
                                                                    0.030,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Color.fromARGB(
                                                                    211,
                                                                    21,
                                                                    21,
                                                                    21)),
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
                  } else {
                    return ListView.builder(
                      itemCount: 5, // Adjust the number of items as needed
                      itemBuilder: (context, index) =>
                          _buildShimmerPlaceholder(context),
                    );
                  }
                });
          }),
    );
  }

  Widget _buildShimmerPlaceholder(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.000,
        MediaQuery.of(context).size.height * 0.008,
        MediaQuery.of(context).size.width * 0.000,
        MediaQuery.of(context).size.height * 0.000,
      ),
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 211, 211, 211)!,
        highlightColor: const Color.fromARGB(213, 245, 245, 245)!,
        period: Duration(seconds: 2),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: screenheight * 0.010,
            horizontal: screenwidth * 0.070,
          ),
          height: screenheight * 0.130,
          width: screenwidth * 0.870,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(203, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}

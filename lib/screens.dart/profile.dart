import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pondyapp/screens.dart/detailcard.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ProfileNb extends StatefulWidget {
  ProfileNb({Key? key}) : super(key: key);

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
      appBar: AppBar(
        title: Text('Explore Page'),
        backgroundColor: Color(0xfff5f2e8),
      ),
      backgroundColor: Color(0xfff5f2e8),
      body: FutureBuilder(
          future: Future.delayed(Duration(milliseconds: 40)),
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
                                MediaQuery.of(context).size.height * 0.010,
                                MediaQuery.of(context).size.width * 0.00,
                                MediaQuery.of(context).size.height * 0.010,
                              ),
                              height: screenheight * 0.130,
                              width: screenwidth * 0.870,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 111, 111, 111)
                                        .withOpacity(0.1), // Shadow color
                                    offset:
                                        Offset(2, 3), // Offset of the shadow
                                    blurRadius: 30, // Amount of blur
                                    spreadRadius: 0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                                //color: Color.fromARGB(147, 218, 86, 86),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: screenheight * 0.130,
                                    width: screenwidth * 0.260,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 193, 218, 236),
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
                                              color: Color.fromRGBO(
                                                  86, 175, 204, 0.155),
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
                                                              Color(0xff142850),
                                                        ),
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
                                                      color: Color(0xff67c2bf),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        (documentSnapshot.data() as Map<
                                                                            String,
                                                                            dynamic>?)
                                                                        ?.containsKey(
                                                                            'location') ==
                                                                    true &&
                                                                documentSnapshot[
                                                                        'location'] !=
                                                                    null
                                                            ? documentSnapshot[
                                                                'location']
                                                            : 'No Location',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          fontSize:
                                                              screenwidth *
                                                                  0.029,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                                  MediaQuery.sizeOf(context)
                                                          .width *
                                                      0.05,
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
                                                              screenheight *
                                                                  0.015,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color.fromARGB(
                                                              145, 0, 0, 0)),
                                                    ),
                                                    Text(
                                                      documentSnapshot['type'],
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontSize:
                                                              screenheight *
                                                                  0.013,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Color(
                                                              0xff2364aa)),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
        baseColor: Color.fromARGB(255, 211, 211, 211),
        highlightColor: Color.fromARGB(213, 245, 245, 245),
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

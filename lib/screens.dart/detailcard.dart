import 'package:flutter/material.dart';
import 'package:pondyapp/authenticate/googlemaps.dart';
import 'package:pondyapp/savedcards.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:like_button/like_button.dart';

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

  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    bool _isTapped = false;

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return PlaceCard(documentId: documentId);
  }
}

/*





ppppppppppppppllllllllllllllllaaaaaaaaaaacccccccccccccceeeeeeeeeeeeeeeee


;               ccccccccccccccaaaaaaaaaaarrrrrrrrrrrrrdddddddddddd





 */
class PlaceCard extends StatefulWidget {
  PlaceCard({required this.documentId, Key? key}) : super(key: key);
  final String documentId;

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  final CollectionReference _place =
      FirebaseFirestore.instance.collection('place');

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    bool _isTapped = false;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Detail Card'),
        elevation: 10,
        backgroundColor: Color.fromARGB(255, 85, 132, 182),
      ),
      body: StreamBuilder(
        stream: _place.doc(widget.documentId).snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final DocumentSnapshot documentSnapshot = streamSnapshot.data!;

            /*

                    Where the code Starts

                    */

            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: screenheight * .330,
                        width: screenwidth,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(documentSnapshot['image']),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    // Name Container
                                    padding: EdgeInsets.only(
                                        left: screenwidth * .040),
                                    height: screenheight * .102,
                                    width: screenwidth * .60,

                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        documentSnapshot['name'],
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: screenheight * .027,
                                          fontWeight: FontWeight.w500,
                                          shadows: [
                                            Shadow(
                                              // Bottom-left shadow
                                              color:
                                                  Colors.black.withOpacity(1.0),
                                              offset: Offset(0.0, 0.0),
                                              blurRadius: 40,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    ///
                                    ///
                                    ///
                                    ///
                                    ///
                                    ///
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    // Add more widgets or adjust the size as needed
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Container(
                                        //First Container 1/3-> icon cntnr
                                        height: screenheight * .102,
                                        width: screenwidth * .40,
                                        decoration: BoxDecoration(),
                                        // Add more widgets or adjust the size as needed
                                      ),
                                      Container(
                                        // 2nd container above liked cntnr
                                        height: screenheight * .120,
                                        width: screenwidth * .40,
                                        decoration: BoxDecoration(),
                                        // Add more widgets or adjust the size as needed
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                          right: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .040,
                                        ),
                                        height: screenheight * .100,
                                        width: screenwidth * .40,
                                        decoration: BoxDecoration(
                                          //Like Icon THis Container

                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: screenheight * .12,
                                              width: screenwidth * .12,
                                              child: CircleAvatar(
                                                backgroundColor: Color.fromARGB(
                                                    208, 79, 79, 79),
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      left: 3.5, top: 0),
                                                  child: LikeButton(
                                                    isLiked: Provider.of<
                                                                SavedItemsProvider>(
                                                            context,
                                                            listen: false)
                                                        .IsItemSaved(
                                                            widget.documentId),
                                                    onTap: (isLiked) async {
                                                      Provider.of<SavedItemsProvider>(
                                                              context,
                                                              listen: false)
                                                          .toggleSavedItem(
                                                              widget
                                                                  .documentId);
                                                      return !isLiked;
                                                    },
                                                    size: screenheight * .035,
                                                    circleSize:
                                                        screenheight * .020,
                                                    bubblesColor: BubblesColor(
                                                        dotPrimaryColor:
                                                            const Color
                                                                .fromARGB(255,
                                                                75, 255, 81),
                                                        dotSecondaryColor:
                                                            const Color
                                                                .fromARGB(255,
                                                                255, 165, 31)),
                                                    circleColor: CircleColor(
                                                        start: Color.fromARGB(
                                                            255, 217, 198, 26),
                                                        end: Color.fromARGB(
                                                            255, 64, 235, 127)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            //Cntnr tht hlds type & link icons

                            height: screenheight * .080,
                            width: screenwidth,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(),
                                Container(
                                  // type cntnr
                                  height: screenheight * .0710,
                                  width: screenwidth * .450,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.type_specimen_outlined,
                                        color:
                                            Color.fromARGB(255, 143, 121, 111),
                                        size: screenheight * .035,
                                      ),
                                      Text(documentSnapshot['type'])
                                    ],
                                  ),
                                ),
                                Container(
                                  // cntins link icon container
                                  height: screenheight * .10,
                                  width: screenwidth * .400,

                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        //link icon

                                        // Link Icon Container
                                        height: screenheight * .12,
                                        width: screenwidth * .12,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey[300],
                                          child: Icon(
                                            Icons.link,
                                            color: Colors.black45,
                                            size: screenheight * .040,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: screenwidth * .040,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .00,
                          left: MediaQuery.of(context).size.width * .040,
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'LOCATION',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: screenheight * .020,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * .010,
                            left: MediaQuery.of(context).size.height * .007),
                        height: screenheight * .070,
                        width: screenwidth * .930,
                        child: SingleChildScrollView(
                          child: Text(
                            documentSnapshot['location'],
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: screenheight * .020,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .010,
                          left: MediaQuery.of(context).size.width * .040,
                          bottom: MediaQuery.of(context).size.height * .010,
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'DESCRIPTION',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: screenheight * .020,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height * .020,
                            left: MediaQuery.of(context).size.height * .007),
                        height: screenheight * .200,
                        width: screenwidth * .930,
                        child: SingleChildScrollView(
                          child: Text(
                            documentSnapshot['description'],
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: screenheight * .020,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .020,
                          bottom: MediaQuery.of(context).size.width * .030,
                        ),
                        child: Center(
                          child: Material(
                            type: MaterialType.transparency, // Add this line
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  _isTapped = true;
                                });
                                Future.delayed(
                                    const Duration(milliseconds: 100), () {
                                  setState(() {
                                    _isTapped = false;
                                  });
                                });
                                openGoogleMap(documentSnapshot['locate']);
                              },
                              borderRadius:
                                  BorderRadius.all(const Radius.circular(30)),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastLinearToSlowEaseIn,
                                height: _isTapped ? screenheight * 066 : 44.9,
                                width: _isTapped ? screenwidth * .580 : 299.9,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 83, 148, 179),
                                  borderRadius: BorderRadius.all(
                                      const Radius.circular(30)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 30,
                                      offset: const Offset(3, 7),
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Locate on Google',
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                              255, 255, 255, 255)
                                          .withOpacity(0.7),
                                      fontWeight: FontWeight.w900,
                                      fontSize: screenheight * .020,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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

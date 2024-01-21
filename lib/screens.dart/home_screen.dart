import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pondyapp/screens.dart/detailcard.dart';
import 'package:pondyapp/screens.dart/trending_screen.dart';

import 'dart:async';
import 'package:pondyapp/widgets/category_document_screen.dart';
import '../constants.dart';
import 'package:pondyapp/widgets/search_page.dart';

final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

// rest of the code
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

TextEditingController searchController = TextEditingController();
StreamController<List<DocumentSnapshot>> streamController = StreamController();

class _MyWidgetState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    futureImageList = fetchDocumentsFromFirestore();
  }

  Stream<QuerySnapshot> getThirdPageStream() {
    return FirebaseFirestore.instance.collection('place').snapshots();
  }

  // Replace with actual document IDs
  Future<List<DocumentSnapshot>> getDocumentsByCategory(String category) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('place')
        .where('type', isEqualTo: category)
        .get();
    return querySnapshot.docs;
  }

  final CarouselController carouselController = CarouselController();
  final currentIndexNotifier = ValueNotifier<int>(0);

  late Future<List<Map<String, dynamic>>> futureImageList;
  List<String> documentIdsToShow = [];

  Future<List<Map<String, dynamic>>> fetchDocumentsFromFirestore() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('second_place').get();

    return querySnapshot.docs.map((doc) {
      return {
        "id": doc.id,
        "image_path": doc[
            'image'], // Replace with your actual field name for the image URL
        "name": doc['name'], // Replace with your actual field name for the name
        "type":
            doc['type'], // Replace with your actual field name for the location
      };
    }).toList();
  }

  final FocusNode searchFocusNode = FocusNode();

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  int currentIndex = 0;

  bool isBellPressed = false;
  bool isMenuPressed = false;
  bool isProfPressed = false;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xfff5f2e8),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenheight * 0.075),
          child: AppBar(
            backgroundColor: const Color(0xff67c2bf),
            title: Text(
              "Blissful Pondy",
              style: TextStyle(
                  color: const Color(0xffc6ea8d),
                  fontSize: screenheight * 0.030,
                  fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            actions: const <Widget>[
              // Builder(
              //   builder: (context) => IconButton(
              //     iconSize: screenheight * 0.040,
              //     icon: Icon(
              //         isMenuPressed ? Icons.menu_open_outlined : Icons.menu,
              //         color: Colors.white),
              //     onPressed: () => Scaffold.of(context).openEndDrawer(),
              //   ),
              // ),
            ],
          ),
        ),
        // endDrawer: Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: <Widget>[
        //       DrawerHeader(
        //         child: Text('Drawer header'),
        //         decoration: BoxDecoration(
        //           color: Colors.blueGrey[300],
        //         ),
        //       ),
        //       ListTile(
        //         title: Text('Chipi Chipi'),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: Text("Chappa Chappa"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: Text("Dubi Dubi"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: Text("Daba Daba"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: Text("Magic poni"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: Text("Dubi Dubi"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: Text("Boom Boom Boom Boom"),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyClip(),
                child: Container(
                  height: screenheight * 0.200,
                  color: const Color(0xff67c2bf),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.060,
                            MediaQuery.of(context).size.height * 0.000,
                            MediaQuery.of(context).size.width * 0.000,
                            MediaQuery.of(context).size.height * 0.000,
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Explore",
                                    style: TextStyle(
                                        color: const Color(0xffffe28a),
                                        fontWeight: FontWeight.w700,
                                        fontSize: screenheight * 0.040),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.060,
                            MediaQuery.of(context).size.height * 0.000,
                            MediaQuery.of(context).size.width * 0.000,
                            MediaQuery.of(context).size.height * 0.040,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: screenheight * .052,
                                  width: 200,
                                  //color: const Color.fromARGB(40, 255, 214, 64),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Pondichéry",
                                        style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.w700,
                                          fontSize: screenheight * 0.040,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenheight * 0.025),
                      ],
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(177, 255, 204, 190),
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
                          color: const Color.fromARGB(255, 182, 119, 103),
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * .290,
                      ),
                      Icon(
                        Icons.search_rounded,
                        color: const Color.fromARGB(255, 182, 119, 103),
                        size: screenheight * .045,
                      ),
                    ],
                  ),
                ),
              ),

              /// Categoriesss ````````````````````
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.060,
                  MediaQuery.of(context).size.height * 0.020,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: screenheight * .050,
                        width: screenwidth,
                        //color: Color.fromARGB(131, 244, 225, 168),
                        child: Text(
                          "Category",
                          style: TextStyle(
                              color: const Color(0xffb54c62),
                              fontWeight: FontWeight.w500,
                              fontSize: screenheight * 0.035
                              //fontSize: 32
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //                 CATTTEEGGOORRYYYY     \\

              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.045,
                  MediaQuery.of(context).size.height * 0.020,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                height: screenheight * .220,
                //height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryLists(context, cat1, 'm1'),
                    categoryLists(context, cat2, 'm2'),
                    categoryLists(context, cat3, 'm3'),
                    categoryLists(context, cat4, 'm4'),
                    categoryLists(context, cat5, 'm5'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.060,
                  MediaQuery.of(context).size.height * 0.020,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        width: screenwidth,
                        //color: Color.fromARGB(131, 244, 225, 168),
                        child: Text(
                          "Trending",
                          style: TextStyle(
                            color: const Color(0xffb54c62),
                            fontWeight: FontWeight.w500,
                            fontSize: screenheight * 0.035,
                            //fontSize: 32
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //// Carousel Slider//////////////
              /// //// Carousel Slider//////////////
              ///  //// Carousel Slider//////////////
              ///  //// Carousel Slider//////////////
              ///  //// Carousel Slider//////////////
              ///  //// Carousel Slider//////////////
              Container(
                margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.020,
                  MediaQuery.of(context).size.height * 0.020,
                  MediaQuery.of(context).size.width * 0.020,
                  MediaQuery.of(context).size.height * 0.060,
                ),
                height: MediaQuery.of(context).size.height * 0.270,
                width: MediaQuery.of(context).size.width * 0.870,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 196, 196, 196),
                    width: 01,
                  ),
                  borderRadius: BorderRadius.circular(31),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: futureImageList,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        List<Map<String, dynamic>> imageList = snapshot.data!;
                        return AnimatedBuilder(
                          animation: _currentIndexNotifier,
                          builder: (content, child) {
                            return CarouselSlider(
                              items: imageList.map((item) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TrendingScreen()));
                                  },
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: item['image_path'] ?? '',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                      // Image.network(
                                      //   item['image_path'] ?? '',
                                      //   fit: BoxFit.cover,
                                      //   width: double.infinity,
                                      //   filterQuality: FilterQuality.low,
                                      // ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                              Colors.transparent,
                                              Color.fromARGB(26, 255, 255, 255),
                                            ])),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        top: screenheight * 0.200,
                                        child: Container(
                                          width: screenwidth,
                                          height: screenheight * 0.10,
                                          padding: EdgeInsets.fromLTRB(
                                            MediaQuery.of(context).size.width *
                                                0.000,
                                            MediaQuery.of(context).size.height *
                                                0.015,
                                            MediaQuery.of(context).size.width *
                                                0.000,
                                            MediaQuery.of(context).size.height *
                                                0.000,
                                          ),
                                          color: const Color(0xff67c2bf)
                                              .withOpacity(0.350),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              FittedBox(
                                                fit: BoxFit.scaleDown,
                                                child: Text(
                                                  item['name'] ?? 'No name',
                                                  style: TextStyle(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                      fontSize:
                                                          screenheight * 0.020,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  maxLines: 2,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              carouselController: carouselController,
                              options: CarouselOptions(
                                scrollPhysics: const ClampingScrollPhysics(),
                                aspectRatio: 1,
                                viewportFraction: 1,
                                // onPageChanged: (index, reason) {
                                //   if (currentIndex != index) {}
                                //   setState(() {
                                //     currentIndex = index;
                                //   });
                                // },
                              ),
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text('No data available'));
                      }
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.070,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.030,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: screenwidth * 0.560,
                          //color: Color.fromARGB(82, 158, 158, 158),
                          child: Text(
                            "Top places",
                            style: TextStyle(
                                color: const Color(0xffb54c62),
                                // top place text
                                fontWeight: FontWeight.w500,
                                fontSize: screenheight * 0.035),
                          ),
                        ),
                      ],
                    ),

                    // buildTopPlaces(),
                  ],
                ),
              ),
              buildTopPlaces(),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot> buildTopPlaces() {
    // List of specific document IDs you want to display
    List<String> documentIds = ['143', '132', '133'];

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('place')
          .where(FieldPath.documentId, whereIn: documentIds)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Text('No Data Available');
        }
        // Create a list of widgets for the top places
        List<Widget> topPlacesWidgets = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>? ?? {};
          String location = data['location'] as String? ?? 'Unknown location';
          String documentId = doc.id;
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * .030),
            child: topPlaces(
              data['image'] as String? ?? '',
              data['name'] as String? ?? 'No name',
              location,
              data['type'] as String? ?? 'No type',
              documentId,
            ),
          );
        }).toList();
        // Return a Column with the top places widgets
        return Column(
          children: topPlacesWidgets,
        );
      },
    );
  }

  Widget topPlaces(String image, String tpname, String location, String type,
      String documentId) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailCard(documentId: documentId),
            ));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.000,
          MediaQuery.of(context).size.height * 0.000,
          MediaQuery.of(context).size.width * 0.000,
          MediaQuery.of(context).size.height * 0.00,
        ),
        height: screenheight * 0.125,
        width: screenwidth * 0.870,
        decoration: BoxDecoration(
          // boxShadow: [
          //   BoxShadow(
          //     color: const Color.fromARGB(255, 0, 0, 0)
          //         .withOpacity(0.1), // Shadow color
          //     offset: Offset(-1, 3), // Offset of the shadow
          //     blurRadius: 20, // Amount of blur
          //     spreadRadius: 1,
          //   ),
          // ],
          borderRadius: BorderRadius.circular(10),
        ),

        ////////////
        child: Row(
          children: [
            Container(
                height: screenheight * 0.150,
                width: screenwidth * 0.250,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ))),
            Expanded(
              child: Container(
                height: screenheight * 0.250,
                width: screenwidth * 0.650,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Color.fromARGB(143, 192, 221, 228),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.sizeOf(context).width * 0.027,
                        MediaQuery.sizeOf(context).height * 0.010,
                        MediaQuery.sizeOf(context).width * 0.000,
                        MediaQuery.sizeOf(context).height * 0.005,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              // NAME OF THEPLACE
                              tpname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff142850)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.sizeOf(context).width * 0.030,
                        MediaQuery.sizeOf(context).height * 0.000,
                        MediaQuery.sizeOf(context).width * 0.000,
                        MediaQuery.sizeOf(context).height * 0.000,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            size: screenheight * 0.030,
                            Icons.location_on_outlined,
                            color: const Color(0xff67c2bf),
                          ),
                          Expanded(
                            child: Text(
                              location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromARGB(195, 39, 73, 109)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.sizeOf(context).width * 0.075,
                        MediaQuery.sizeOf(context).height * 0.007,
                        MediaQuery.sizeOf(context).width * 0.000,
                        MediaQuery.sizeOf(context).height * 0.000,
                      ),
                      child: Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              // TYPE OF THE PLACE
                              "Type: ",
                              style: TextStyle(
                                  fontSize: screenwidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700]),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              type,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff2364aa)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchPlace(String searchTerm) {
    streamController.addStream(FirebaseFirestore.instance
        .collection('place')
        .where('name', isGreaterThanOrEqualTo: searchTerm)
        .where('name', isLessThan: '$searchTerm\uf8ff')
        .snapshots()
        .map((snapshot) => snapshot.docs));
  }

  Widget categoryLists(BuildContext context, String catname, String catimage) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context)
        .size
        .height; // Changed from screenwidth to screenheight

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDocumentScreen(category: catname),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.030,
          MediaQuery.of(context).size.height * 0.000,
          MediaQuery.of(context).size.width * 0.020,
          MediaQuery.of(context).size.height * 0.000,
        ),
        width:
            screenwidth * 0.270, // Set a fixed width for the category container
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(57, 95, 95, 95),
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
              height: screenheight *
                  0.130, // Set a fixed height for the image container
              width: screenwidth *
                  0.5, // Match the width of the category container
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.008),
              height: screenheight *
                  0.02, // Set a fixed height for the text container
              width: screenwidth * 0.270,
              child: Text(
                catname,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: const Color(0xff142850),
                  fontSize: screenheight * .017,
                  fontWeight: FontWeight.w500,
                ),
              ), // Match the width of the category container
            ),
          ],
        ),
      ),
    );
  }
}

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 50.0);
    path.quadraticBezierTo(
        size.width - 70.0, size.height, size.width / 2, size.height - 20);
    path.quadraticBezierTo(size.width / 3.0, size.height - 32, 0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

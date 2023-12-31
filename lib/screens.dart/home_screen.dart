import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pondyapp/test/test.dart';
import 'dart:async';
import 'package:pondyapp/widgets/category_document_screen.dart';
import '../constants.dart';

import 'package:pondyapp/widgets/search_page.dart';

// rest of the code
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

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
  List<String> documentIdsToShow = ['docId1', 'docId2', 'docId3'];

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

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  bool isBellPressed = false;
  bool isMenuPressed = false;
  bool isProfPressed = false;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(248, 255, 255, 255),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenheight * 0.075),
          child: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 58, 137, 183),
            title: Text(
              "Welcome to Pondy",
              style: TextStyle(
                color: Colors.white70,
                fontSize: screenheight * 0.025,
              ),
            ),
            centerTitle: true,
            actions: <Widget>[
              Builder(
                builder: (context) => IconButton(
                  iconSize: screenheight * 0.040,
                  icon: Icon(
                      isMenuPressed ? Icons.menu_open_outlined : Icons.menu,
                      color: Colors.white),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer header'),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[300],
                ),
              ),
              ListTile(
                title: Text('Chipi Chipi'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Chappa Chappa"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Dubi Dubi"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Daba Daba"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Magic poni"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Dubi Dubi"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Boom Boom Boom Boom"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: MyClip(),
                child: Container(
                  height: screenheight * 0.200,
                  color: Color.fromARGB(255, 58, 137, 183),
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
                                  Container(
                                    child: Text(
                                      "Explore",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.w700,
                                          fontSize: screenheight * 0.040),
                                    ),
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
                                child: Container(
                                  height: screenheight * .052,
                                  width: 200,
                                  //color: const Color.fromARGB(40, 255, 214, 64),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Pondichéry",
                                        style: TextStyle(
                                          color: Color.fromARGB(
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
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 202, 232, 255),
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
                          color: Color.fromARGB(255, 58, 137, 183),
                        ),
                      ),
                      SizedBox(
                        width: screenwidth * .34,
                      ),
                      Icon(
                        Icons.search_rounded,
                        color: Colors.black26,
                        size: screenheight * .045,
                      )
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
                      child: Container(
                        height: 40,
                        width: screenwidth,
                        //color: Color.fromARGB(131, 244, 225, 168),
                        child: Text(
                          "Category",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 25, 88),
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
                  MediaQuery.of(context).size.height * 0.030,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryLists(context, cat1, 'm1'),
                    CategoryLists(context, cat2, 'm2'),
                    CategoryLists(context, cat3, 'm3'),
                    CategoryLists(context, cat4, 'm4'),
                    CategoryLists(context, cat5, 'm5'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.060,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        width: screenwidth,
                        //color: Color.fromARGB(131, 244, 225, 168),
                        child: Text(
                          "Trending",
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 25, 88),
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

              //// Carousel Slider//////////////
              /// //// Carousel Slider//////////////
              ///  //// Carousel Slider//////////////
              ///  //// Carousel Slider//////////////
              ///  //// Carousel Slider//////////////
              ///  //// Carousel Slider//////////////
              Container(
                margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.020,
                  MediaQuery.of(context).size.height * 0.025,
                  MediaQuery.of(context).size.width * 0.020,
                  MediaQuery.of(context).size.height * 0.060,
                ),
                height: MediaQuery.of(context).size.height * 0.270,
                width: MediaQuery.of(context).size.width * 0.870,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 196, 196, 196),
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
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        List<Map<String, dynamic>> imageList = snapshot.data!;
                        return CarouselSlider(
                          items: imageList.map((item) {
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: item['image_path'] ?? '',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                // Image.network(
                                //   item['image_path'] ?? '',
                                //   fit: BoxFit.cover,
                                //   width: double.infinity,
                                //   filterQuality: FilterQuality.low,
                                // ),
                                Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                        Colors.transparent,
                                        Color.fromARGB(255, 255, 255, 255)
                                            .withOpacity(0),
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
                                      MediaQuery.of(context).size.width * 0.000,
                                      MediaQuery.of(context).size.height *
                                          0.015,
                                      MediaQuery.of(context).size.width * 0.000,
                                      MediaQuery.of(context).size.height *
                                          0.000,
                                    ),
                                    color: Color.fromARGB(255, 114, 114, 114)
                                        .withOpacity(0.750),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            item['name'] ?? 'No name',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: screenheight * 0.020,
                                                fontWeight: FontWeight.w700),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                          carouselController: carouselController,
                          options: CarouselOptions(
                            scrollPhysics: ClampingScrollPhysics(),
                            autoPlayInterval: Duration(seconds: 6),
                            autoPlay: true,
                            aspectRatio: 1,
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                          ),
                        );
                      } else {
                        return Center(child: Text('No data available'));
                      }
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.030,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: screenwidth * 0.560,
                          //color: Color.fromARGB(82, 158, 158, 158),
                          child: Text(
                            "Top places",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                fontSize: screenheight * 0.035),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: screenwidth * 0.200,
                          child: Center(
                            child: Text(
                              "See more",
                              style: TextStyle(
                                  color: Color.fromARGB(222, 71, 43, 43),
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenheight * 0.020),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              TopPlaces('003', 'Gojo saturo', 'shibuysa incident', 'anime'),
              TopPlaces('002', 'Marcus', 'New York', 'Game'),
              TopPlaces('005', 'Link click', 'Japan', 'Anime'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget TopPlaces(String image, String tpname, String location, String type) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.020,
        MediaQuery.of(context).size.height * 0.000,
        MediaQuery.of(context).size.width * 0.020,
        MediaQuery.of(context).size.height * 0.020,
      ),
      height: screenheight * 0.125,
      width: screenwidth * 0.870,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(0, 67, 63, 63),
      ),

      ////////////
      child: Row(
        children: [
          Container(
            height: screenheight * 0.150,
            width: screenwidth * 0.250,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0)
                        .withOpacity(0.2), // Shadow color
                    offset: Offset(-1, 3), // Offset of the shadow
                    blurRadius: 5, // Amount of blur
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'images/$image.jpg',
                    ))),
          ),
          Expanded(
            child: Container(
              height: screenheight * 0.250,
              width: screenwidth * 0.650,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 111, 111, 111)
                        .withOpacity(0.2), // Shadow color
                    offset: Offset(2, 3), // Offset of the shadow
                    blurRadius: 5, // Amount of blur
                    spreadRadius: 2,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Color.fromARGB(255, 255, 252, 245),
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
                        Container(
                          child: Expanded(
                            child: Text(
                              "$tpname",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(211, 21, 21, 21)),
                            ),
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
                          color: Color.fromARGB(173, 239, 89, 89),
                        ),
                        Text(
                          "$location",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: screenwidth * 0.035,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(194, 1, 41, 59)),
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
                            "Type: ",
                            style: TextStyle(
                                fontSize: screenwidth * 0.035,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(213, 105, 64, 5)),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "$type",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: screenwidth * 0.035,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(199, 4, 98, 115)),
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
    );
  }

  void searchPlace(String searchTerm) {
    streamController.addStream(FirebaseFirestore.instance
        .collection('place')
        .where('name', isGreaterThanOrEqualTo: searchTerm)
        .where('name', isLessThan: searchTerm + '\uf8ff')
        .snapshots()
        .map((snapshot) => snapshot.docs));
  }

  Widget CategoryLists(BuildContext context, String catname, String catimage) {
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
                  color: Color.fromARGB(57, 95, 95, 95),
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
              child: Text(
                '$catname',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Color.fromRGBO(0, 0, 0, 0.511),
                      offset: Offset(0, 0),
                      blurRadius: 30,
                    )
                  ],
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: screenheight * .015,
                  fontWeight: FontWeight.w500,
                ),
              ),
              height: screenheight *
                  0.02, // Set a fixed height for the text container
              width: screenwidth *
                  0.270, // Match the width of the category container
            ),
          ],
        ),
      ),
    );
  }
}

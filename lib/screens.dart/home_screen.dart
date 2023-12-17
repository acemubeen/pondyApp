import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pondyapp/screens.dart/Category.dart';
import 'package:pondyapp/account/signin_page.dart';
import 'package:pondyapp/screens.dart/explore.dart';
import 'package:pondyapp/screens.dart/profile.dart';
import 'package:pondyapp/screens.dart/saved.dart';

import 'package:pondyapp/test/test.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  List imagelist = [
    {
      "id": 1,
      "image_path": 'images/004.png',
      "name": "Namikaze Minato The yellow Flash ⚡",
      "place": "Hidden Leaf Village",
    },
    {
      "id": 2,
      "image_path": 'images/003.jpg',
      "name": "Gojo Saturo The Heart Stealer 💪🏻",
      "place": "Japan"
    },
    {
      "id": 3,
      "image_path": 'images/002.jpg',
      "name": "Marcus The Hacker 🧑🏻‍💻 ",
      "place": "USA"
    },
    {
      "id": 4,
      "image_path": 'images/005.jpg',
      "name": "Link click The Photo Traveller📷",
      "place": "Japan"
    },
  ];

  final CarouselController carouselController = CarouselController();

  final List<Widget> _pages = [
    HomeScreen(),
    Explore(),
    Category(),
    SavedNb(),
    ProfileNb(),
  ];

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
              "Shinzou wo Sasageyo",
              style: TextStyle(
                fontSize: screenheight * 0.025,
              ),
            ),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                iconSize: screenheight * 0.026,
                icon: Icon(isBellPressed
                    ? Icons.notifications
                    : Icons.notifications_active_sharp),
                color: isBellPressed
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : Color.fromARGB(255, 255, 113, 113),
                onPressed: () {
                  setState(() {
                    isBellPressed = !isBellPressed;
                  });
                },
              ),
              IconButton(
                iconSize: screenheight * 0.026,
                icon:
                    Icon(isMenuPressed ? Icons.menu_open_outlined : Icons.menu),
                onPressed: () {
                  setState(() {
                    isMenuPressed = !isMenuPressed;
                  });
                },
              ),
            ],
            leading: IconButton(
              iconSize: screenheight * 0.026,
              icon: isProfPressed
                  ? CircleAvatar(
                      radius: screenheight * 0.026,
                      child: Icon(Icons.person),
                    )
                  : CircleAvatar(
                      radius: screenheight * 0.026,
                      child: Icon(Icons.person_outline_outlined),
                    ),
              onPressed: () {
                setState(() {
                  isProfPressed = !isProfPressed;
                });
              },
            ),
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
                                      "Explorer",
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
                                  height: 35,
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

              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 202, 232, 255),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: screenheight * 0.057,
                margin: EdgeInsets.symmetric(
                    horizontal: screenwidth * 0.070,
                    vertical: screenheight * 0.040),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search for the best",
                    hintStyle: TextStyle(
                      fontSize: screenheight * 0.0210,
                      color: Color.fromARGB(255, 58, 137, 183),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                    suffixIcon: Icon(
                      Icons.search,
                      size: screenheight * 0.040,
                      //size: 24,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              // Row(
              //   children: [
              //     Container(
              //       padding: EdgeInsets.fromLTRB(
              //         MediaQuery.of(context).size.width * .05,
              //         MediaQuery.of(context).size.height * .0,
              //         MediaQuery.of(context).size.width * .0,
              //         MediaQuery.of(context).size.height * .02,
              //       ),
              //       width: screenwidth * 0.560,
              //       //color: Color.fromARGB(82, 158, 158, 158),
              //       child: Text(
              //         "Categories",
              //         style: TextStyle(
              //             color: Color.fromARGB(255, 0, 0, 0),
              //             fontWeight: FontWeight.w500,
              //             fontSize: screenheight * 0.037),
              //       ),
              //     ),
              //   ],
              // ),

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
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.055,
                  MediaQuery.of(context).size.height * 0.010,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoriesWD("Minato Namekaze", "004.png"),
                    CategoriesWD("Gojo Saturo", "001.jpg"),
                    CategoriesWD("Gojo Violet", "003.jpg"),
                    CategoriesWD("Marcus", "002.jpg"),
                    CategoriesWD("Link Click", "005.jpg"),
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
                    color: Color.fromARGB(110, 120, 120, 120),
                    width: 01,
                  ),
                  borderRadius: BorderRadius.circular(31),
                  // color: Color.fromARGB(0, 126, 126, 126),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CarouselSlider(
                    items: imagelist
                        .map((item) => Stack(
                              fit: StackFit.passthrough,
                              children: [
                                Image.asset(
                                  item['image_path'],
                                  fit: BoxFit.cover,
                                  width: double.maxFinite,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                        Colors.transparent,
                                        Colors.white.withOpacity(0),
                                      ])),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  top: screenheight * 0.190,
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
                                    color: Color.fromARGB(255, 196, 240, 255)
                                        .withOpacity(0.750),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            item['name'],
                                            style: TextStyle(
                                                fontSize: screenheight * 0.020,
                                                //fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 2,
                                          ),
                                        ),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            item['place'],
                                            style: TextStyle(
                                                fontSize: screenheight * 0.018,
                                                //fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: ClampingScrollPhysics(),
                      autoPlay: false,
                      aspectRatio: 1,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
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
  Widget CategoriesWD(String name, String filename) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.000,
        MediaQuery.of(context).size.height * 0.000,
        MediaQuery.of(context).size.width * 0.035,
        MediaQuery.of(context).size.height * 0.000,
      ),
      child: Column(
        children: [
          SizedBox(
            height: screenWidth * 0.309,
            width: screenWidth * 0.309,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/$filename'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.51),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          SizedBox(
            // height: 15,
            height: screenWidth * 0.030,
          ),
          Container(
            width: screenWidth * 0.300,
            child: Center(
              child: Text(
                '$name',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontSize: 16,
                  fontSize: screenHeight * 0.020,

                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
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
                      MediaQuery.sizeOf(context).width * 0.060,
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
}

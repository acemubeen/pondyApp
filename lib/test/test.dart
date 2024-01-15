import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

// Check Alignment screenheight & width, sizes of font and others
//
//
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 83, 148, 179),
          title: Text('Details Page'),
        ),
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: screenheight * .330,
                  width: screenwidth,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 228, 133, 133),
                      image: DecorationImage(
                          image: AssetImage('images/003.jpg'),
                          fit: BoxFit.cover)),
                  // Main Container
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              // Name Container
                              padding: EdgeInsets.only(left: 15),
                              height: screenheight * .102,
                              width: screenwidth * .50,
                              child: Center(
                                child: AutoSizeText(
                                  'Jinnah Stores Stationary and Paper Mart',
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: screenheight * .025,
                                    fontWeight: FontWeight.w500,
                                    shadows: [
                                      Shadow(
                                        // Bottom-left shadow
                                        color: Colors.black.withOpacity(0.5),
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // Add more widgets or adjust the size as needed
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    right: MediaQuery.of(context).size.width *
                                        .040,
                                  ),
                                  height: screenheight * .100,
                                  width: screenwidth * .50,
                                  decoration: BoxDecoration(
                                    //Like Icon THis Container
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // LIKE Icon Container

                                        height: screenheight * .12,
                                        width: screenwidth * .12,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white30,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 3.5, top: 0),
                                            child: LikeButton(
                                              size: screenheight * .035,
                                              circleSize: screenheight * .020,
                                              bubblesColor: BubblesColor(
                                                  dotPrimaryColor:
                                                      const Color.fromARGB(
                                                          255, 75, 255, 81),
                                                  dotSecondaryColor:
                                                      const Color.fromARGB(
                                                          255, 255, 165, 31)),
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

                      height: screenheight * .10,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.type_specimen_outlined,
                                  color: Color.fromARGB(255, 143, 121, 111),
                                  size: screenheight * .035,
                                ),
                                Text('  Retail and Shopping')
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
                      'RA para into paragraphsRA para into paragraphsRA para into paragraphs',
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
                      bottom: MediaQuery.of(context).size.height * .00,
                      left: MediaQuery.of(context).size.height * .007),
                  height: screenheight * .200,
                  width: screenwidth * .930,
                  child: SingleChildScrollView(
                    child: Text(
                      'RA paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs.A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: screenheight * .020,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .030,
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
                          Future.delayed(const Duration(milliseconds: 100), () {
                            setState(() {
                              _isTapped = false;
                            });
                          });
                        },
                        borderRadius:
                            BorderRadius.all(const Radius.circular(30)),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: _isTapped ? screenheight * .066 : 60,
                          width: _isTapped ? screenwidth * .580 : 248,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 83, 148, 179),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(30)),
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
                                color: const Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.7),
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
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
      ),
    );
  }
}

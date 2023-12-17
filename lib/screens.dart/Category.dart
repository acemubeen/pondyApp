import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Category")),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CategoryLists(context, cat1, 'm1'),
                    CategoryLists(context, cat2, 'm2'),
                    CategoryLists(context, cat3, 'm3'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CategoryLists(context, cat4, 'm4'),
                    CategoryLists(context, cat5, 'm5'),
                    CategoryLists(context, cat6, 'm6'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CategoryLists(context, cat7, 'm7'),
                    CategoryLists(context, cat8, 'm8'),
                    CategoryLists(context, cat9, 'm9'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CategoryLists(context, cat10, 'm10'),
                    CategoryLists(context, cat11, 'm11'),
                    CategoryLists(context, cat12, 'm12'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CategoryLists(context, cat13, 'm13'),
                    CategoryLists(context, cat14, 'm14'),
                    CategoryLists(context, cat15, 'm15'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CategoryLists(context, cat16, 'm16'),
                    CategoryLists(context, cat17, 'm17'),
                    CategoryLists(context, cat18, 'm18'),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                  MediaQuery.of(context).size.width * 0.000,
                  MediaQuery.of(context).size.height * 0.000,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CategoryLists(context, cat19, 'm19'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget CategoryLists(BuildContext context, String catname, String catimage) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.fromLTRB(
        MediaQuery.of(context).size.width * 0.025,
        MediaQuery.of(context).size.height * 0.005,
        MediaQuery.of(context).size.width * 0.020,
        MediaQuery.of(context).size.height * 0.000,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Color.fromARGB(251, 0, 0, 0),
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
            margin: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.000,
              MediaQuery.of(context).size.height * 0.030,
              MediaQuery.of(context).size.width * 0.000,
              MediaQuery.of(context).size.height * 0.000,
            ),
            // color: Color.fromARGB(255, 156, 134, 48),
            height: screenheight * 0.270,
            width: screenwidth * 0.270,
          ),
          Container(
            child: Center(
              child: Text(
                '$catname',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Color.fromRGBO(0, 0, 0, 0.511),
                        // color: Color.fromARGB(255, 159, 159, 159),
                        offset: Offset(0, 0),
                        blurRadius: 30,
                      )
                    ],
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.000,
              MediaQuery.of(context).size.height * 0.00,
              MediaQuery.of(context).size.width * 0.000,
              MediaQuery.of(context).size.height * 0.000,
            ),
            //color: Color.fromARGB(112, 130, 130, 130),
            height: screenheight * 0.100,
            width: screenwidth * 0.250,
          ),
        ],
      ),
    );
  }
}

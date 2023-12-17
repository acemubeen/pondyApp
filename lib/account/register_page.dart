import 'package:flutter/material.dart';

void main() {
  runApp(RegisterPage());
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 248, 094, 094),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.065,
                        MediaQuery.of(context).size.height * 0.050,
                        MediaQuery.of(context).size.width * 0.000,
                        MediaQuery.of(context).size.height * 0.000,
                      ),
                      color: Color.fromARGB(255, 248, 094, 094),
                      height: screenheight * 0.55,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            style: TextStyle(
                                color: Colors.white, // Text color
                                fontSize: 34,
                                fontWeight: FontWeight.bold // Text size
                                ),
                            "Register"),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70),
                            topRight: Radius.circular((50)))),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.065,
                        MediaQuery.of(context).size.height * 0.075,
                        MediaQuery.of(context).size.width * 0.065,
                        MediaQuery.of(context).size.height * 0.000,
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(0, 98, 0, 98),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 3, 8, 152)
                                      .withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 17,
                                  offset: Offset(
                                      0, 10), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        topRight: Radius.circular(7)),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(54, 255, 255, 255),
                                      labelText: 'Email or Phone number',
                                      labelStyle: TextStyle(
                                          color: Color.fromARGB(
                                              191, 137, 137, 137),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(7),
                                        bottomRight: Radius.circular(7)),
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(54, 255, 255, 255),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          color: Color.fromARGB(
                                              191, 137, 137, 137),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.000,
                              MediaQuery.of(context).size.height * 0.090,
                              MediaQuery.of(context).size.width * 0.000,
                              MediaQuery.of(context).size.height * 0.000,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 127, 127),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(70))),
                              height: screenheight * 0.140,
                              width: screenwidth * 0.550,
                              child: Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.000,
                              MediaQuery.of(context).size.height * 0.035,
                              MediaQuery.of(context).size.width * 0.000,
                              MediaQuery.of(context).size.height * 0.035,
                            ),
                            child: Text(
                              "Or Continue with",
                              style: TextStyle(
                                color: Color.fromARGB(191, 137, 137, 137),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: screenheight * 0.130,
                                width: screenwidth * 0.120,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 234, 066, 053),
                                    borderRadius: BorderRadius.circular(30)),
                                padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.015,
                                  MediaQuery.of(context).size.height * 0.015,
                                  MediaQuery.of(context).size.width * 0.015,
                                  MediaQuery.of(context).size.height * 0.015,
                                ),
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  "assets/images/icons/ic1.png",
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 052, 168, 083),
                                    borderRadius: BorderRadius.circular(30)),
                                padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.015,
                                  MediaQuery.of(context).size.height * 0.015,
                                  MediaQuery.of(context).size.width * 0.015,
                                  MediaQuery.of(context).size.height * 0.015,
                                ),
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  "assets/images/icons/ic2.png",
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                height: screenheight * 0.130,
                                width: screenwidth * 0.120,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

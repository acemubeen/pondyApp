import 'package:flutter/material.dart';
import 'package:pondyapp/screens.dart/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:pondyapp/test/sign_in_method.dart';

class SigninPage extends StatefulWidget {
  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.width;

    return MaterialApp(
      routes: {
        '/home': (context) => HomeScreen(),
      },
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 248, 094, 094),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              "Login"),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(70),
                                topRight: Radius.circular((50)))),
                        height: screenheight * 1.43860,
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
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
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
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
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
                                  MediaQuery.of(context).size.height * 0.060,
                                  MediaQuery.of(context).size.width * 0.000,
                                  MediaQuery.of(context).size.height * 0.000,
                                ),
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Color.fromARGB(191, 137, 137, 137),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.000,
                                  MediaQuery.of(context).size.height * 0.050,
                                  MediaQuery.of(context).size.width * 0.000,
                                  MediaQuery.of(context).size.height * 0.000,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 127, 127),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(70))),
                                  height: screenheight * 0.140,
                                  width: screenwidth * 0.550,
                                  child: Center(
                                    child: Text(
                                      "Sign In",
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
                                  MediaQuery.of(context).size.height * 0.025,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      try {
                                        await signInWithGoogle();

                                        Navigator.of(context)
                                            .pushReplacementNamed('/home');
                                      } catch (error) {
                                        print(error);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 235, 82, 77),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      padding: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width *
                                            0.015,
                                        MediaQuery.of(context).size.height *
                                            0.015,
                                        MediaQuery.of(context).size.width *
                                            0.015,
                                        MediaQuery.of(context).size.height *
                                            0.015,
                                      ),
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                        "assets/images/icons/ic1.png",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("Phone tapped");
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 052, 168, 083),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      padding: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width *
                                            0.015,
                                        MediaQuery.of(context).size.height *
                                            0.015,
                                        MediaQuery.of(context).size.width *
                                            0.015,
                                        MediaQuery.of(context).size.height *
                                            0.015,
                                      ),
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                        "assets/images/icons/ic2.png",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("Phone tapped");
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 130, 41, 41),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        padding: EdgeInsets.fromLTRB(
                                          MediaQuery.of(context).size.width * 0,
                                          MediaQuery.of(context).size.height *
                                              0,
                                          MediaQuery.of(context).size.width * 0,
                                          MediaQuery.of(context).size.height *
                                              0.000,
                                        ),
                                        height: 50,
                                        width: 50,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.person_off_outlined,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ))),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width * 0.000,
                                  MediaQuery.of(context).size.height * 0.100,
                                  MediaQuery.of(context).size.width * 0.000,
                                  MediaQuery.of(context).size.height * 0.000,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Not a member? ",
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              191, 137, 137, 137),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Register now",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
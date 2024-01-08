import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pondyapp/account/register_page.dart';
import 'package:pondyapp/main.dart';
import 'package:pondyapp/screens.dart/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:pondyapp/test/sign_in_method.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserCredential> signUp(String email, String password) async {
  UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  return userCredential;
}

Future<UserCredential> signIn(String email, String password) async {
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  return userCredential;
}

void handleSignUp(String email, String password) async {
  try {
    UserCredential userCredential = await signUp(email, password);
    // Handle successful sign-up
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  }
}

void handleSignIn(BuildContext context, String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    // Handle successful sign in
    User? user = userCredential.user;
    if (user != null) {
      print("User's email: ${user.email}");
      // Now you can send this idToken to your server and verify it there
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MyBottomNavigationBar()), // Navigate to HomeScreen page
      );
    }
  } catch (e) {
    print('Failed to sign in: ${e.toString()}');
  }
}

class SigninPage extends StatefulWidget {
  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor:
                                              Color.fromARGB(54, 255, 255, 255),
                                          labelText: 'Enter Your Email',
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
                                        controller: passwordController,
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
                                child: GestureDetector(
                                  onTap: () {
                                    handleSignIn(context, emailController.text,
                                        passwordController.text);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 127, 127),
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
                                          color: Color.fromARGB(
                                              255, 255, 221, 121),
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
                                      width: screenwidth * .500,
                                      child: Image.asset(
                                        "assets/images/icons/ic1.png",
                                        color: const Color.fromARGB(
                                            255, 235, 82, 77),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: screenheight * .13 ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Text(
                                      "Not a member? ",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(191, 137, 137, 137),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => RegisterPage(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      child: Text(
                                        "Register now",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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

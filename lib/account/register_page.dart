import 'package:flutter/material.dart';
import 'package:pondyapp/account/signin_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void handleSignUp(BuildContext context, String email, String password) async {
  try {
    UserCredential userCredential = await signUp(email, password);
    // Handle successful sign-up
    User? user = userCredential.user;
    if (user != null) {
      user.getIdToken().then((idToken) {
        print("ID Token: $idToken");
        // Now you can send this idToken to your server and verify it there
      });
    }
    Builder(
      builder: (BuildContext scaffoldContext) {
        ScaffoldMessenger.of(scaffoldContext).showSnackBar(
          const SnackBar(content: Text('Registration successful!')),
        );
        return Container();
      },
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SigninPage()),
    );
  } catch (e) {
    Builder(
      builder: (BuildContext scaffoldContext) {
        ScaffoldMessenger.of(scaffoldContext).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
        return Container();
      },
    );
  }
}

Future<UserCredential> signUp(String email, String password) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  return await auth.createUserWithEmailAndPassword(
      email: email, password: password);
}

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff608334),
        body: Builder(
          builder: (BuildContext scaffoldContext) {
            return MaterialApp(
              home: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Color(0xff608334),
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
                              color: Color(0xff608334),
                              height: screenheight * 0.55,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    style: TextStyle(
                                        color: Color(0xfff7feef), // Text color
                                        fontSize: screenheight * .070,
                                        // fontSize: 34,
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
                                          offset: Offset(0,
                                              10), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(7),
                                                topRight: Radius.circular(7)),
                                          ),
                                          child: TextField(
                                            controller: emailController,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xfff7feef),
                                              labelText: 'Enter your Email',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      204, 96, 131, 52),
                                                  fontSize: screenheight * .037,
                                                  fontWeight: FontWeight.w500),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: screenheight * .003),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(7),
                                                bottomRight:
                                                    Radius.circular(7)),
                                          ),
                                          child: TextField(
                                            controller: passwordController,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Color(0xfff7feef),
                                              labelText: 'Password',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      204, 96, 131, 52),
                                                  fontSize: screenheight * .037,
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
                                      MediaQuery.of(context).size.height *
                                          0.090,
                                      MediaQuery.of(context).size.width * 0.000,
                                      MediaQuery.of(context).size.height *
                                          0.000,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        handleSignUp(
                                            scaffoldContext,
                                            emailController.text,
                                            passwordController.text);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Color(0xff97b770),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(70))),
                                        height: screenheight * 0.140,
                                        width: screenwidth * 0.550,
                                        child: Center(
                                          child: Text(
                                            "Sign up",
                                            style: TextStyle(
                                              color: Color(0xfff7feef),
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
                                      MediaQuery.of(context).size.height *
                                          0.035,
                                      MediaQuery.of(context).size.width * 0.000,
                                      MediaQuery.of(context).size.height *
                                          0.035,
                                    ),
                                    child: Text(
                                      "Or Continue with Google",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(191, 137, 137, 137),
                                        fontSize: screenheight * .035,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: screenheight * 0.130,
                                        width: screenwidth * 0.120,
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
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pondyapp/account/register_page.dart';
import 'package:pondyapp/main.dart';
import 'package:pondyapp/screens.dart/home_screen.dart';
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
    // Handle successful sign-up
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
    } else if (e.code == 'email-already-in-use') {}
  }
}

void handleSignIn(BuildContext context, String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    // Handle successful sign in
    User? user = userCredential.user;
    if (user != null) {
      // Now you can send this idToken to your server and verify it there
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const MyBottomNavigationBar()), // Navigate to HomeScreen page
      );
    }
  } on FirebaseAuthException catch (e) {
    // Display an error message if login fails
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email or password doesn\'t match.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

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
        '/home': (context) => const HomeScreen(),
      },
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff608334),
        body: SingleChildScrollView(
          child: Column(
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
                    color: const Color(0xff608334),
                    height: screenheight * 0.55,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          style: TextStyle(
                              color: const Color(0xfff7feef),
                              fontSize: screenheight * .080,
                              // fontSize: 34,
                              fontWeight: FontWeight.bold // Text size
                              ),
                          "Login"),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
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
                          color: const Color.fromARGB(0, 98, 0, 98),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(7)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 3, 8, 152)
                                  .withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 17,
                              offset: const Offset(
                                  0, 10), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7)),
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xfff7feef),
                                  labelText: 'Enter Your Email',
                                  focusColor: Colors.grey,
                                  labelStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          204, 96, 131, 52),
                                      fontSize: screenheight * .037,
                                      // fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: screenheight * .003),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(7),
                                    bottomRight: Radius.circular(7)),
                              ),
                              child: TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: const Color(0xfff7feef),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      color: const Color.fromARGB(
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
                          MediaQuery.of(context).size.height * 0.060,
                          MediaQuery.of(context).size.width * 0.000,
                          MediaQuery.of(context).size.height * 0.000,
                        ),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: const Color.fromARGB(191, 137, 137, 137),
                            fontSize: screenheight * .035,
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
                            decoration: const BoxDecoration(
                                color: Color(0xff97b770),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(70))),
                            height: screenheight * 0.140,
                            width: screenwidth * 0.550,
                            child: const Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: Color(0xffF7FEEF),
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
                            color: const Color.fromARGB(191, 137, 137, 137),
                            fontSize: screenheight * .035,
                            // fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () async {
                              try {
                                await signInWithGoogle();

                                // ignore: use_build_context_synchronously
                                Navigator.of(context)
                                    .pushReplacementNamed('/home');
                                // ignore: empty_catches
                              } catch (error) {}
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xff97b770),
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.fromLTRB(
                                MediaQuery.of(context).size.width * 0.015,
                                MediaQuery.of(context).size.height * 0.015,
                                MediaQuery.of(context).size.width * 0.015,
                                MediaQuery.of(context).size.height * 0.015,
                              ),
                              // height: 50,
                              height: screenheight * .130,
                              width: screenwidth * .500,
                              child: Image.asset("assets/images/icons/ic1.png",
                                  color: const Color(0xfff7feef)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenheight * .073),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not a member? ",
                            style: TextStyle(
                              color: const Color.fromARGB(191, 137, 137, 137),
                              fontSize: screenheight * .035,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Register now",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: screenheight * .035,
                                fontWeight: FontWeight.w500,
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
        ),
      ),
    );
  }
}

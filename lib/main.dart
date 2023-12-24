import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:pondyapp/authenticate/googlemaps.dart';
import 'package:pondyapp/screens.dart/Category.dart';
import 'package:pondyapp/account/signin_page.dart';
// import 'package:pondyapp/screens.dart/detailcard.dart';
import 'package:pondyapp/screens.dart/explore.dart';
import 'package:pondyapp/screens.dart/profile.dart';
//  import 'package:pondyapp/screens.dart/saved.dart';
import 'package:pondyapp/screens.dart/home_screen.dart';
// import 'package:pondyapp/test/minisign_in_page.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:pondyapp/account/register_page.dart';
// import 'package:pondyapp/account/signin_page.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      //Pages
      MyApp()
      //DetailCard()
      //Explore()
      //MiniSignInPage(),
      //HomeScreen(),
      //Category(),
      //Test2()
      // SigninPage(),
      //RegisterPage(),
      //test(),
      //looose
      );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: SigninPage(),
      // MyBottomNavigationBar(),
      routes: {
        '/home': (context) => MyBottomNavigationBar(),
      },
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    Category(),
    Explore(),
    //SavedNb(),
    GoogleMaps(),
    ProfileNb(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 127, 205, 249),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: onTappedBar,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.save_sharp), label: "Saved"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle), label: "Open Google Maps"),
            BottomNavigationBarItem(
                icon: Icon(Icons.explicit), label: "Explore")
          ],
        ),
      ),
    );
  }
}

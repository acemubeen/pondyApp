import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pondyapp/savedcards.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'package:pondyapp/screens.dart/Category.dart';
import 'package:pondyapp/account/signin_page.dart';
import 'package:pondyapp/screens.dart/profile.dart';
import 'package:pondyapp/screens.dart/home_screen.dart';
import 'package:pondyapp/screens.dart/saved_page.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider<SavedItemsProvider>(
    create: (context) => SavedItemsProvider(),
    child: const MaterialApp(
      home: MyApp(),
      // Test(),
      // MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          if (user == null) {
            return const SigninPage();
          }
          return const MyBottomNavigationBar();
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
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
    const HomeScreen(),
    const Category(),
    const SavedPage(),
    //Explore(),

    //SavedNb(),
    // GoogleMaps(),
    const ProfileNb(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f2e8),
      body: _children[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20)), // Adjust the radius as needed
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 0), // This lifts the navigation bar up
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: const Color.fromARGB(255, 18, 80, 67),
            currentIndex: _currentIndex,
            onTap: onTappedBar,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Color.fromARGB(255, 82, 180, 178),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded),
                label: "Category",
                backgroundColor: Color.fromARGB(255, 82, 180, 178),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.save_sharp),
                label: "Saved",
                backgroundColor: Color.fromARGB(255, 82, 180, 178),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explicit),
                label: "Explore",
                backgroundColor: Color.fromARGB(255, 82, 180, 178),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

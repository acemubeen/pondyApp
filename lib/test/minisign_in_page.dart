import 'package:flutter/material.dart';
import 'package:pondyapp/test/sign_in_method.dart';

class MiniSignInPage extends StatelessWidget {
  const MiniSignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                try {
                  await signInWithGoogle();

                  Navigator.of(context).pushReplacementNamed('/home');
                } catch (error) {
                  print(error);
                }
              },
              child: Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }
}

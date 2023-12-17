import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedNb extends StatelessWidget {
  const SavedNb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Saved Page",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

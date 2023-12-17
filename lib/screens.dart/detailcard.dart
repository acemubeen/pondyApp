import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Detail Card'),
        elevation: 10,
        backgroundColor: Colors.purple[50],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: screenheight * 0.3,
              width: screenwidth * 0.96,
              color: Colors.purple[50],
              child: Center(
                child: Text("Detail Card Image"),
              ),
            ),
            Row(
              children: [Text('Ameer Oil Mill')],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.grey,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.grey,
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

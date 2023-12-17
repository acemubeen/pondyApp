import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

void openGoogleMap(String placeName) async {
  String encodedPlaceName = Uri.encodeFull(placeName);
  Uri uri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$encodedPlaceName");

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not open the map.';
  }
}

class GoogleMaps extends StatelessWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 191, 191),
      appBar: AppBar(
        title: Text("Open Google Maps"),
        backgroundColor: Colors.green[100],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                openGoogleMap("Ameer Oil Trade"); // San Francisco
              },
              child: Text('Locate Ameer Oil Trade'),
            ),
          ],
        ),
      ),
    );
  }
}

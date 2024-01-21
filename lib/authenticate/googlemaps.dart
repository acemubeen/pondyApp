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
  const GoogleMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 191, 191),
      appBar: AppBar(
        title: const Text("Open Google Maps"),
        backgroundColor: Colors.green[100],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                openGoogleMap("Ameer Oil Trade"); // San Francisco
              },
              child: const Text('Locate Ameer Oil Trade'),
            ),
          ],
        ),
      ),
    );
  }
}

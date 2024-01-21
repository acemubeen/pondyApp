
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pondyapp/screens.dart/detailcard.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {

    @override
  void initState() {
    super.initState();
  }
  Stream<List<DocumentSnapshot>> getTrendingStream() {

  // Replace 'trending_place' with the name of your Firestore collection
  return FirebaseFirestore.instance
      .collection('place')
      .where(FieldPath.documentId, whereIn: ['112','111','110','131','132','133',]) // Filter by document IDs
      .snapshots()
      .map((snapshot) => snapshot.docs);
  }


  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: getTrendingStream(),
      builder: (BuildContext context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No Data Available');
        }
        // Create a list of widgets for the trending places
       // Inside the StreamBuilder's builder function
List<Widget> trendingPlacesWidgets = snapshot.data!.map((documentSnapshot) {
  Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>? ?? {};
  String image = data['image'] as String? ?? 'No Image';
  String tpname = data['name'] as String? ?? 'No name';
  String location = data['location'] as String? ?? 'Unknown location';
  String type = data['type'] as String? ?? 'No type';
  String documentId = documentSnapshot.id;
  return trendingPlaces(
    context, // Pass the context here
    image,
    tpname,
    location,
    type,
    documentId,
  );
}).toList();
        // Return a Column with the trending places widgets
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded,
          color: Colors.grey[200],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
            backgroundColor: const Color(0xff67c2bf),
            title: const Text('Trending & Top Places',
            style: TextStyle(
              color: Color(0xfff5f2e8),
            ),
            ),
           
          ),
          body:SingleChildScrollView(
            
            child: Column(
              children: [
                SizedBox(height: screenheight*.05,),
                Column(
                  children: trendingPlacesWidgets,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget trendingPlaces(BuildContext context, image, String tpname, String location, String type,
      String documentId) {
        double screenwidth = MediaQuery.of(context).size.width;
         double screenheight = MediaQuery.of(context).size.height;
  

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailCard(documentId: documentId),
            ));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.070,
          MediaQuery.of(context).size.height * 0.013,
          MediaQuery.of(context).size.width * 0.000,
          MediaQuery.of(context).size.height * 0.013,
        ),
        height: screenheight * 0.125,
        width: screenwidth * 0.870,
        decoration: BoxDecoration(
            boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(255, 111, 111, 111)
                                        .withOpacity(0.1), // Shadow color
                                    offset:
                                        const Offset(2, 3), // Offset of the shadow
                                    blurRadius: 30, // Amount of blur
                                    spreadRadius: 0,
                                  ),
                                ],
          borderRadius: BorderRadius.circular(10),
          
        ),

        ////////////
        child: Row(
          children: [
            Container(
                height: screenheight * 0.150,
                width: screenwidth * 0.250,
                decoration: BoxDecoration(
                   
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(image),
                    ))),
            Expanded(
              child: Container(
                height: screenheight * 0.250,
                width: screenwidth * 0.650,
                decoration: const BoxDecoration(
                
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color:  Color.fromARGB(255, 228, 243, 254),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.sizeOf(context).width * 0.027,
                        MediaQuery.sizeOf(context).height * 0.010,
                        MediaQuery.sizeOf(context).width * 0.000,
                        MediaQuery.sizeOf(context).height * 0.005,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              // NAME OF THEPLACE
                              tpname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff142850)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.sizeOf(context).width * 0.030,
                        MediaQuery.sizeOf(context).height * 0.000,
                        MediaQuery.sizeOf(context).width * 0.000,
                        MediaQuery.sizeOf(context).height * 0.000,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            size: screenheight * 0.030,
                            Icons.location_on_outlined,
                            color: const Color(0xff67c2bf),
                          ),
                          Expanded(
                            child: Text(
                              location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(195,39,73,109)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.sizeOf(context).width * 0.075,
                        MediaQuery.sizeOf(context).height * 0.007,
                        MediaQuery.sizeOf(context).width * 0.000,
                        MediaQuery.sizeOf(context).height * 0.000,
                      ),
                      child: Row(
                        children: [
                          FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              // TYPE OF THE PLACE
                              "Type: ",
                              style: TextStyle(
                                  fontSize: screenwidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey),
                            ),
                          ),
                          FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              type,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff2364aa)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
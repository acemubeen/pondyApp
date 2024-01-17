
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pondyapp/screens.dart/detailcard.dart';

class TrendingScreen extends StatelessWidget {
  
  
  const TrendingScreen({super.key});
 Stream<List<DocumentSnapshot>> getTrendingStream() {
  // Replace 'trending_place' with the name of your Firestore collection
  return FirebaseFirestore.instance
      .collection('place')
      .where(FieldPath.documentId, whereIn: ['112', '111', '143','001','122']) // Filter by document IDs
      .snapshots()
      .map((snapshot) => snapshot.docs);
}




  @override
  Widget build(BuildContext context) {
        double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: getTrendingStream(),
      builder: (BuildContext context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No Data Available');
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
  return TrendingPlaces(
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
            backgroundColor: Colors.grey,
            title: Text('Trending & Top Places'),
           
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
  @override
  Widget TrendingPlaces(BuildContext context, image, String tpname, String location, String type,
      String documentId) {
        double screenwidth = MediaQuery.of(context).size.width;
         double screenheight = MediaQuery.of(context).size.height;
  
  TextStyle commonTextStyle = TextStyle(
   
    fontSize: screenwidth * 0.035,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(199, 4, 98, 115),
  );

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
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(0, 67, 63, 63),
        ),

        ////////////
        child: Row(
          children: [
            Container(
                height: screenheight * 0.150,
                width: screenwidth * 0.250,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(0.2), // Shadow color
                        offset: Offset(-1, 3), // Offset of the shadow
                        blurRadius: 5, // Amount of blur
                        spreadRadius: 2,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
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
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 111, 111, 111)
                          .withOpacity(0.2), // Shadow color
                      offset: Offset(2, 3), // Offset of the shadow
                      blurRadius: 5, // Amount of blur
                      spreadRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: Color.fromARGB(255, 255, 252, 245),
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
                          Container(
                            child: Expanded(
                              child: Text(
                                // NAME OF THEPLACE
                                tpname,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: screenwidth * 0.045,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(211, 21, 21, 21)),
                              ),
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
                            color: Color.fromARGB(173, 239, 89, 89),
                          ),
                          Expanded(
                            child: Text(
                              location,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.035,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(194, 1, 41, 59)),
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
                                  color: Color.fromARGB(213, 105, 64, 5)),
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
                                  color: Color.fromARGB(199, 4, 98, 115)),
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
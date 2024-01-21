import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            "Explore Page",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
        ),
        body: SingleChildScrollView(
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // TopPlaces('001', 'Gojo saturo', 'shibuysa incident', 'anime'),
              // TopPlaces('002', 'Rock Beach', '..', 'Beach'),
              // PlaceCards('001', "Gojo saturo", 'tpname', 'location', 'type'),
              topPlaces('001', "Gojo saturo", 'tpname', 'location'),
              topPlaces('002', "Gojo saturo", 'tpname', 'location'),
              topPlaces('003', "Gojo saturo", 'tpname', 'location'),
              topPlaces('005', "Gojo saturo", 'tpname', 'location'),
              topPlaces('005', "Gojo saturo", 'tpname', 'location'),
              topPlaces('005', "Gojo saturo", 'tpname', 'location'),
              topPlaces('005', "Gojo saturo", 'tpname', 'location'),
              topPlaces('005', "Gojo saturo", 'tpname', 'location'),
              // LissTiile(),
            ],
          ),
        ),
      ),
    );
  }

/*                               o      o 00000000000000000000
`                                   V                00000000000000000                  
`                        <>     OVERRIDEE     <>   000000000000000
`                                               000000000000

*/

  
  Widget topPlaces(String image, String tpname, String location, String type) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.00,
          MediaQuery.of(context).size.height * 0.020,
          MediaQuery.of(context).size.width * 0.00,
          MediaQuery.of(context).size.height * 0.00,
        ),
        height: screenheight * 0.130,
        width: screenwidth * 0.870,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //color: Color.fromARGB(147, 218, 86, 86),
        ),

        ////////////
        child: Row(
          children: [
            Container(
              height: screenheight * 0.130,
              width: screenwidth * 0.260,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(234, 255, 255, 255),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'images/$image.jpg',
                      ))),
            ),
            Expanded(
              child: Container(
                height: screenheight * 0.250,
                width: screenwidth * 0.650,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(234, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
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
                              tpname,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.045,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromARGB(211, 21, 21, 21)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.sizeOf(context).width * 0.040,
                        MediaQuery.sizeOf(context).height * 0.000,
                        MediaQuery.sizeOf(context).width * 0.000,
                        MediaQuery.sizeOf(context).height * 0.000,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            size: screenheight * 0.030,
                            Icons.location_on_outlined,
                            color: const Color.fromARGB(255, 242, 155, 155),
                          ),
                          SizedBox(
                            width: screenwidth * .47,
                            child: Text(
                              "$location Subhan Allah, Alhamdhulillah, Allahu akbar... ",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.029,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(211, 21, 21, 21)),
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
                          Text(
                            "Type: ",
                            style: TextStyle(
                                fontSize: screenwidth * 0.030,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(145, 0, 0, 0)),
                          ),
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              type,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: screenwidth * 0.030,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(211, 21, 21, 21)),
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

/*                               o      o
`                                   V                                  
`                        <>     OVERRIDEE     <>


*/

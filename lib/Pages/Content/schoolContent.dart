import 'package:flutter/material.dart';



class schoolOrgPage extends StatelessWidget {

  final String schoolName;
  final String schoolImg;
  final int numberOfEvents;

  // Constructor
  const schoolOrgPage({
    Key? key,
    required this.schoolName,
    required this.schoolImg,
    required this.numberOfEvents,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
            //ADD SHADOW
            elevation: 0,
            //leading: Icon(Icons.menu),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.notifications),
                visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),), //Notifications
              IconButton(onPressed: () {}, icon: Icon(Icons.settings),
                visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),), //Settings
              IconButton(onPressed: () {}, icon: Icon(Icons.circle),
                visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),) //Profile
            ],

          ),
      body: SingleChildScrollView(
        
        child: Column(children: [

        Row(
          children: [
            Image.asset(
              '${schoolImg}',
              width: 100, // adjust width as needed
              height: 100, // adjust height as needed
            ),            
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8), // Adjust padding as needed
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${schoolName}", // Title
                      overflow: TextOverflow.ellipsis, // Handle overflow
                      maxLines: 1, // Restrict to one line
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green),
                    ),
                    Text(
                      "Population Count: 1000", // Title
                      overflow: TextOverflow.ellipsis, // Handle overflow
                      maxLines: 1, // Restrict to one line
                    ),
                    Text(
                      "Number of Events: ${numberOfEvents}", // Title
                      overflow: TextOverflow.ellipsis, // Handle overflow
                      maxLines: 1, // Restrict to one line
                    ),
                  ],
                ),
                  ),
                ),
              ],
            ),

          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
          child: Row(children: [
            Text("LATEST EVENTS", style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(child: Container()),
            IconButton(
              padding: EdgeInsets.only(left: 20),
              icon: Image.asset(
                "assets/List.png",
                width: 20, // Adjust the width of the image as needed
                height: 20, // Adjust the height of the image as needed
                color: Colors.black, // Optionally, set the color of the image
              ),
              onPressed: () {
                // Add onPressed callback here
                // This function will be executed when the IconButton is pressed
              },
            )

          ],),
        ),
    

          Wrap(
            spacing: 8.0, // Spacing between containers horizontally
            runSpacing: 8.0, // Spacing between rows vertically
            children: List.generate(6, (index) {
              return 
              
              GestureDetector(
                onTap: () {
                        print("Navigate");
                        Navigator.pushNamed(context, "/ContentPage");
                        //SHOULD PASS A UNIQUE IDENTIFIER

                      },
                child: Padding( 
                  padding: EdgeInsets.all(0),
                  child: 
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 12, // Adjust width to fit two columns
                      height: 189, // Adjust height as needed
                      decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage("assets/landing_back.png"),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                      Colors.blue.withOpacity(0.1),
                                      BlendMode.overlay,
                                    ),
                                  ),
                                ),
                        alignment: Alignment.center,
                        child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2 - 12,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color.fromRGBO(5, 134, 40, 0.529),
                                      Color.fromARGB(176, 255, 255, 255)
                                    ],
                                  ),
                                ),
                                child: Container(
                                  //InnerCard Content
                                  child: const Column( //Could be problematic has const
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //TITLE
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: Text("Plantings 2024",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                      //LOCATION
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: Text("Tanay, Rizal",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white60
                                          )),
                                      ),
                                      //DATE
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                        child: Text("June 23, 2024",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white60
                                          )),
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
                                            child: Text(
                                              "See More",
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white60
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                      ),

                      

                  

                  
                )
                
                
              );
              
            }),
          )
      





      ],),)
    );
  }

}

import "package:flutter/material.dart";


class impactComp extends StatefulWidget {
  const impactComp({super.key});

  @override
  State<impactComp> createState() => _impactCompState();
}

class _impactCompState extends State<impactComp> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [


      //WALLET
      Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20), // Add margin to create space from the edges
            width: MediaQuery.of(context).size.width * .90, // Adjust width as needed
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.2),
            ),
          ),

          Row(children: [
              SizedBox(width: 20,),
              Container(
                width: 75, // Adjust width as needed for smaller size
                height:75, // Adjust height as needed for smaller size
                child: Image.asset(
                  "assets/wallet.png",
                  fit: BoxFit.contain, // Ensure the image fits within the container
                ),
              ), 

              SizedBox(width: 5,),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Alex Wallet", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),),
                  Text("₱ 500", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25))// Make THis Changeable
                ],
              ),

              SizedBox(width: 15,),

             ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Adjust border radius as needed
                  ),
                ),
              ),
              child: Text(
                "+ Top Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),
              ),
            )


          ],)

        ],
      ),

      Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
        child: Row(children: [
          Text("DISCOVER FEATURED DRIVES", style: TextStyle(fontWeight: FontWeight.bold),),
          Expanded(child: Container()),
          Icon(Icons.more_horiz) //SHOULD BE CLICKABLE

        ],),
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Divider()
      ),


      Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
        child: Row(children: [
          Text("COMPLETED EVENTS", style: TextStyle(fontWeight: FontWeight.bold)),
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


      // NEED A DATABASE/CLASS REFERENCE 
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
      
      
      
      
      ],);
    
    
  }
}


class eventsList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust the horizontal padding as needed
                child: 
                
                //CARD CONTAINER REPLACE WITH CLASS OR CUSTOM WIDGET
                GestureDetector( 
                  onTap: () {
                    print("Navigate");
                    Navigator.pushNamed(context, "/ContentPage");
                    //SHOULD PASS A UNIQUE IDENTIFIER

                  },
                  child:
                  Container(
                    decoration: 
                      BoxDecoration(
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

                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          child: Container(
                            height: 100,
                            width: 100,
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
  }

}
// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:projectui/Pages/Content/content.dart";
import "package:projectui/Pages/Content/schoolContent.dart";


class leaderBoardComp extends StatefulWidget {
  const leaderBoardComp({super.key});

  @override
  State<leaderBoardComp> createState() => _leaderBoardCompState();
}

class SchoolItem {
  final String imagePath;
  final String name;
  final int Score;

  SchoolItem({required this.imagePath, required this.name, required this.Score});
}

class _leaderBoardCompState extends State<leaderBoardComp> {

  final List<SchoolItem> items = [
    SchoolItem(imagePath: "assets/PUP.png", name: "Polytechnic University of the Philippines", Score: 100),
    SchoolItem(imagePath: "assets/UP.png", name: "University of the Phillippines", Score: 80),
    SchoolItem(imagePath: "assets/UE.png", name: "University of the East", Score: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          

          Center(
            child: Text("TOP ECOGROW EVENT CONTRIBUTORS", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child:      boardGraph(),
          ),

          Padding(padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(),),
          
          SingleChildScrollView(
              child:  boardList(items: items,),
          ) 
          
          
        ],
        
      );
      
    
      



      
    
    
  }
}



//List 
class boardList extends StatefulWidget {
  final List<SchoolItem> items; 

  const boardList({super.key, required this.items});

  @override
  State<boardList> createState() => _boardListState();
}

class _boardListState extends State<boardList> {

@override
  Widget build(BuildContext context) {
    // Calculate the height of each item
    double itemHeight = MediaQuery.of(context).size.height / widget.items.length;

    return Column(children: [


        //POST LISTS
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the detail page and pass the unique value
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => schoolOrgPage(schoolName: widget.items[index].name, schoolImg: widget.items[index].imagePath, numberOfEvents: widget.items[index].Score,),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.125),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ],
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(widget.items[index].imagePath, fit: BoxFit.contain),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "TOP ${3 + index}",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${widget.items[index].name}",
                                style: TextStyle(overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${widget.items[index].Score}",
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )

        
        ]);
  }


}

//boardGraph Animation
class boardGraph extends StatefulWidget {
  const boardGraph({super.key});


  @override
  State<boardGraph> createState() => _boardGraphState();
}

class _boardGraphState extends State<boardGraph> {
  
  @override
  Widget build(BuildContext context) {

    //Size of boxes
    double widthBox = MediaQuery.of(context).size.width * 0.8;
    
    
    List<double> size = [
      widthBox * .25,
      widthBox * .55,
      widthBox * .20
    ];
    

    return Center (
      child: Row(
      
        children: [

          Column(
            children: [
              //Images
              SizedBox(
              height: size[0], // Adjust the height as desired
              width: size[0], // Adjust the width as desired
              child: IconButton(
                padding: EdgeInsets.all(0.0),
                icon: Image.asset('assets/school_logo.png', fit: BoxFit.contain), // Adjust width and height here
                onPressed: () {
                  // Add your onPressed functionality here
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => schoolOrgPage(schoolName: "Technological Institute of the Philippines", schoolImg: 'assets/school_logo.png', numberOfEvents: 400,)
                  )
                    );
                },
              ),
            ),


              //Graph in STACK FORMAT

              Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter, // Align the whole container to the bottom
                child: Container(
                  width: size[0], // 80% of screen width
                  height: 50 * 2.0, // Initial height multiplied by scaling factor
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: const [Colors.green,Color.fromARGB(255, 119, 192, 98) ,Colors.white],
                    ),
                  ),
                ),
              ),

              Text("2", style: TextStyle(fontSize: size[0] * .80, color: Colors.white, fontWeight: FontWeight.bold), ),

              Padding(
                padding: EdgeInsets.only(top: 110),
                child: Column(
                  children: [
                    Text("400+", style: TextStyle(fontSize: size[1] * .14  , color: Colors.black54, fontWeight: FontWeight.bold),), 
                  ],
                )
                
              )

              

            ])
              


        
        
          ],),

          SizedBox(width: 5),
          Column(
            children: [
              //Images
              GestureDetector(
              onTap: () {
                
                 Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => schoolOrgPage(schoolName: "Polytechnic University of the Philippines", schoolImg: 'assets/PLM.png', numberOfEvents: 600,)
                ));
              },
              child: Image.asset(
                'assets/PLM.png',
                fit: BoxFit.contain, // Adjust width and height here
              ),
            ),


            //Graph in STACK FORMAT
            

          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter, // Align the whole container to the bottom
                child: Container(
                  width: size[1], // 80% of screen width
                  height: 80 * 2.0, // Initial height multiplied by scaling factor
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: const [Colors.green,Color.fromARGB(255, 119, 192, 98) ,Colors.white],
                    ),
                  ),
                ),
              ),
              
              

              Text("1", style: TextStyle(fontSize: size[1] * .80, color: Colors.white, fontWeight: FontWeight.bold), ),

              Padding(
                padding: EdgeInsets.only(top: 150),
                child: Column(
                  children: [
                    Text("600+", style: TextStyle(fontSize: size[1] * .20  , color: Colors.black54, fontWeight: FontWeight.bold),), 
                  ],
                )
                
              )
              





            ])
        
        
          ],),
                    
        SizedBox(width: 5),
        Column(
            children: [
              //Images
              SizedBox(
              height: size[2], // Adjust the height as desired
              width: size[2], // Adjust the width as desired
              child: GestureDetector(
              onTap: () {
                // Add your onPressed functionality here
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => schoolOrgPage(schoolName: "National University", schoolImg: 'assets/NU.png', numberOfEvents: 200,)
                ));
              },
              child: Image.asset(
                'assets/NU.png',
                fit: BoxFit.contain, // Adjust width and height here
              ),
            )
            ),


              //Graph in STACK FORMAT
            Stack(
              alignment: Alignment.center,
              children: [
              Align(
                alignment: Alignment.bottomCenter, // Align the whole container to the bottom
                child: Container(
                  width: size[2], // 80% of screen width
                  height: 40 * 2.0, // Initial height multiplied by scaling factor
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: const [Colors.green,Color.fromARGB(255, 119, 192, 98) ,Colors.white],
                    ),
                  ),
                ),
              ),

                            
              Text("3", style: TextStyle(fontSize: size[2] * .80, color: Colors.white, fontWeight: FontWeight.bold),),

              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text("200+", style: TextStyle(fontSize: size[1] * .10  , color: Colors.black54, fontWeight: FontWeight.bold),), )



            ])
        
        
          ],),


          
          
      ],),
            
          
    );
  }
}
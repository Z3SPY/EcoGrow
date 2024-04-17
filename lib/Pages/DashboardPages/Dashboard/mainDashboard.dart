/*import "package:flutter/material.dart";
import "package:projectui/Pages/DashboardPages/LeaderBoard/leaderboardpage.dart";


class mainDashboard extends StatefulWidget {
  @override
  State<mainDashboard> createState() => _mainDashboardState();
}

class _mainDashboardState extends State<mainDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: leaderBoardComp()

      ),
    );
    
  }
}*/


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectui/Pages/Content/content.dart';
import 'package:projectui/Pages/DashboardPages/LeaderBoard/leaderBoardPage.dart';
import 'package:projectui/Pages/DashboardPages/MyImpact/myImpactPage.dart';


class mainDashboard extends StatefulWidget {
  const mainDashboard({super.key});

  @override
  State<mainDashboard> createState() => _mainDashboardState();
}

class _mainDashboardState extends State<mainDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "/ContentPage": (context) => const ContentPage(),
         },
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            //ADD SHADOW
            elevation: 0,
            //leading: Icon(Icons.menu),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications),
                visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),), //Notifications
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings),
                visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),), //Settings
              IconButton(onPressed: () {}, icon: const Icon(Icons.circle),
                visualDensity: const VisualDensity(horizontal: -4.0, vertical: -4.0),) //Profile
            ],

          ),
          body: const homePage(),
          bottomNavigationBar: const BottomBar(),
        ));
  }
}



//NAV BAR HOME PAGE
class HomeNavBar extends StatefulWidget {
  final Function(int) onIndexChanged;

  const HomeNavBar({super.key, required this.onIndexChanged});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {


  //Handle Transition
  var currentIndex = 0;

  


  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width ;
    const List<String> navItems = [
        "Activites",
        "Leaderboards",
        "My Impact"
    ];

    const List<IconData> listofIcons = [
      Icons.local_activity,
      Icons.leaderboard,
      Icons.handshake,

    ];


    return Container(
      margin: EdgeInsets.all((displayWidth * 0.05)),
      height: displayWidth * .1,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(36, 0, 0, 0),
            spreadRadius: 1,
            blurRadius: 30,
            
          )
        ]
      ),
      
      child: ListView.builder(
        itemCount: navItems.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        itemBuilder: ((context, index) => InkWell(

          //HANDLE NAVIGATE
          onTap: () {
            setState(() {
              currentIndex = index;
              HapticFeedback.lightImpact();
              

              //Calls this.function
              widget.onIndexChanged(index);
            });
          },

          //VISUAL ELEMENTS
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [

              //CIRCLE SPACING
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == currentIndex ? displayWidth * .50 : displayWidth * .20,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: index == currentIndex ? displayWidth * .12 : 0,
                  width: index == currentIndex ? displayWidth * .40 : 0,
                  decoration: BoxDecoration(
                    color: index == currentIndex ? 
                      const Color.fromARGB(255, 78, 133, 80) : Colors.transparent,
                    borderRadius: BorderRadius.circular(10)),
                ),
              ),

              //TEXT SPACING
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                width: index == currentIndex ? 
                  displayWidth * .40 : 
                  displayWidth * .18,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Row(children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width:  index == currentIndex ?
                          displayWidth * .13 : 0,
                        
                        ),
                      AnimatedOpacity(
                        opacity: index == currentIndex ? 1 : 0, 
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Text(index == currentIndex ? navItems[index]
                          : '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15
                          ),
                          
                          ),
                        
                        )
                    ],),
                    Row (
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          width: index == currentIndex ? displayWidth * .03 : 20,  
                        ),
                        Icon(
                          listofIcons[index],
                          size: displayWidth * .076,
                          color: index == currentIndex  ? Colors.white   : Colors.black26
                        )
                      ],
                    )
                  ],
                ),
              )



            ],
          ),

        )) ,

      ),
    );  
  }
}



//BOTTOM BAR HOME PAGE
class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
      return 
        CurvedNavigationBar(
        
        height: 60,
        index: _selectedIndex,
        backgroundColor: Colors.white, 
        color: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
        setState(() {
        });
      },
        items: <Widget>[
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
            'assets/home.png',
            color: Colors.white, 
            width: 100,
            height: 30,
            ),
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
            'assets/person.png',
            color: Colors.white, 
            width: 50,
            height: 30,
            ),
          )
            
          

        ],
      );
         
  }
}

//HOME PAGE 
//THIS IS THE MAIN PAGE CONTAINS MOST OF HTE BULK

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  int _currentIndex = 0;

  //Define a functon to update the currentIndex
  void updateIndex(int index) {
    setState(() {
      _currentIndex = index;
      print(_currentIndex);
    });
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [

          //TITLE 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Image.asset(
                  "assets/logo_small.png"
                ),


                Text("How are you alex?",
                style: TextStyle(
                  color: Colors.green[500],
                  fontSize: 20,
                  fontStyle: FontStyle.italic
                ),),

                Text("Let's make impact for the future",
                style: TextStyle(
                  color: Colors.green[500],
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),)
              ],
            )
          ),
          //TITLE END

          //Inner Navigator
          HomeNavBar(onIndexChanged: updateIndex),
          //Inner Navigator End


          if (_currentIndex == 0) 
            const Activites()
          else if (_currentIndex == 1)
            Expanded(child:  leaderBoardComp())
          else 
            Expanded(child: impactComp(),)

          

                    

          


              

        


        ],
      ),
    );
  }
}


class Activites extends StatefulWidget {
  const Activites({super.key});

  @override
  State<Activites> createState() => _ActivitesState();
}

class _ActivitesState extends State<Activites> {

    List<String> items = List<String>.generate(5, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [

        //ACTIVITY SEC TITLE
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(children: [
                const Text(
                "Latest Activites", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),

              const Expanded(child: Divider(
                thickness: 0,
                color: Colors.white,
              )),

              
              IconButton(onPressed: () {}, icon: const Icon(Icons.stacked_bar_chart))
              
            ],) 
              
          ),



      //ACTIVITES
      SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
          child: Row(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust the horizontal padding as needed
                child: 
                
                //CARD CONTAINER REPLACE WITH CLASS OR CUSTOM WIDGET
                GestureDetector( 
                  onTap: () {
                    print("Navigate");
                    Navigator.pushNamed(context, "/ContentPage");
                    //SHOULD PASS A UNIQUE IDENTIFIER

                  },
                  child:Container(
                    decoration: 
                      BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: const AssetImage("assets/landing_back.png"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.blue.withOpacity(0.1),
                            BlendMode.overlay,
                          ),
                        ),
                      ),

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Container(
                            height: 200,
                            width: 158,
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
              ),
              
              //AFTER GENERATING A LIST PLOT ALL SPACES IN
            ).map((widget) {
              return Row(
                children: [
                  widget,
                  const SizedBox(width: 0.0), // Adjust the width as needed
                ],
              );
            }).toList(),
          )

        ), 
        
        //POST TITLE
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Row(children: [
                const Text(
                "Previous Activites", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),

              const Expanded(child: Divider(
                thickness: 0,
                color: Colors.white,
              )),

              RichText(text: TextSpan(
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green
                ),
                text: "See All",
               recognizer: TapGestureRecognizer()..onTap = () {
                 //Navigate to previous event
               }
              )
                  
              )
              
            ],) 
            
            
          ),
        

        //POST LISTS
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Container(
                  width: 50,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.125),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0,3)
                      )
                    ],
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        
        ]);
  }
}



//=========
//=========
//=========

//IMPORTANT FOR INTEGRATION
class Post {
  //Values for profile
  //Values for content
}

class ContentCard extends StatefulWidget {
  final bool? activated = false;

  const ContentCard({super.key}); //Checks if clicked or not


  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  @override
  Widget build(BuildContext context) {
    return const Card(
    );
    
  }
}

//=========
//=========
//=========
//=========
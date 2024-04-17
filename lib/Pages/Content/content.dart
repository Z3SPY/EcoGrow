// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final List<String> imgList = [
  'assets/forms_back.png',
  'assets/forms_back.png',
  'assets/forms_back.png',
  'assets/forms_back.png',
  'assets/forms_back.png',

];


final themeMode = ValueNotifier(2);

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(body: CarouselWithIndicatorDemo());
    
  }
}



final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0), // Using Image.asset instead of Image.network
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        /*child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),*/
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();



class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(), // This is an empty app bar
      ),
      body: 
      
      SingleChildScrollView(
        scrollDirection: Axis.vertical, // Set scroll direction to horizontal




        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //CAROUSEL VIEW
          Stack(
            alignment:Alignment.bottomCenter,
            children: [
              Container(

                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 1.2,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color.fromARGB(184, 76, 175, 79),
                            width: 2.0, // Adjust the width as needed
                          ), 
                          color: (Colors.green)
                              .withOpacity(_current == entry.key ? 0.9 : 0)),
                    ),
                  );
                }).toList(),
              ),
            ]
          ),


          //TITLE 
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text("Planthings 2024", 
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(52, 168, 83, 1)
                ),
                ),// TITLE
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text("Organized by: Technological Institue of the Philippines - Manila",
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500
                  ),
                  )
                ),// Organizer
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Location 
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.location_city,
                                color: Colors.grey,
                              )
                            ),
                            TextSpan(
                              text: '     ',
                              style: TextStyle(color: Colors.transparent)
                            ),
                            TextSpan(
                              text: "Tanay, Rizal",
                              style: TextStyle(
                                color: Color.fromRGBO(52, 168, 83, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic
                              )
                            )
                          ]
                        )
                      
                      ),


                      //DATE
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.calendar_month,
                                color: Colors.grey,
                              )
                            ),
                            TextSpan(
                              text: '     ',
                              style: TextStyle(color: Colors.transparent)
                            ),
                            TextSpan(
                              text: "June 23, 2024",
                              style: TextStyle(
                                color: Color.fromRGBO(52, 168, 83, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic
                              )
                            )
                          ]
                        )
                      
                      ),
                      
                      
                    ],
                  )

                ),
                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  textAlign: TextAlign.justify,),
                ),


                //MAP HOlDER
                Padding(padding: EdgeInsets.symmetric(vertical: 10), 
                  child: Text("Location",
                    style: TextStyle(
                      color: Color.fromRGBO(52, 168, 83, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                ),


              ],
              )
            )

          ],
        )
      )
      
      
    );
  }
}


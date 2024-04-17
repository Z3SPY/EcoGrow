//import 'dart:ffi';
//import 'dart:js';

//import 'dart:js';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projectui/Pages/Forms/creat_acc.dart';
import 'package:projectui/Pages/Forms/login_page.dart';
import 'package:projectui/Pages/Forms/create_event.dart';
import 'package:projectui/Pages/Forms/Pickers/timepicker.dart';
import 'package:projectui/Pages/Forms/Pickers/datepicker.dart';


void main() {
  runApp(const MyAppPage());
}

//FIX THEME”
//MAKE MORE RESPONSIVE

class MyAppPage extends StatelessWidget {
  const MyAppPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CHANGE THIS LATER',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //CHANGE THIS
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        //HANDLES ROUTING
        routes: {
          '/Login' : (context) => const LoginPage(),
          '/CreateAccount':(context) => const CreateAccountPage(),
          '/CreateEvent':(context) => const CreateEventPage(),
          '/TimePicker':(context) => const TimePicker(),
          '/DatePicker':(context) => const DatePicker(),
          
        },
        home: Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/landing_back.png"),
                fit: BoxFit.cover,
              )),
              child: const HomeScreenStructure()),
        ));
  }
}

void loginClicked(BuildContext context) {
  print("Login Clicked");
  Navigator.pushNamed(context, '/CreateEvent');
}

void registerClicked(BuildContext context) {
  print("Register Clicked");
  Navigator.pushNamed(context, '/CreateAccount');
}

void googleClicked(BuildContext context) {
  print("Start OAUTH WINDOW");
  Navigator.pushNamed(context, '/TimePicker');
}

class HomeScreenStructure extends StatefulWidget {
  const HomeScreenStructure({super.key});


  @override
  State<HomeScreenStructure> createState() => _HomeScreenStructureState();
}

class _HomeScreenStructureState extends State<HomeScreenStructure> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Header
        Expanded(child: Container()),

        //Form
        //Submit
        Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                        5, 30, 0, 2), //NOTE MAKE THIS MORE RESPONSIVE
                    alignment: Alignment.center,
                    child: Image.asset('assets/logo.png'),
                  ),
                  const Text(
                    "Cultivating Change by the Students",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )
                ],
              ),
            )),

        //Footer
        Expanded(
            flex: 2,
            child: Column(
              children: [
                //SIGN IN BUTTON
                Container(
                  width: 335,
                  height: 50,
                  //DECORATION

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color.fromRGBO(0, 168, 89, 1),
                      width: 2,
                    ),
                    color: const Color.fromRGBO(0, 168, 89, 1),
                  ),

                  child: ElevatedButton(
                    onPressed: () {
                      loginClicked(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 168, 89,1), // Change the button's background color here
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                            color: Color.fromRGBO(0, 168, 89, 1), width: 2),
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      "Sign in with email",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ),
                //SIGN IN BUTTON END

                //DIVIDER
                Container(
                  width: 335,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      //LINE 1
                      Expanded(
                          child: Container(
                        height: 5,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.5, color: Colors.white))),
                      )),

                      //OR
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: const Text(
                          "or",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                            fontSize:
                                15, //ISSUE WITH FONT SIZE HERE NEED TO BE RESPONSIVE
                          ),
                        ),
                      ),

                      //LINE 2
                      Expanded(
                          child: Container(
                        height: 5,
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.5, color: Colors.white))),
                      ))
                    ],
                  ),
                ),
                //DIVIDER END

                //OAUTH
                Container(
                  width: 335,
                  height: 50,
                  //DECORATION

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    color: Colors.white,
                  ),

                  child: ElevatedButton(
                    onPressed: () {
                      googleClicked(context);
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset('assets/google.png'),
                          )),
                          const WidgetSpan(
                              child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 2),
                            child: Text(
                              "Continue with Google",
                              style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    15, //ISSUE WITH FONT SIZE HERE NEED TO BE RESPONSIVE
                              ),
                            ),
                          ))
                        ]),
                      ),
                    ),
                  ),
                ),
                //OAUTH END

                
              ],
            )),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),
              child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Log in',
                    style: const TextStyle(color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () { registerClicked(context); },
                  ),
                ],
                ),
              )
            )
                    
      ],
    );
  }
}

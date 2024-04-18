import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projectui/Pages/DashboardPages/Dashboard/mainDashboard.dart';
import 'package:projectui/Pages/Forms/creat_acc.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      routes: {
        "/MainPage": (context) => const mainDashboard(),
        "/MainPage": (context) => const mainDashboard(),
        "/Login" : (context) => const LoginPage(),
        "/CreateAccount":(context) => const CreateAccountPage()
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/forms_back.png"),
              fit: BoxFit.cover,
            )),
          child: const Form(),
        )

      )
    );
  }
}

// FUNCTIONS  
void LoginFunction(BuildContext context) {
  Navigator.pushNamed(context, "/MainPage");
}

void CreateAccountClick(BuildContext context) {
  print("Clicked Create Account");
}

// FUNCTIONS END 


// MAIN LOGIN FORM
class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [

        Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(0),
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

            Expanded(
              flex: 5,
              child:  Container(
                width: 340,
                padding: const EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromRGBO(52, 168, 83, 1),
                        Color.fromARGB(176, 255, 255, 255)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30)

                    //FORM CONTEN

                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                
                    //Title
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.green[700],
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    //Title END

                  
                    //Username
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        child: Column(children: [
                          //INNER FORM
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: const Text(
                              "Username",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          SizedBox(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Enter a search term',
                              ),
                            ),
                          )

                          //INNER FORM END
                        ])),
                    //Username END




                    //PASSWORD
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        child: Column(children: [
                          //INNER FORM
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: const Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          SizedBox(
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'Enter a search term',
                              ),
                            ),
                          )

                          //INNER FORM END
                        ])),
                    //PASSWORD END



                    //LOGIN BUTTON
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: Container(
                        width: 300,
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

                            //Should Check for Value then Login 
                            LoginFunction(context);


                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .white, // Change the button's background color here
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            "Login",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 168, 89, 1), fontSize: 17),
                          )),
                        ),
                      ),
                    )),

                    //LOGIN END

                    //Divider 
                    Container(
                      height: 24,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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

                        
                        ],
                      ),
                    ),
                    //Divider end



                    //OAUTH BUTTON
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        width: 300,
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
                            CreateAccountClick(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .white, // Change the button's background color here
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          WidgetSpan(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
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
                    )
                    ),

                    //OAUTH END
                    
              Center(child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Log in',
                    style: const TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () { 

                        Navigator.pushNamed(context, "/Login");
                        
                       },
                  ),
                ],
                ),
              )
            ))

                    
                  ],
                ),
              ),

        ),

        Expanded(child: Container())
            



      ],)
      
      
    );
  }
}
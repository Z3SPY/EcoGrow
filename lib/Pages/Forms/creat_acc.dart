import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/forms_back.png"),
              fit: BoxFit.cover,
            )),
            child: Form(),
          ),
        ));
  }
}

class Form extends StatefulWidget {
  @override
  State<Form> createState() => _FormState();
}

void CreateAccountClick(BuildContext context) {
  print("Clicked Create Account");
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 340,
        height: 600,
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
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: Colors.green[700],
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )),

            //Name of School
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Column(children: [
                  //INNER FORM
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Text(
                      "Name Of School",
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
            //NAME OF SCHOOL END

            //Name
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Column(children: [
                  //INNER FORM
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Text(
                      "Name Of School",
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

            //NAME END

            //Email
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Column(children: [
                  //INNER FORM
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Text(
                      "Name Of School",
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
            //EMAIL END

            //PASSWORD
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Column(children: [
                  //INNER FORM
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: const Text(
                      "Name Of School",
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

            //CREATE ACCOUNT
            Center(
                child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  child: const Center(
                      child: Text(
                    "Create Account",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 168, 89, 1), fontSize: 17),
                  )),
                ),
              ),
            ))

            //CREATE ACCOUNT END
          ],
        ),
      ),
    );
  }
}

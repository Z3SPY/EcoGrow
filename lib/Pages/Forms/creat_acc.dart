import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projectui/Pages/Forms/login_page.dart';
import 'package:projectui/Pages/Forms/user_auth_implmentation/firebase_auth_services.dart';
import 'package:projectui/main.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
          '/Login' : (context) => const LoginPage(),
          '/Main':(context) => const MyAppPage(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/forms_back.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height + 300,
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
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
                        ),
                  
                  FormWidget(),

                  SizedBox(height: 200,)
              ],)
              
            ),
          )
          


        ),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get schoolName => schoolNameController.text;
  set schoolName(String value) => schoolNameController.text = value;

  String get username => usernameController.text;
  set username(String value) => usernameController.text = value;

  String get email => emailController.text;
  set email(String value) => emailController.text = value;

  String get password => passwordController.text;
  set password(String value) => passwordController.text = value;


  @override
  void dispose() {
    schoolNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void createAccountClick(BuildContext context) {
    _signUp(context);
  }

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
          borderRadius: BorderRadius.circular(30),
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Name of School
            TextFormFieldWidget(
              labelText: "Name of School",
              controller: schoolNameController,
              hintText: "Enter name of school",
            ),

            // Username
            TextFormFieldWidget(
              labelText: "Username",
              controller: usernameController,
              hintText: "Enter username",
            ),

            // Email
            TextFormFieldWidget(
              labelText: "Email",
              controller: emailController,
              hintText: "Enter email",
            ),

            // Password
            TextFormFieldWidget(
              labelText: "Password",
              controller: passwordController,
              hintText: "Enter password",
              obscureText: true,
            ),

            // CREATE ACCOUNT Button
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  width: 300,
                  height: 50,
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
                      createAccountClick(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 168, 89, 1),
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    
  }

  void _signUp(BuildContext context) async {
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signUp(email, password);


    if (user != null ){
      print("User Is Successfully Created");

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('User is successfully created.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Main');
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to create user.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  } 

}

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const TextFormFieldWidget({
    required this.labelText,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              labelText,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }


  

}

import 'package:flutter/material.dart';



class schoolOrgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(children: [

        Row(
          children: [
            Image.asset(
              'assets/school_logo.png',
              width: 300, // adjust width as needed
              height: 300, // adjust height as needed
            ),            
            Container(
              child: Column(children: [
                Text("Technological Institute of the Philippines"), //Title
                Text("Population Count: 1000"), //Title
                Text("Number of Events: 605") //Title

              ],),

            )
          ]
        )

      ],),
    );
  }

}
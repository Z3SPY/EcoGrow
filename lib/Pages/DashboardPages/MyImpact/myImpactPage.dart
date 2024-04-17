import "package:flutter/material.dart";


class impactComp extends StatefulWidget {
  @override
  State<impactComp> createState() => _impactCompState();
}

class _impactCompState extends State<impactComp> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.red,
      )
    ],);
    
    
  }
}
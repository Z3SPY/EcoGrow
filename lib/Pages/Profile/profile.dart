import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empty Page'),
      ),
      body: Center(
        child: Text(
          'Empty Page Content',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
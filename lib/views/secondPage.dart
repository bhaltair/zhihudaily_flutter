import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => new SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('界面2'),
      ),
      body: new Center(
        child: new Image.asset('images/logo.png', width: 600.0, height: 240.0, fit: BoxFit.cover,)
      )
    );
  }
}
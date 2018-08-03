import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('detail'),
      ),
      body: new Container(
      child: new Center(
        child: new Text('data'),
      ),
    )
    );
  }
}
import 'package:flutter/material.dart';
import '../components/list.dart';

class FirstPage extends StatefulWidget {

  // 页面传参数 data
  final String data;
  const FirstPage({ Key key , this.data}) : super(key: key);

  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text('今日热点'),
      ),
      body: new Container(
        // 使用参数值，需在参数名前增加widget前缀
        // child: new Text(widget.data)
        child: new List2()
      )
    );
  }
}
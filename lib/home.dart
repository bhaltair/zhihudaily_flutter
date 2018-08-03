import 'package:flutter/material.dart';
import './views/firstPage.dart';
// import './views/secondPage.dart';
// import './views/thirdPage.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() =>  new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 3
    );
  }
  
  // TODO 
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new FirstPage(data: '我是参数233')
    );
  }
}
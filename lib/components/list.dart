import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class List2 extends StatefulWidget {
  @override
  ListState createState() => new ListState();
}

class ListState extends State<List2> {
  var values;

  Future getCategories() async {
    final url = 'https://news-at.zhihu.com/api/4/news/latest';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body)['stories'];
    } else {
      throw Exception('Failed to load categories');
    }
  }

  //新闻列表单个item
  Widget _newsRow(newsInfo) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Container(
              child: new ListTile(
                title: new Text(
                  newsInfo["title"],
                  textScaleFactor: 1.5,
                ),
              ),
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          values = snapshot.data;
          return new ListView.builder(
              itemCount: values.length,
              itemBuilder: (context, index) {
                var item = values[index];
                return _newsRow(item);
              });
        } else if (snapshot.hasError) {
          return Text("error1>>>>>>>>>>>>>>>:${snapshot.error}");
        }
        return new Container(
          color: new Color.fromRGBO(244, 245, 245, 1.0),
        );
      },
    );
  }
}

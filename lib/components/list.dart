import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

import '../views/detailPage.dart';

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
      child: new Row(
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Text(
                newsInfo["title"],
                textScaleFactor: 1.5,
                style: new TextStyle(color: Colors.black, fontSize: 11.0),
              ),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.all(6.0),
            child: new Container(
                width: 100.0,
                height: 80.0,
                child: CachedNetworkImage(
                  imageUrl: newsInfo["images"][0],
                )),
          )
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
          // print(snapshot.data);
          values = snapshot.data;
          return new ListView.builder(
              itemCount: values.length,
              itemBuilder: (context, index) {
                var item = values[index];
                return new InkWell(
                  child: _newsRow(item),
                  onTap: () {
                    // Navigator.of(context).pushNamed("/webview");
                    Navigator.of(context).push(new MaterialPageRoute(
                      builder: (ctx) => new DetailPage(id: item['id'])
                    ));
                  },
                );
              });
        } else if (snapshot.hasError) {
          return Text("error1>>>>>>>>>>>>>>>:${snapshot.error}");
        }
        return new Container(
            color: new Color.fromRGBO(244, 245, 245, 1.0),
            child: new Center(
              // CircularProgressIndicator是一个圆形的Loading进度条
              child: new CircularProgressIndicator(),
            ));
      },
    );
  }
}

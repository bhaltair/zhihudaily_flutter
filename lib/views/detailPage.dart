import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_html_view/flutter_html_view.dart';

class DetailPage extends StatefulWidget {
  final num id;
  const DetailPage({Key key, this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  var html2;

  Future _get() async {
    var responseBody;
    var url = 'https://news-at.zhihu.com/api/4/news/${widget.id}';
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    if (response.statusCode == 200) {
      responseBody = await response.transform(utf8.decoder).join();
      responseBody = json.decode(responseBody);
      return responseBody;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: _get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          html2 = snapshot.data;
          return new Scaffold(
              appBar: new AppBar(
                title: new Text(html2['title']),
              ),
              body: new SingleChildScrollView(
                child: new Center(
                  // FIXIT 为什么渲染的html多拷贝了一份？
                  // child: new HtmlView(data: html2),
                  child: new Text(html2['body']),
                ),
              ));
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

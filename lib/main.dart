import 'package:flutter/material.dart';
import './home.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(new MaterialApp(
    title: 'My app',
    // home: new MyScaffold(),
    home: new MyHomePage(),
    routes: {
      "/webview": (_) => new WebviewScaffold(
            url: "https://www.baidu.com",
            appBar: new AppBar(
              title: new Text("Widget webview"),
            ),
          )
    },
  ));
}

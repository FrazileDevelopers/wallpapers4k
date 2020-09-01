import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url =
      "https://api.pexels.com/v1/search?query=girls&per_page=80&page=1";
  String m;

  fetchapi() async {
    var res = await http.get(url, headers: {
      "Authorization":
          "563492ad6f917000010000011caaf6716a94499792b5de8e53ab375d"
    });
    setState(() {
      m = res.body;
    });
    var decoded = jsonDecode(res.body);
    print(decoded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Text(url),
        ));
  }
}
/* mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello Mink,',
            ),
            Text(url),
          ],*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Articleview extends StatefulWidget {

  final String blogurl;
  Articleview({this.blogurl});

  @override
  _ArticleviewState createState() => _ArticleviewState();
}

class _ArticleviewState extends State<Articleview> {

  final Completer<WebViewController> completer=Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: <Widget>[
            Text(
              'News',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Time',
              style: TextStyle(
                  color: Colors.blue.shade700,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebView(
          initialUrl: widget.blogurl,
          onWebViewCreated: (WebViewController webViewController){
            completer.complete(webViewController);
          },
        ),
      ),
    );
  }
}

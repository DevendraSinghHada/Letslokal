import 'dart:io';

import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview_tips extends StatefulWidget {
  final String title;
  final String url;
  const webview_tips({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  State<webview_tips> createState() => _webview_tipsState();
}

class _webview_tipsState extends State<webview_tips> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: AppBar(
        backgroundColor: kBlackColor,
        title: Text(widget.title),
      ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}

import 'dart:io';

import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Ranking extends StatefulWidget {
  final String url;
  const Ranking({Key? key, required this.url}) : super(key: key);

  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
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
      appBar: myAppBar(context, true),
      // appBar: AppBar(
      //   backgroundColor: kBlackColor,
      //   title: Text(widget.title),
      // ),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}

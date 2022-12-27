import 'dart:io';

import 'package:flutter/material.dart';
import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsWeb extends StatefulWidget {
  const TermsWeb({super.key});

  @override
  State<TermsWeb> createState() => _TermsWebState();
}

class _TermsWebState extends State<TermsWeb> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {

      WebView.platform = SurfaceAndroidWebView();
      
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, true),

      body:const WebView(initialUrl: "https://www.letslokal.com/terms-and-conditions/",),
    );
  }
}
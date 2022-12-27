import 'dart:io';

import 'package:flutter/material.dart';
import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyWeb extends StatefulWidget {
  const PrivacyWeb({super.key});

  @override
  State<PrivacyWeb> createState() => _PrivacyWebState();
}

class _PrivacyWebState extends State<PrivacyWeb> {

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

      body:const WebView(initialUrl: "https://www.letslokal.com/privacy-policy/",),
    );
  }
}
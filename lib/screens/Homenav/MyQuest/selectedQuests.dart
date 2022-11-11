import 'dart:io';

import 'package:flutter/material.dart';
import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SelectedQuest extends StatefulWidget {
  final String url;
  const SelectedQuest({super.key, required this.url});

  @override
  State<SelectedQuest> createState() => _SelectedQuestState();
}

class _SelectedQuestState extends State<SelectedQuest> {
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
      appBar: myAppBar(context, true),
      body: WebView(
        initialUrl: widget.url,
      ),
    );
  }
}

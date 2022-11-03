import 'package:flutter/material.dart';

pushTo(BuildContext context, Widget name) async {
  return await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => name),
  );
}

void replaceRoute(BuildContext context, Widget name) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => name));
}

pushName(BuildContext context, String route) {
  return Navigator.pushNamed(context, route);
}

void pushNdRemove(BuildContext context, Widget name) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => name),
      (Route<dynamic> route) => false);
}

import 'package:flutter/material.dart';

import '../utils/constant/screennavigation.dart';
import '../utils/styleguide/colors..dart';
import '../utils/styleguide/textstyle.dart';

// CheckCircle used in delete account button in account.dart file

Container checkCircle() {
  bool isSelect = false;
  return Container(
    height: 18,
    width: 18,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kWhiteColor,
        border:
            Border.all(color: isSelect ? kblueColor : kBlackColor, width: 2)),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: CircleAvatar(
          backgroundColor: isSelect ? kblueColor : kWhiteColor,
        ),
      ),
    ),
  );
}

// dot used in drawer mainn in expansion tile
Container dotCircle(BuildContext context) {
  return Container(
    height: hm * 0.003,
    width: wm * 0.02,
    decoration: BoxDecoration(
        color: kWhiteColor.withOpacity(0.50), shape: BoxShape.circle),
  );
}

// Reusable expansion row in drawer main
Row ExpansionRow(BuildContext context, String text, Widget name) {
  return Row(
    children: [
      dotCircle(context),
      SizedBox(
        width: wm * 0.07,
      ),
      InkWell(
        onTap: () {
          pushTo(context, name);
          //  Navigator.push(context, MaterialPageRoute(builder: (context) => HowtoJoine()));
        },
        child: Text(
          text,
          style: subtitatb.copyWith(fontSize: 18),
        ),
      ),
    ],
  );
}

// InputDecoration for textformfield except password textformfield
InputDecoration txtffDec() {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(10),
    focusColor: kWhiteColor,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: ktextfildecolor, width: 2.0),
      borderRadius: BorderRadius.circular(4),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: ktextfildecolor, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: ktextfildecolor, width: 2.0),
    ),
  );
}

// snackbar
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackbr(
    BuildContext context, String txt, Color bgColor) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(txt),
    backgroundColor: bgColor,
  ));
}

const circleloader = Center(
  child: CircularProgressIndicator.adaptive(),
);

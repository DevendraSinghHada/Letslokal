import 'package:flutter/material.dart';
import 'package:letslokal/main.dart';
import 'package:letslokal/screens/OnBoarding/login-screen.dart';
import 'package:letslokal/utils/dftbutton.dart';
import '../utils/constant/screennavigation.dart';
import '../utils/preference.dart';
import '../utils/styleguide/colors..dart';
import '../utils/styleguide/textstyle.dart';

// CheckCircle used in delete account button in account.dart file
Container checkCircle() {
  
  return Container(
    height: 18,
    width: 18,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kWhiteColor,
        border:
            // ignore: dead_code
            Border.all(color: isSelect ? kblueColor : kBlackColor, width: 2)),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: CircleAvatar(
          // ignore: dead_code
          backgroundColor: isSelect ? kblueColor : kbttnColor,
        ),
      ),
    ),
  );
}

// dot used in drawer main in expansion tile
Container dotCircle(BuildContext context) {
  return Container(
    height: hm * 0.003,
    width: wm * 0.02,
    decoration: BoxDecoration(
        color: kWhiteColor.withOpacity(0.50), shape: BoxShape.circle),
  );
}

// Reusable expansion row in drawer main
Row expansionRow(BuildContext context, String text, Widget name) {
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


// Loader for making user wait while loading data
const circleloader = Center(
  child: CircularProgressIndicator.adaptive(),
);

// log in pop showing when user is not logged inn
loginDialogue(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: EdgeInsets.all(wm * 0.04),
          backgroundColor: kWhiteColor,
          title: Center(
              child: Text(
            "Log in first to continue",
            style: reasonStyle,
          )),
          children: [
            Padding(
              padding: EdgeInsets.only(left: wm * 0.05, right: wm * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DefaultEButton(
                    width: wm * 0.18,

                    height: hm * 0.05,
                    //  hm * 0.05,
                    radius: 8,
                    press: () {
                      pushTo(context, const LoginPage());
                    },
                    color: kcolorlogin,
                    child: FittedBox(
                      child: Text(
                        "Log In ",
                        style: textW,
                      ),
                    ),
                  ),
                  DefaultOutButton(
                      width: wm * 0.18,
                      fontSize: 14,
                      RadiusClr: kcolorlogin,
                      height: hm * 0.05,
                      text: "Later",
                      radius: 8,
                      press: () {
                        Navigator.pop(context);
                      },
                      textClr: kcolorlogin,
                      color: ktextfildecolor)
                ],
              ),
            ),
          ],
        );
      });
}

// loginpop : used to show while user is a guest user then log in first to continue
SizedBox logInPopUp(BuildContext context) {
  return SizedBox(
    child: Center(
        child: Container(
      height: hm * 0.2,
      width: wm * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ktextfildecolor,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            "Please login to continue",
            style: textW.copyWith(fontSize: 18),
          ),
        ),
        SizedBox(
          height: hm * 0.02,
        ),
        DefaultEButton(
          width: wm * 0.2,
          height: hm * 0.05,
          radius: 8,
          press: () {
            pushTo(context, const LoginPage());
          },
          color: kcolorlogin,
          child: Text(
            "Log in ",
            style: textW,
          ),
        ),
      ]),
    )),
  );
}

// logout Dialog
logOut(BuildContext context, StateSetter setState) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ktextfildecolor,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultEButton(
                width: wm * 0.2,
                height: hm * 0.05,
                radius: 8,
                press: () {
                  isNewUser = true;
                  String remName, remPass;
                  bool checkBoxClicked;

                  checkBoxClicked =
                      Preference.pref.getBool("CheckboxClicked") ?? false;
                  remName = Preference.pref.getString("RememberName") ?? "";
                  remPass = Preference.pref.getString("RememberPass") ?? "";

                  Preference.pref.clear();

                  Preference.pref.setString("RememberedName", remName);
                  Preference.pref.setString("RememberedPass", remPass);
                  Preference.pref.setBool("ClickedCheckbox", checkBoxClicked);

                  pushNdRemove(context, const LoginPage());
                  setState(() {});
                },
                color: kcolorlogin,
                child: Text(
                  "Yes",
                  style: textW,
                ),
              ),
              DefaultOutButton(
                  width: wm * 0.2,
                  fontSize: 14,
                  RadiusClr: kcolorlogin,
                  height: hm * 0.05,
                  text: "No",
                  radius: 8,
                  press: () {
                    Navigator.pop(context);
                  },
                  textClr: kcolorlogin,
                  color: ktextfildecolor)
            ],
          ),
          title: Center(
            child: Text(
              "Are you sure you want to logout?",
              style: ffText,
            ),
          ),
        );
      });
}

import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/dfttextformfield.dart';

import 'package:flutter/material.dart';

import '../../../../utils/styleguide/textstyle.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, true),
      backgroundColor: kBlackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: wm * 0.03, top: hm * 0.02, right: wm * 0.03),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                CircleAvatar(
                  minRadius: hm * 0.08,
                  backgroundColor: kWhiteColor,
                  child: CircleAvatar(
                    minRadius: hm * 0.075,
                    child: const Icon(
                      Icons.camera_alt,
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: hm * 0.02,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: wm * 0.9,
                  decoration: BoxDecoration(
                      color: kcolorsubblack,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: kWhiteColor.withOpacity(0.20),
                            spreadRadius: 2,
                            blurRadius: 4)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 2, bottom: hm * 0.03),
                        child: Text(
                            'These fields can only be edited from account section ',
                            style: ffText),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, bottom: hm * 0.01),
                        child: Text('Display Name', style: ffText),
                      ),
                      Dfttextformfield(
                        iniValue: Preference.pref.getString("name") ?? "",
                        fillcolor: ktextfildecolor,
                        focuscolor: ktextfildecolor,
                        outbordercolor: ktextfildecolor,
                        borderradius: hm * 0.010,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2, top: hm * 0.015, bottom: hm * 0.01),
                        child: Text('username', style: ffText),
                      ),
                      Dfttextformfield(
                        iniValue: Preference.pref.getString("username") ?? "",
                        fillcolor: ktextfildecolor,
                        focuscolor: ktextfildecolor,
                        outbordercolor: ktextfildecolor,
                        borderradius: hm * 0.010,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2, top: hm * 0.015, bottom: hm * 0.01),
                        child: Text('Email address', style: ffText),
                      ),
                      Dfttextformfield(
                        iniValue: Preference.pref.getString("email") ?? "",
                        fillcolor: ktextfildecolor,
                        focuscolor: ktextfildecolor,
                        outbordercolor: ktextfildecolor,
                        borderradius: hm * 0.010,
                      ),
                      SizedBox(
                        height: hm * 0.01,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: hm * 0.02,
                ),
                Container(
                  alignment: Alignment.center,
                  height: hm * 0.05,
                  width: wm * 0.9,
                  decoration: BoxDecoration(
                      color: kcolorsubblack,
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        BoxShadow(
                            color: kWhiteColor.withOpacity(0.20),
                            spreadRadius: 2,
                            blurRadius: 4)
                      ]),
                  child: Center(
                    child: Text('Social media accounts',
                        style: ffText.copyWith(fontSize: 24)),
                  ),
                ),
                SizedBox(
                  height: hm * 0.02,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: wm * 0.9,
                  decoration: BoxDecoration(
                      color: kcolorsubblack,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: kWhiteColor.withOpacity(0.20),
                            spreadRadius: 2,
                            blurRadius: 4)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2, top: hm * 0.015, bottom: hm * 0.01),
                        child: Text('instagram', style: ffText),
                      ),
                      SocialMediaField(
                        fillcolor: ktextfildecolor,
                        focuscolor: ktextfildecolor,
                        outbordercolor: ktextfildecolor,
                        borderradius: hm * 0.010,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2, top: hm * 0.015, bottom: hm * 0.01),
                        child: Text('twitter', style: ffText),
                      ),
                      SocialMediaField(
                        fillcolor: ktextfildecolor,
                        focuscolor: ktextfildecolor,
                        outbordercolor: ktextfildecolor,
                        borderradius: hm * 0.010,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2, top: hm * 0.015, bottom: hm * 0.01),
                        child: Text('facebook', style: ffText),
                      ),
                      SocialMediaField(
                        fillcolor: ktextfildecolor,
                        focuscolor: ktextfildecolor,
                        outbordercolor: ktextfildecolor,
                        borderradius: hm * 0.010,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 2, top: hm * 0.015, bottom: hm * 0.01),
                        child: Text('tiktok', style: ffText),
                      ),
                      SocialMediaField(
                        fillcolor: ktextfildecolor,
                        focuscolor: ktextfildecolor,
                        outbordercolor: ktextfildecolor,
                        borderradius: hm * 0.010,
                      ),
                      SizedBox(
                        height: hm * 0.01,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: hm * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: wm * 0.35,
                      height: hm * 0.07,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: kWhiteColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Change password",
                          style: TextStyle(
                            fontSize: hm * 0.019,
                            color: kWhiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: wm * 0.35,
                      height: hm * 0.07,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          // primary: kbttnColor,
                          backgroundColor: kbttnColor,
                          side: const BorderSide(color: kbttnColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Save Changes",
                          style: TextStyle(
                              fontSize: hm * 0.019, color: kWhiteColor),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: hm * 0.02,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

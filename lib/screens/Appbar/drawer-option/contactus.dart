import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:letslokal/utils/dfttextformfield.dart';
import 'package:flutter/material.dart';

import '../../../utils/styleguide/textstyle.dart';

class Contactus extends StatefulWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  State<Contactus> createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    Size = MediaQuery.of(context).size;
    hm = Size.height;
    wm = Size.width;
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: hm * 0.03, right: wm * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text(
                'Say Anything',
                style: title.copyWith(fontSize: 30),
              )),
              SizedBox(
                height: hm * 0.01,
              ),
              Center(
                  child: Text(
                'We would love to hear from you',
                style: subtital,
              )),
              SizedBox(
                height: hm * 0.08,
              ),
              Text(
                'Name',
                style: subtital,
              ),
              SizedBox(
                height: hm * 0.01,
              ),
              Dfttextformfieldborder(
                maxline: 1,
                size: hm * 0.001,
                borderradius: 2,
                fillcolor: kBlackColor,
                focuscolor: ktextfildecolor,
                outbordercolor: ktextfildecolor,
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Text(
                'Email',
                style: subtital,
              ),
              SizedBox(
                height: hm * 0.01,
              ),
              Dfttextformfieldborder(
                maxline: 1,
                size: hm * 0.01,
                borderradius: 2,
                fillcolor: kBlackColor,
                focuscolor: ktextfildecolor,
                outbordercolor: ktextfildecolor,
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Text(
                'Topic',
                style: subtital,
              ),
              SizedBox(
                height: hm * 0.01,
              ),
              Dfttextformfieldborder(
                maxline: 1,
                size: hm * 0.01,
                borderradius: 2,
                fillcolor: kBlackColor,
                focuscolor: ktextfildecolor,
                outbordercolor: ktextfildecolor,
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Text(
                'Message',
                style: subtital,
              ),
              SizedBox(
                height: hm * 0.01,
              ),
              Dfttextformfieldborder(
                maxline: 7,
                size: hm * 0.01,
                borderradius: 2,
                fillcolor: kBlackColor,
                focuscolor: ktextfildecolor,
                outbordercolor: ktextfildecolor,
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              DftButton(
                  width: wm * 0.02,
                  height: hm * 0.015,
                  text: "Send",
                  color: kcolorlogin,
                  textcolor: kWhiteColor,
                  press: () {},
                  radius: hm * 0.01),
              SizedBox(
                height: hm * 0.1,
              ),
              const Center(
                  child: Icon(
                Icons.mail,
                color: kWhiteColor,
              )),
              Center(
                  child: Text(
                'contact@letslokal.com',
                style: subtitatb,
              )),
              SizedBox(
                height: hm * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

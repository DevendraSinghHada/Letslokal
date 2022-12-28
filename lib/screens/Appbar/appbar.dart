import 'package:letslokal/main.dart';
import 'package:letslokal/screens/Homenav/Profile/profile.dart';
import 'package:letslokal/screens/OnBoarding/login-screen.dart';

import 'package:letslokal/utils/constant/images.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:flutter/material.dart';

import '../../utils/styleguide/colors..dart';
import '../../utils/styleguide/textstyle.dart';
import 'cart.dart';
import 'drawer-option/drawermaiin.dart';

AppBar myAppBar(BuildContext context, bool isBack,[Key? key, bool isInProfile=true , bool isINCart = true]) {
  Size = MediaQuery.of(context).size;
  hm = Size.height;
  wm = Size.width;
  return AppBar(
    key: key,
    automaticallyImplyLeading: isBack ? true : false,
    backgroundColor: kBlackColor,
    leadingWidth: hm * 0.046,
    elevation: 0,

    title: Image.asset(
      logoLetsLokal,
      height: hm * 0.046,
    ),

    // leading: Image.asset('assets/image-png/logolokal.png',),
    actions: [
      Container(
        height: hm * 025,

        margin: const EdgeInsets.all(11),
        // padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ktextfildecolor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4),
                child: isNewUser
                    ? TextButton(
                        child: Center(
                            child: Text(
                          "LOGIN",
                          style: textW,
                          textAlign: TextAlign.center,
                        )),
                        onPressed: () {
                          pushTo(context, const LoginPage());
                        },
                      )
                    : TextButton(
                        child: Text(Preference.pref.getString("username") ?? "",
                            style: textW),
                        onPressed: () {
                          if (isInProfile) {
  pushTo(context, const Profile());
}
                        },
                      ))),
      ),
      //  InkWell(
      //     onTap: () {
      //       Navigator.push(
      //           context, MaterialPageRoute(builder: (context) => Cart()));
      //     },
      //     child: Container(
      //       margin: EdgeInsets.all(11),
      //       width: wm * 0.10,
      //       decoration: BoxDecoration(
      //         color: ktextfildecolor,
      //         borderRadius: BorderRadius.circular(8),
      //       ),
      //       child: Icon(Icons.shopping_bag_outlined),
      //     ),
      //   ),
      Container(
        margin: const EdgeInsets.only(top: 11, bottom: 11),
        width: wm * 0.10,
        decoration: BoxDecoration(
          color: ktextfildecolor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: InkWell(
            onTap: () {
               if (isINCart) {
  pushTo(context, const Cart());
}
            },
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: kWhiteColor,
            ),
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.all(10),
        height: hm * 0.02,
        width: wm * 0.11,
        decoration: BoxDecoration(
          color: ktextfildecolor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
            child: const Center(child: Icon(Icons.menu, color: kWhiteColor)),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                        height: hm * 0.8, child: const Drawermain());
                  });
            }),
      ),
      SizedBox(
        width: wm * 0.02,
      )
    ],
  );
}

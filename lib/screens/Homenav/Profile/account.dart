import 'package:letslokal/main.dart';
import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/screens/Appbar/cart.dart';
import 'package:letslokal/screens/Homenav/Profile/account/details.dart';
import 'package:letslokal/screens/Homenav/Profile/account/orders.dart';
import 'package:letslokal/screens/Homenav/Profile/profile.dart';
import 'package:letslokal/screens/Homenav/Profile/account/viewOrder.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/screens/OnBoarding/login-screen.dart';
import 'package:letslokal/utils/constant/images.dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:flutter/material.dart';

import '../../../utils/constant/screennavigation.dart';
import '../../../utils/styleguide/textstyle.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  int index = 1;

  @override
  void initState() {
    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, false),
      body: isNewUser
          ? logInPopUp()
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(wm * 0.05),
                child: Column(children: [
                  Container(
                    height: hm * 0.21,
                    decoration: BoxDecoration(
                      color: ktextfildecolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Account",
                            style: textW.copyWith(
                                fontSize: 34, fontFamily: "balooBhai2"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: hm * 0.04, bottom: hm * 0.04),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DefaulatOBtn(
                                    fontSize: 12,
                                    text: "Profile",
                                    width: wm * 0.2,
                                    RadiusClr: kWhiteColor.withOpacity(0.1),
                                    height: hm * 0.045,
                                    radius: 10,
                                    press: () {
                                      pushTo(context, const Profile());
                                    },
                                    textClr: kWhiteColor,
                                    color: kBlackColor.withOpacity(0.1)),
                                DefaulatOBtn(
                                    fontSize: 12,
                                    text: "MyQuest",
                                    width: wm * 0.21,
                                    RadiusClr: kWhiteColor.withOpacity(0.1),
                                    height: hm * 0.045,
                                    radius: 10,
                                    press: () {
                                      pushTo(
                                          context,
                                          HomeNav(
                                            selectindex: 3,
                                          ));
                                    },
                                    textClr: kWhiteColor,
                                    color: kBlackColor.withOpacity(0.1)),
                                DefaulatOBtn(
                                    fontSize: 12,
                                    text: "Wishlist",
                                    width: wm * 0.2,
                                    RadiusClr: kWhiteColor.withOpacity(0.1),
                                    height: hm * 0.045,
                                    radius: 10,
                                    press: () {
                                      pushTo(
                                          context,
                                          HomeNav(
                                            selectindex: 2,
                                          ));
                                    },
                                    textClr: kWhiteColor,
                                    color: kBlackColor.withOpacity(0.1)),
                                DefaulatOBtn(
                                    fontSize: 12,
                                    text: "Cart",
                                    width: wm * 0.2,
                                    RadiusClr: kWhiteColor.withOpacity(0.1),
                                    height: hm * 0.045,
                                    radius: 10,
                                    press: () {
                                      pushTo(context, const Cart());
                                    },
                                    textClr: kWhiteColor,
                                    color: kBlackColor.withOpacity(0.1))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: hm * 0.04,
                  ),
                  Container(
                    width: double.infinity,
                    // height: hm * 0.4,
                    decoration: BoxDecoration(
                      color: ktextfildecolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(wm * 0.045),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Preference.pref.getString("name") ?? "",
                            style: textAcc,
                          ),
                          SizedBox(
                            height: hm * 0.01,
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              setState(() {
                                index = 0;
                                isOrder = true;
                              });
                            },
                            leading: Image.asset(
                              shoppingBag,
                              height: hm * 0.032,
                              color: kWhiteColor,
                            ),
                            //  const Icon(
                            //   Icons.shopping_bag,
                            //   color: kWhiteColor,
                            //   size: 26,
                            // ),
                            title: Text(
                              "Orders",
                              style: textAcc,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              setState(() {
                                index = 1;

                                print(index);
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                            leading: const Icon(Icons.person,
                                color: kWhiteColor, size: 26),
                            title: Text("Account details", style: textAcc),
                          ),
                          ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () {
                                setState(() {
                                  logOut();
                                });
                                // SharedPreferences pref =
                                //     await SharedPreferences.getInstance();
                                // await pref.clear();
                              },
                              leading: const Icon(Icons.logout,
                                  color: kWhiteColor, size: 26),
                              title: Text(
                                "Logout",
                                style: textAcc,
                              )),
                        ],
                      ),
                    ),
                  ),

                  index == 0
                      ? isOrder == true
                          ? const Orders()
                          : const viewOrder()
                      : const details()

                  // : index == 1
                  //     ? orders()
                  //     : logout()
                ]),
              ),
            ),
    );
  }

// logout Dialog
  logOut() {
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
                    String RemName, RemPass;
                    bool CheckBoxClicked;

                    CheckBoxClicked =
                        Preference.pref.getBool("CheckboxClicked") ?? false;
                    RemName = Preference.pref.getString("RememberName") ?? "";
                    RemPass = Preference.pref.getString("RememberPass") ?? "";

                    Preference.pref.clear();

                    Preference.pref.setString("RememberedName", RemName);
                    Preference.pref.setString("RememberedPass", RemPass);
                    Preference.pref.setBool("ClickedCheckbox", CheckBoxClicked);

                    pushNdRemove(context, const LoginPage());
                    setState(() {});
                  },
                  color: kcolorlogin,
                  child: Text(
                    "Yes",
                    style: textW,
                  ),
                ),
                DefaulatOBtn(
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

  Container logInPopUp() {
    return Container(
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
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return SimpleDialog(
    //         contentPadding: EdgeInsets.zero,
    //         backgroundColor: ktextfildecolor,
    //         title: Text("Log in first to continue"),
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(left: 8.0, right: 8),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 DefaultEButton(
    //                   width: 80,
    //                   //  wm * 0.2,
    //                   height: 40,
    //                   //  hm * 0.05,
    //                   radius: 8,
    //                   press: () {
    //                     pushTo(context, LoginPage());
    //                   },
    //                   color: kcolorlogin,
    //                   child: Text(
    //                     "Log In ",
    //                     style: textW,
    //                   ),
    //                 ),
    //                 DefaulatOBtn(
    //                     width: 80,
    //                     // wm * 0.2,
    //                     fontSize: 14,
    //                     RadiusClr: kcolorlogin,
    //                     height: 40,
    //                     //  hm * 0.05,
    //                     text: "No",
    //                     radius: 8,
    //                     press: () {},
    //                     textClr: kcolorlogin,
    //                     color: ktextfildecolor)
    //               ],
    //             ),
    //           ),
    //         ],
    //       );
    //     });
  }
}

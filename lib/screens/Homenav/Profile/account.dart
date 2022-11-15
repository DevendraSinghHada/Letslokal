import 'package:letslokal/main.dart';
import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/screens/Appbar/cart.dart';
import 'package:letslokal/screens/Homenav/Profile/account/delete.dart';
import 'package:letslokal/screens/Homenav/Profile/account/details.dart';
import 'package:letslokal/screens/Homenav/Profile/profile.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/utils/constant/images.dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:flutter/material.dart';

import '../../../components/components.dart';
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
    // isOrder = false;

    super.initState();
  }

  callBack() {
    setState(() {
      isOrder = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, false),
      body: isNewUser
          ? logInPopUp(context)
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
                                DefaultOutButton(
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
                                DefaultOutButton(
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
                                DefaultOutButton(
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
                                DefaultOutButton(
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
                                  logOut(context, setState);
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
                          ? orders()
                          : viewOrders(context)
                      : const Details()

                  // : index == 1
                  //     ? orders()
                  //     : logout()
                ]),
              ),
            ),
    );
  }

// orders class
  SizedBox orders() {
    return SizedBox(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: hm * 0.06, bottom: hm * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order:",
                style: ffText.copyWith(fontSize: 14),
              ),
              Text(
                "#37765",
                style: ffText.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: hm * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date:",
                style: ffText.copyWith(fontSize: 14),
              ),
              Text(
                "24 August 2022",
                style: ffText.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: hm * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "status:",
                style: ffText.copyWith(fontSize: 14),
              ),
              Text(
                "Completed",
                style: ffText.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: hm * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Task:",
                style: ffText.copyWith(fontSize: 14),
              ),
              Text(
                "\$0.00 for 1 item",
                style: ffText.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: hm * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Actions:",
                style: ffText.copyWith(fontSize: 14),
              ),
              DefaultEButton(
                width: wm * 0.18,
                height: hm * 0.06,
                radius: 12,
                press: () {
                  setState(() {
                    isOrder = false;
                  });

                  print("view $isOrder");
                },
                color: kbttnColor,
                child: Text(
                  "View",
                  style: title,
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }

// view orders
  Column viewOrders(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: hm * 0.04),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(text: "Order ", style: textW),
              TextSpan(text: "£37765 ", style: ffText),
              TextSpan(text: "was placed on ", style: textW),
              TextSpan(text: "24 August 2022 ", style: ffText),
              TextSpan(text: "and is currently ", style: textW),
              TextSpan(text: "Completed. ", style: ffText),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: hm * 0.08, bottom: hm * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product",
                style: ffText,
              ),
              Text(
                "Total",
                style: ffText,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: hm * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Outbreak | Pasar Seni x 1",
                style: ffText,
              ),
              Text(
                "\$5.99",
                style: ffText,
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: kYellowclr,
          child: Padding(
            padding: EdgeInsets.all(hm * 0.02),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NOTE:",
                    style: ffText,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: hm * 0.01, bottom: hm * 0.04),
                    child: GestureDetector(
                      onTap: (() {
                        pushTo(
                            context,
                            HomeNav(
                              selectindex: 3,
                            ));
                      }),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(text: "Go to ", style: textW),
                        TextSpan(text: "My Quest ", style: ffText),
                        TextSpan(text: "to start.", style: textW)
                      ])),
                    ),
                  ),
                  Text(
                    "Expires in 30 days.",
                    style: ffText,
                  ),
                ]),
          ),
        ),
        SizedBox(
          height: hm * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: ffText,
            ),
            Text(
              "\$5.99",
              style: ffText,
            ),
          ],
        ),
        SizedBox(
          height: hm * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Discount",
              style: ffText,
            ),
            Text(
              "-\$5.99",
              style: ffText,
            ),
          ],
        ),
        SizedBox(
          height: hm * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total:",
              style: ffText,
            ),
            Text(
              "\$0.00",
              style: ffText,
            ),
          ],
        ),
        SizedBox(
          height: hm * 0.03,
        ),
        DefaultEButton(
          width: wm * 0.32,
          height: hm * 0.06,
          radius: 10,
          press: () {},
          color: kbttnColor,
          child: Center(
            child: Text(
              "Order again",
              style: ffText,
            ),
          ),
        ),
        SizedBox(
          height: hm * 0.03,
        ),
        Container(
          decoration: BoxDecoration(
              color: kBlackColor,
              border: Border.all(color: kWhiteColor.withOpacity(0.4))),
          child: Column(
            children: [
              Container(
                height: hm * 0.08,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kdarkGreyclr,
                ),
                child: Padding(
                  padding: EdgeInsets.all(wm * 0.035),
                  child: Text(
                    "Billing address",
                    style: ffText,
                  ),
                ),
              ),
              SizedBox(
                height: hm * 0.2,
                width: double.infinity,
                // decoration: BoxDecoration(
                //     color: kBlackColor,
                //     border: Border.all(color: kWhiteColor.withOpacity(0.4))),
                child: Padding(
                  padding: EdgeInsets.only(left: wm * 0.035, top: wm * 0.055),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Devendra Singh\n",
                          style: ffText.copyWith(fontStyle: FontStyle.italic)),
                      WidgetSpan(
                          child: SizedBox(
                        height: hm * 0.03,
                      )),
                      TextSpan(
                          text: "India\n",
                          style: ffText.copyWith(fontStyle: FontStyle.italic)),
                      WidgetSpan(
                          child: SizedBox(
                        height: hm * 0.03,
                      )),
                      TextSpan(
                          text: "9001294315\n",
                          style: ffText.copyWith(fontStyle: FontStyle.italic)),
                      WidgetSpan(
                          child: SizedBox(
                        height: hm * 0.06,
                      )),
                      TextSpan(
                          text: "devendra.appic@gmail.com",
                          style: ffText.copyWith(fontStyle: FontStyle.italic)),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: hm * 0.1,
        ),
        DefaultOutButton(
            fontSize: 12,
            width: wm * 0.3,
            RadiusClr: kWhiteColor.withOpacity(0.4),
            height: hm * 0.04,
            text: "Delete account",
            radius: 16,
            press: () {
              pushTo(context,const Delete());
            },
            textClr: kWhiteColor.withOpacity(0.4),
            color: kBlackColor),
      ],
    );
  }
}

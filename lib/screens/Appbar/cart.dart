import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:flutter/material.dart';

import '../../utils/styleguide/colors..dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    Size = MediaQuery.of(context).size;
    hm = Size.height;
    wm = Size.width;
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, true),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: hm * 0.03, bottom: hm * 0.03),
              child: Text(
                'Cart | Checkout',
                style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: hm * 0.050,
                    fontFamily: "BalooBhai2"),
              ),
            ),
          ),
          DefaulatOBtn(
              width: wm * 0.37,
              RadiusClr: kcolorlogin,
              height: hm * 0.072,
              text: "Add More Quests",
              radius: 10,
              press: () {
                pushTo(context, HomeNav(selectindex: 4));
              },
              fontSize: 15,
              textClr: kcolorlogin,
              color: kBlackColor),
          SizedBox(
            height: hm * 0.04,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            height: hm * 0.070,
            width: wm * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ktextfildecolor,
            ),
            child: Text("Your cart is currenty empty.",
                style: textW.copyWith(fontSize: 16)),
          )
        ],
      ),
    );
  }
}

import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';

import 'package:flutter/material.dart';

import 'quest_outbreak/quest_outbreak.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({Key? key}) : super(key: key);

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  @override
  Widget build(BuildContext context) {
    Size = MediaQuery.of(context).size;
    hm = Size.height;
    wm = Size.width;
    return SafeArea(
        child: Scaffold(
      appBar: myAppBar(context, false),
      backgroundColor: kBlackColor,
      body: Padding(
        padding:
            EdgeInsets.only(left: hm * 0.03, top: hm * 0.03, right: wm * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'My Quest',
                style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: hm * 0.050,
                    fontFamily: "balooBhai2"),
              ),
            ),
            SizedBox(
              height: hm * 0.04,
            ),
            Center(
              child: SizedBox(
                width: wm * 0.4,
                height: hm * 0.065,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    onSurface: kWhiteColor,
                    side: const BorderSide(color: kWhiteColor, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "How it Works",
                    style: textW.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const quest_outbreak())));
                  },
                ),
              ),
            ),
            SizedBox(
              height: hm * 0.09,
            ),
            Center(
              child: Text(
                  'You have not booked any quest, join a quest now and explore a city.',
                  textAlign: TextAlign.center,
                  style: textW.copyWith(
                      color: kWhiteColor.withOpacity(0.8), fontSize: 20)),
            ),
            SizedBox(
              height: hm * 0.08,
            ),
            Center(
              child: SizedBox(
                width: wm * 0.4,
                height: hm * 0.065,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    onSurface: kWhiteColor,
                    side: const BorderSide(color: kWhiteColor, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "More Quests",
                    style: textW.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    pushTo(context, HomeNav(selectindex: 4));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

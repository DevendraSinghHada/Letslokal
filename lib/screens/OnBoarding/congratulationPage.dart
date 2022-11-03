import 'package:flutter/material.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/utils/constant/images.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/styleguide/colors..dart';

import '../../utils/styleguide/textstyle.dart';

class CongratulationPage extends StatefulWidget {
  const CongratulationPage({Key? key}) : super(key: key);

  @override
  State<CongratulationPage> createState() => _CongratulationPageState();
}

// ignore: camel_case_types
class _CongratulationPageState extends State<CongratulationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Padding(
        padding: EdgeInsets.only(left: wm * 0.035, right: wm * 0.035),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: hm * 0.08,
                  width: wm * 0.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(congrats))),
                ),
                // SizedBox(
                //   width: 4,
                // ),
                Container(
                  height: hm * 0.08,
                  width: wm * 0.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(congoface))),
                ),
                Container(
                  height: hm * 0.08,
                  width: wm * 0.2,
                  decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(congrats))),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: hm * 0.01, bottom: hm * 0.01),
              child: const Text(
                "Congrats!!!",
                style: congStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: hm * 0.05),
              child: Text(
                "Your account has been successfully registered.",
                style: textAcc,
              ),
            ),
            SizedBox(
              height: hm * 0.070,
              width: wm * 0.28,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onSurface: kBlackColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(color: kcolorlogin, width: 2)),
                  ),
                  onPressed: () {
                    replaceRoute(context, HomeNav(selectindex: 5));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Next",
                          style: linktext.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      const Icon(
                        Icons.arrow_forward_sharp,
                        size: 18,
                        color: kcolorlogin,
                      )
                    ],
                  )),
            ),
            SizedBox(height: hm * 0.1),
            Image.asset(
              logoLetslokal,
              height: hm * 0.020,
              width: wm * 0.3,
            )
          ],
        ),
      ),
    );
  }
}

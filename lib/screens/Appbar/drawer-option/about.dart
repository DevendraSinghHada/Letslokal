import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/brandico_icons.dart';


class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    Size = MediaQuery.of(context).size;
    hm = Size.height;
    wm = Size.width;
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, true),
      body: Padding(
        padding:
            EdgeInsets.only(left: hm * 0.03, top: hm * 0.03, right: wm * 0.03),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: hm * 0.15,
                  width: wm * 0.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/image-png/logolokal.png"))),
                ),
              ],
            ),
            SizedBox(
              height: hm * 0.03,
            ),
            Text(
              'LETSLOKAL',
              style: subtitatb,
            ),
            SizedBox(
              height: hm * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: wm * 0.22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: kcolorfacebook),
                    child: const Icon(
                      Brandico.facebook_1,
                      color: kWhiteColor,
                      size: 20,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: kWhiteColor),
                    child: const Icon(Icons.tiktok),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: kcolortrivango),
                      child: SvgPicture.asset(
                        'assets/image-png/tripadvisor.svg',
                        color: kWhiteColor,
                        height: 20,
                      )),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: kcolortwitter),
                    child: const Icon(
                      Brandico.twitter_bird,
                      color: kWhiteColor,
                      size: 15,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: kcolorinstagram),
                    child: const Icon(
                      Brandico.instagram_1,
                      color: kWhiteColor,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: hm * 0.02,
            ),
            Text(
              'Our mission is simply to bring back the spirit of adventure and wonder to'
              ' peoples lives. We dream of designing thousands of adventures in cities around the world.'
              ' As a small team of explorers and imagineers, we build quests in cities, '
              'design puzzles and write interactive stories for you to discover and experience.',
              style: smalltital.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: hm * 0.03,
            ),
            Text(
              "It's the fun way for you to explore.Each quest you join will record your time and score, for "
              'the ranking board, allowing you to compete with other players. '
              'We also work on building a one stop information centre for highlights'
              ' of cities around the world.',
              style: smalltital.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: hm * 0.03,
            ),
            Text(
              'The Fun Way To Explore',
              style: title.copyWith(fontSize: 26),
            ),
            SizedBox(
              height: hm * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/image-png/start.png',
                  height: hm * 0.04,
                ),
                Image.asset(
                  'assets/image-png/start.png',
                  height: hm * 0.04,
                ),
                Image.asset(
                  'assets/image-png/start.png',
                  height: hm * 0.04,
                ),
                Image.asset(
                  'assets/image-png/start.png',
                  height: hm * 0.04,
                ),
                Image.asset(
                  'assets/image-png/start.png',
                  height: hm * 0.04,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

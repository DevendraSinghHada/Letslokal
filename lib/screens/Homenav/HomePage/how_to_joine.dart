import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:flutter/material.dart';
import '../../../utils/styleguide/textstyle.dart';

import 'package:carousel_slider/carousel_slider.dart';


class HowtoJoine extends StatefulWidget {
  const HowtoJoine({Key? key}) : super(key: key);

  @override
  State<HowtoJoine> createState() => _HowtoJoineState();
}

class _HowtoJoineState extends State<HowtoJoine> {
  Color _textFColor = kWhiteColor;
  Color _textSColor = kWhiteColor;
  Color _textTColor = kWhiteColor;
  Color _textFourColor = kWhiteColor;

  Color _SelectIconColor = kWhiteColor;

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    // hm = size.height;
    // wm = size.width;
    return Scaffold(
      appBar: myAppBar(context, true),
      backgroundColor: kBlackColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: hm * 0.03, right: wm * 0.03),
            child: Column(children: [
              Text(
                'How to Join',
                style: title.copyWith(fontSize: 35),
              ),
              SizedBox(
                height: hm * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                height: hm * 0.12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kcolorlogin,
                ),
                child: Icon(
                  Icons.person_outlined,
                  size: hm * 0.09,
                  color: kWhiteColor,
                ),
              ),
              SizedBox(
                height: hm * 0.03,
              ),
              Text(
                'Login | Register',
                style: textW.copyWith(
                    fontSize: 18, color: kWhiteColor.withOpacity(0.8)),
              ),
              SizedBox(
                height: hm * 0.01,
              ),
              Text(
                'You can Quickly login or register with your social account or your email',
                textAlign: TextAlign.center,
                style: smalltital,
              ),
              SizedBox(
                height: hm * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                height: hm * 0.12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kcolorlogin,
                ),
                child: Icon(
                  Icons.menu,
                  size: hm * 0.09,
                  color: kWhiteColor,
                ),
              ),
              SizedBox(
                height: hm * 0.03,
              ),
              Text('Pick A Quest',
                  style: textW.copyWith(
                      fontSize: 18, color: kWhiteColor.withOpacity(0.8))),
              SizedBox(
                height: hm * 0.01,
              ),
              Text(
                'Quests with differnt storyline for you to exprince  a city',
                textAlign: TextAlign.center,
                style: smalltital,
              ),
              SizedBox(
                height: hm * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                height: hm * 0.12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kcolorlogin,
                ),
                child: Icon(
                  Icons.credit_score_rounded,
                  size: hm * 0.09,
                  color: kWhiteColor,
                ),
              ),
              SizedBox(
                height: hm * 0.03,
              ),
              Text('Book a Quest',
                  style: textW.copyWith(
                      fontSize: 18, color: kWhiteColor.withOpacity(0.8))),
              SizedBox(
                height: hm * 0.01,
              ),
              Text(
                'Add a Quest to your cart & checkout must be registerd & logged in.',
                textAlign: TextAlign.center,
                style: smalltital,
              ),
              SizedBox(
                height: hm * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                height: hm * 0.12,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kcolorlogin,
                ),
                child: Icon(
                  Icons.speed,
                  size: hm * 0.09,
                  color: kWhiteColor,
                ),
              ),
              SizedBox(
                height: hm * 0.03,
              ),
              Text("Start a Quest",
                  style: textW.copyWith(
                      fontSize: 18, color: kWhiteColor.withOpacity(0.8))),
              SizedBox(
                height: hm * 0.01,
              ),
              Text(
                'All the Quests you have purchased to join will be in My Quest Page',
                textAlign: TextAlign.center,
                style: smalltital,
              ),
              SizedBox(
                height: hm * 0.09,
              ),
              Text(
                "How Quests Work",
                style: textW.copyWith(fontSize: 35),
              ),
              SizedBox(
                height: hm * 0.035,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: wm * 0.6,
                height: hm * 0.5,
                decoration: BoxDecoration(
                    color: kcolorsubblack,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/image-png/myquest.png')),
                    boxShadow: [
                      BoxShadow(
                          color: kWhiteColor.withOpacity(0.20),
                          spreadRadius: 2,
                          blurRadius: 4)
                    ]),
              ),
              SizedBox(
                height: hm * 0.05,
              ),
              Row(
                children: [
                  Text(
                    '1.My Quest',
                    style: subtital.copyWith(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              RichText(
                  text: TextSpan(
                      text: "All the  Quests you have purchased will be in ",
                      style: subsmalltital.copyWith(
                          fontSize: 16, color: kWhiteColor.withOpacity(0.8)),
                      children: [
                    TextSpan(
                        text: "My  Quest Page.",
                        style: linktext.copyWith(
                          fontSize: 16,
                        ))
                  ])),
              SizedBox(
                height: hm * 0.055,
              ),
              CarouselSlider(
                items: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: wm * 0.6,
                    height: hm * 0.5,
                    decoration: BoxDecoration(
                        color: kcolorsubblack,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/image-png/myquest.png')),
                        boxShadow: [
                          BoxShadow(
                              color: kWhiteColor.withOpacity(0.20),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: wm * 0.6,
                    height: hm * 0.5,
                    decoration: BoxDecoration(
                        color: kcolorsubblack,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image:
                                AssetImage('assets/image-png/allthebest.png')),
                        boxShadow: [
                          BoxShadow(
                              color: kWhiteColor.withOpacity(0.20),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ]),
                  ),
                ],
                options: CarouselOptions(
                  height: hm * 0.5,
                  autoPlay: true,
                  reverse: false,
                  initialPage: 0,
                ),
              ),
              SizedBox(
                height: hm * 0.05,
              ),
              Row(
                children: [
                  Text(
                    '2. Start A Quest',
                    style: subtital.copyWith(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Text(
                  'Click on the Quest  you wish to start  and it will  begin with an introduction before you start exploring the city',
                  style: subsmalltital.copyWith(
                      fontSize: 16, color: kWhiteColor.withOpacity(0.8))),
              SizedBox(
                height: hm * 0.055,
              ),
              CarouselSlider(
                items: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: wm * 0.6,
                    height: hm * 0.5,
                    decoration: BoxDecoration(
                        color: kcolorsubblack,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/image-png/mobilemap.jpg'),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: kWhiteColor.withOpacity(0.20),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: wm * 0.6,
                    height: hm * 0.5,
                    decoration: BoxDecoration(
                        color: kcolorsubblack,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/image-png/mobilemap.jpg'),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: kWhiteColor.withOpacity(0.20),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ]),
                  ),
                ],
                options: CarouselOptions(
                  height: hm * 0.5,
                  autoPlay: true,
                  reverse: false,
                  initialPage: 0,
                ),
              ),
              SizedBox(
                height: hm * 0.05,
              ),
              Row(
                children: [
                  Text(
                    '3.Explore The city',
                    style: subtital.copyWith(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Text(
                  'the Quest will lead you be explore the city advanturously with clubs,riddles and puzzless',
                  style: subsmalltital.copyWith(
                      fontSize: 16, color: kWhiteColor.withOpacity(0.8))),
              SizedBox(
                height: hm * 0.055,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: wm * 0.6,
                height: hm * 0.5,
                decoration: BoxDecoration(
                    color: kcolorsubblack,
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage('assets/image-png/cet.png')),
                    boxShadow: [
                      BoxShadow(
                          color: kWhiteColor.withOpacity(0.20),
                          spreadRadius: 2,
                          blurRadius: 4)
                    ]),
              ),
              SizedBox(
                height: hm * 0.05,
              ),
              Row(
                children: [
                  Text(
                    '4. Collections Points',
                    style: subtital.copyWith(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Text(
                  'At every at task you to gain or lose points, there will be a note explaning it at the botton of the page.',
                  style: subsmalltital.copyWith(
                      fontSize: 16, color: kWhiteColor.withOpacity(0.8))),
              SizedBox(
                height: hm * 0.055,
              ),
              CarouselSlider(
                items: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: wm * 0.6,
                    height: hm * 0.5,
                    decoration: BoxDecoration(
                        color: kcolorsubblack,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/image-png/test2.jpg'),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: kWhiteColor.withOpacity(0.20),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: wm * 0.6,
                    height: hm * 0.5,
                    decoration: BoxDecoration(
                        color: kcolorsubblack,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/image-png/test3.jpg'),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              color: kWhiteColor.withOpacity(0.20),
                              spreadRadius: 2,
                              blurRadius: 4)
                        ]),
                  ),
                ],
                options: CarouselOptions(
                  height: hm * 0.5,
                  autoPlay: true,
                  reverse: false,
                  initialPage: 0,
                ),
              ),
              SizedBox(
                height: hm * 0.05,
              ),
              Row(
                children: [
                  Text(
                    '5.Completing The Quest',
                    style: subtital.copyWith(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              RichText(
                  text: TextSpan(
                      text:
                          "At the end, you will be scroed on your performance and time. Your score will be lised on the ",
                      style: subsmalltital.copyWith(fontSize: 16, color: kWhiteColor.withOpacity(0.8)),
                      children: [
                    TextSpan(
                        text: "ranking board.",
                        style: linktext.copyWith(fontSize: 16))
                  ])),
              SizedBox(
                height: hm * 0.08,
              ),
              Text(
                'FAQ',
                style: title.copyWith(fontSize: 35),
              ),
              SizedBox(
                height: hm * 0.08,
              ),
              ExpansionTile(
                collapsedIconColor: kWhiteColor,
                iconColor: _textFColor,
                tilePadding: EdgeInsets.zero,
                onExpansionChanged: (expanded) {
                  setState(() {
                    if (expanded) {
                      _textFColor = kcolorlogin;
                    } else {
                      _textFColor = kWhiteColor;
                    }
                  });
                },
                title: Text(
                  'Are lokal Quests availble in different languages?',
                  style: TextStyle(
                    color: _textFColor,
                    fontWeight: FontWeight.w500,
                    fontSize: hm * 0.025,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: wm * 0.13),
                    child: Text(
                      'Currenty,lokal quests  based are only available in English.',
                      style: smalltital.copyWith(fontSize: 16),
                    ),
                  )
                ],
              ),
              ExpansionTile(
                collapsedIconColor: _SelectIconColor,
                tilePadding: EdgeInsets.zero,
                onExpansionChanged: (expanded) {
                  setState(() {
                    if (expanded) {
                      _SelectIconColor = kWhiteColor;
                      _textSColor = kcolorlogin;
                    } else {
                      _textSColor = kWhiteColor;
                    }
                  });
                },
                title: Text(
                  'Are lokal Quests based on real events or scenarios?',
                  style: TextStyle(
                    color: _textSColor,
                    fontWeight: FontWeight.w500,
                    fontSize: hm * 0.025,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: wm * 0.13),
                    child: Text(
                      'No. Lokal quests are played using a digital host who will guide you on a story, '
                      'revealing puzzles, clues and locations along the way. Lokal quests are made '
                      'up scenarios and not based on any real event whatsoever.',
                      style: smalltital,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                collapsedIconColor: kWhiteColor,
                tilePadding: EdgeInsets.zero,
                onExpansionChanged: (expanded) {
                  setState(() {
                    if (expanded) {
                      _textTColor = kcolorlogin;
                    } else {
                      _textTColor = kWhiteColor;
                    }
                  });
                },
                title: Text(
                  'Can lokal quests be played on any device?',
                  style: TextStyle(
                    color: _textTColor,
                    fontWeight: FontWeight.w500,
                    fontSize: hm * 0.025,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: wm * 0.13),
                    child: Text(
                      'Lokal quests are played on a web browser,'
                      'so you can use any device with an internet browser.'
                      ' For the best experience though we recommend using a smartphone.',
                      style: smalltital,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                collapsedIconColor: kWhiteColor,
                tilePadding: EdgeInsets.zero,
                onExpansionChanged: (expanded) {
                  setState(() {
                    if (expanded) {
                      _textFourColor = kcolorlogin;
                    } else {
                      _textFourColor = kWhiteColor;
                    }
                  });
                },
                title: Text(
                  'What if I lose connection or my device runs out of battery?',
                  style: TextStyle(
                    color: _textFourColor,
                    fontWeight: FontWeight.w500,
                    fontSize: hm * 0.025,
                  ),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: wm * 0.13),
                    child: Text(
                      'Your progress in the quests are saved on your device using cookies, '
                      'should be able to continue where you left off. Make sure to open'
                      ' it back in the same browser.',
                      style: smalltital,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: hm * 0.04,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

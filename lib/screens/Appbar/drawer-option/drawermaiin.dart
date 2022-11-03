import 'package:letslokal/components/components.dart';
import 'package:letslokal/screens/Appbar/drawer-option/about.dart';
import 'package:letslokal/screens/Homenav/Profile/profile.dart';
import 'package:letslokal/utils/constant/images.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:letslokal/screens/Appbar/cart.dart';
import 'package:letslokal/screens/Homenav/HomePage/globleranking.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/screens/Homenav/HomePage/how_to_joine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/brandico_icons.dart';

import 'contactus.dart';

class Drawermain extends StatefulWidget {
  const Drawermain({Key? key}) : super(key: key);

  @override
  State<Drawermain> createState() => _DrawermainState();
}

class _DrawermainState extends State<Drawermain> {
  Color _textMColor = kWhiteColor;
  Color _textAColor = kWhiteColor;
  Color _textIColor = kWhiteColor;

  String displayvalu = "Other Curntrys";
  var currency = [
    'India',
    'USA',
    'Aruba',
    'Austria',
    'Canada',
    'Japan',
    'United Kingdom',
  ];

  @override
  Widget build(BuildContext context) {
    Size = MediaQuery.of(context).size;
    hm = Size.height;
    wm = Size.width;
    return Scaffold(
      backgroundColor: kBlackColor.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: wm * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: hm * 0.02, bottom: hm * 0.09),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: kWhiteColor,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
              ExpansionTile(
                collapsedIconColor: kWhiteColor,
                tilePadding: EdgeInsets.zero,
                onExpansionChanged: (expanded) {
                  setState(() {
                    if (expanded) {
                      _textMColor = kcolorlogin;
                    } else {
                      _textMColor = kWhiteColor;
                    }
                  });
                },
                title: Text('Menu',
                    style: expTileStyle.copyWith(
                        color: _textMColor, fontFamily: "BalooBhai2")),
                children: [
                  Column(
                    children: [
                      ExpansionRow(context, "Home", HomeNav(selectindex: 1)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: hm * 0.02, bottom: hm * 0.02),
                          child: ExpansionRow(
                              context, "Quests", HomeNav(selectindex: 4))),
                      ExpansionRow(context, "Ranking", const GlobleRanking()),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      Row(
                        children: [
                          dotCircle(context),
                          SizedBox(
                            width: wm * 0.07,
                          ),
                          Text(
                            'Lokal Tips',
                            style: subtitatb.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                collapsedIconColor: kWhiteColor,
                tilePadding: EdgeInsets.zero,
                onExpansionChanged: (expanded) {
                  setState(() {
                    if (expanded) {
                      _textAColor = kcolorlogin;
                    } else {
                      _textAColor = kWhiteColor;
                    }
                  });
                },
                title: Text('Account',
                    style: expTileStyle.copyWith(
                        color: _textAColor, fontFamily: "BalooBhai2")),
                children: [
                  Column(
                    children: [
                      ExpansionRow(context, "Profile", const Profile()),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      ExpansionRow(context, "Account", HomeNav(selectindex: 5)),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      ExpansionRow(
                          context, "My Quest", HomeNav(selectindex: 3)),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      ExpansionRow(
                          context, "Wishlist", HomeNav(selectindex: 2)),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      ExpansionRow(context, "Cart", const Cart())
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                collapsedIconColor: kWhiteColor,
                tilePadding: EdgeInsets.zero,
                onExpansionChanged: (expanded) {
                  setState(() {
                    if (expanded) {
                      _textIColor = kcolorlogin;
                    } else {
                      _textIColor = kWhiteColor;
                    }
                  });
                },
                title: Text('Info',
                    style: expTileStyle.copyWith(
                        color: _textIColor, fontFamily: "BalooBhai2")),
                children: [
                  Column(
                    children: [
                      ExpansionRow(context, "About Us", const About()),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      ExpansionRow(
                          context, "How Quests Work", const HowtoJoine()),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      ExpansionRow(context, "Contact Us", const Contactus()),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: hm * 0.025,
              ),
              Image.asset(
                logoLetslokal,
                width: wm * 0.55,
                height: hm * 0.08,
              ),
              Padding(
                padding: EdgeInsets.only(top: hm * 0.02, bottom: hm * 0.01),
                child: Row(
                  children: [
                    const Icon(
                      Icons.copyright,
                      color: kWhiteColor,
                      size: 20,
                    ),
                    Text(
                      ' All Rights Reserved | Privacy. | Terms',
                      style: subtital.copyWith(fontSize: 16),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: wm * 0.02),
                alignment: Alignment.center,
                height: hm * 0.075,
                width: wm * 0.6,
                decoration: BoxDecoration(
                    color: ktextfildecolor,
                    borderRadius: BorderRadius.circular(2)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    focusColor: ktextfildecolor,
                    isExpanded: true,
                    iconEnabledColor: kWhiteColor,
                    elevation: 1,
                    style: TextStyle(color: kWhiteColor.withOpacity(0.60)),
                    dropdownColor: ktextfildecolor,
                    hint: Text(
                      'Other Country',
                      style: TextStyle(
                          color: kWhiteColor.withOpacity(0.8),
                          fontSize: hm * 0.022,
                          fontWeight: FontWeight.w600),
                    ),
                    items: currency.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? value) {},
                  ),
                ),
              ),
              SizedBox(
                height: hm * 0.03,
              ),
              SizedBox(
                width: wm * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.facebook_outlined,
                      color: kWhiteColor,
                      size: 30,
                    ),
                    const Icon(
                      Icons.tiktok,
                      color: kWhiteColor,
                      size: 30,
                    ),
                    SvgPicture.asset(
                      tripAdvisor,
                      color: kWhiteColor,
                      height: 33,
                    ),
                    const Icon(
                      Brandico.twitter_bird,
                      color: kWhiteColor,
                      size: 23,
                    ),
                    const Icon(
                      Brandico.instagram_1,
                      color: kWhiteColor,
                      size: 23,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

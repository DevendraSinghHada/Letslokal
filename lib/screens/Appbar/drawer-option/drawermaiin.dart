import 'package:letslokal/Services/auth.dart';
import 'package:letslokal/components/components.dart';
import 'package:letslokal/main.dart';
import 'package:letslokal/screens/Appbar/drawer-option/about.dart';
import 'package:letslokal/screens/Appbar/drawer-option/privacyWeb.dart';
import 'package:letslokal/screens/Appbar/drawer-option/terms.dart';
import 'package:letslokal/screens/Homenav/HomePage/ranking.dart';
import 'package:letslokal/screens/Homenav/Profile/profile.dart';
import 'package:letslokal/utils/constant/images.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:letslokal/screens/Appbar/cart.dart';

import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/screens/Homenav/HomePage/how_to_joine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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

  final fbUrl = Uri.parse("https://www.facebook.com/letslokal.page/");
  final instaUrl = Uri.parse("https://www.instagram.com/letslokal/");
  final twitterUrl = Uri.parse("https://twitter.com/letslokal/");
  final tripAdvUrl = Uri.parse("https://www.tripadvisor.com/Profile/letslokal?fid=4adb83a8-0bb8-4e57-9dd5-74d746466413");
  final tiktokUrl = Uri.parse("https://www.tiktok.com/@letslokal");

  String displayvalu = "Other Curntrys";
  var countryList = [
    'Aland Islands',
    'Andorra',
    'Austria',
    'Australia'
    'Belgium',
    'Cyprus'
    'Estonia',
    'Finland',
    'France',
    'French Guiana',
    'French Southern Territories',
    'Germany',
    'Greece',
    'Guadeloupe',
    'Ireland',
    'Italy',
    'Latvia',
    'Lithuania',
    'Luxembourg',
    'Malaysia',
    'Malta',
    'Martinique',
    'Mayotte',
    'Monaco',
    'Montenegro',
    'Nehterlands',
    'Portugal',
    'Reunion',
    'Saint Barthelemy',
    'Saint Martin (French part)',
    'Saint Pierre and Miquelon',
    'San Marino',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Spain',
    'United Kingdom',
    'Vatican',
    
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
                      expansionRow(context, "Home", HomeNav(selectindex: 1)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: hm * 0.02, bottom: hm * 0.02),
                          child: expansionRow(
                              context, "Quests", HomeNav(selectindex: 4))),
                      Row(
                        children: [
                          dotCircle(context),
                          SizedBox(
                            width: wm * 0.07,
                          ),
                          InkWell(
                            onTap: () {
                              isNewUser
                                  ? loginDialogue(context)
                                  : ranking(Preference.pref.getString("userId"),
                                          context)
                                      .then(((value) {
                                      value = myUrl;
                                      pushTo(context, Ranking(url: myUrl));
                                    }));
                              //  Navigator.push(context, MaterialPageRoute(builder: (context) => HowtoJoine()));
                            },
                            child: Text(
                              "Ranking",
                              style: subtitatb.copyWith(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
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
                      expansionRow(context, "Profile", const Profile()),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      expansionRow(context, "Account", HomeNav(selectindex: 5)),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      expansionRow(
                          context, "My Quest", HomeNav(selectindex: 3)),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      expansionRow(
                          context, "Wishlist", HomeNav(selectindex: 2)),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      expansionRow(context, "Cart", const Cart())
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
                      expansionRow(context, "About Us", const About()),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      expansionRow(
                          context, "How Quests Work", const HowtoJoine()),
                      SizedBox(
                        height: hm * 0.02,
                      ),
                      expansionRow(context, "Contact Us", const ContactUs()),
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
                      ' All Rights Reserved |',
                      style: subtital.copyWith(fontSize: 16),
                    ),
                    TextButton(onPressed: (){

                      pushTo(context,const PrivacyWeb());

                    }, child: Text(
                      'Privacy',
                      style: subtital.copyWith(fontSize: 16).copyWith(decoration: TextDecoration.underline),
                    ),),
                    Text(
                      '|',
                      style: subtital.copyWith(fontSize: 16),
                    ),
                    TextButton(onPressed: (){
                      pushTo(context,const TermsWeb());

                    }, child: Text(
                      'Terms',
                      style: subtital.copyWith(fontSize: 16).copyWith(decoration: TextDecoration.underline),
                    ),)
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
                    items: countryList.map((String items) {
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
           children: [
            

                    IconButton(onPressed: (){
                          launchUrl(fbUrl,mode: LaunchMode.externalApplication);
                    }, icon: const Icon(
                        Icons.facebook_outlined,
                        color: kWhiteColor,
                        size: 30,
                      ),),
                       IconButton(onPressed: (){
                        print(countryList.length.toString());
                          launchUrl(tiktokUrl,mode: LaunchMode.externalApplication);
                    }, icon:const Icon(
                      Icons.tiktok,
                      color: kWhiteColor,
                      size: 30,
                    ),),

                       IconButton(onPressed: (){
                          launchUrl(tripAdvUrl,mode: LaunchMode.externalApplication);
                    }, icon: SvgPicture.asset(
                      tripAdvisor,
                      color: kWhiteColor,
                      height: 33,
                    )  ),

                      IconButton(onPressed: (){
                          launchUrl(twitterUrl,mode: LaunchMode.externalApplication);
                    }, icon:const Icon(
                      Brandico.twitter_bird,
                      color: kWhiteColor,
                      size: 23,
                    )  ),

                    
                      IconButton(onPressed: (){
                          launchUrl(instaUrl,mode: LaunchMode.externalApplication);
                    }, icon:const Icon(
                      Brandico.instagram_1,
                      color: kWhiteColor,
                      size: 23,
                    ) ),
                
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

import 'package:flutter/material.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';

// late final GlobalKey<NavigatorState>? navigatorKey;

// isExists() {
//   if (Preference.pref.getString("ID")) {}

//   return 1;
// }

var Size, hm, wm;

// Size = MediaQuery.of(context).size;

const Color _textColor = Color(0xFF1f836b);

TextStyle title = const TextStyle(
    color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 14);
TextStyle textW = const TextStyle(
  color: kWhiteColor,
  fontWeight: FontWeight.normal,
  fontSize: 14,
);

// account text style
TextStyle textAcc = const TextStyle(
    color: kWhiteColor, fontWeight: FontWeight.normal, fontSize: 16);

// reason list style
TextStyle reasonStyle = const TextStyle(
    color: kBlackColor, fontWeight: FontWeight.w500, fontSize: 20);

//Home Page LokalQuests and LokalTips style
TextStyle lokalQTstyle = const TextStyle(
    fontSize: 24, fontWeight: FontWeight.bold, color: kBlackColor);

// pallet style
final TextStyle pelletStyle = TextStyle(
    color: kWhiteColor.withOpacity(0.8),
    fontWeight: FontWeight.normal,
    fontSize: 14);
// textformfield text
TextStyle ffText = const TextStyle(
    color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 15);

// drawer Expansiontile title style

const TextStyle expTileStyle =
    TextStyle(color: _textColor, fontWeight: FontWeight.w900, fontSize: 26);

// Bottom Nav bar textstyle

const TextStyle bttmStyle =
    TextStyle(color: _textColor, fontWeight: FontWeight.w700, fontSize: 12);

// Congrats button textStyle
const TextStyle congStyle =
    TextStyle(color: kWhiteColor, fontSize: 50, fontWeight: FontWeight.normal);

TextStyle titalb = TextStyle(
    color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: hm * 0.060);
TextStyle titalm = TextStyle(
    color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: hm * 0.099);
TextStyle subtital = const TextStyle(
    color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 18);
TextStyle subtitatb = TextStyle(
    color: kWhiteColor, fontWeight: FontWeight.w900, fontSize: hm * 0.030);
TextStyle dropdown = TextStyle(
    color: _textColor, fontWeight: FontWeight.w500, fontSize: hm * 0.024);
TextStyle smalltital =
    TextStyle(color: kWhiteColor.withOpacity(0.90), fontSize: hm * 0.019);
TextStyle subsmalltital =
    TextStyle(color: kWhiteColor.withOpacity(0.90), fontSize: hm * 0.018);
TextStyle linktext = TextStyle(
  color: kcolorlogin,
  fontSize: hm * 0.018,
);

import 'package:flutter/material.dart';
import 'package:letslokal/utils/styleguide/colors..dart';

import 'styleguide/textstyle.dart';

// TextFormfield for edit profile page static value
class Dfttextformfield extends StatelessWidget {
  const Dfttextformfield(
      {required this.fillcolor,
      required this.focuscolor,
      required this.outbordercolor,
      required this.borderradius,
      required this.iniValue,
      Key? key})
      : super(key: key);
  final String iniValue;
  final Color fillcolor;
  final Color focuscolor;
  final Color outbordercolor;
  final double borderradius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: iniValue,
      readOnly: true,
      style: const TextStyle(color: kWhiteColor),
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        fillColor: fillcolor,
        focusColor: focuscolor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: outbordercolor, width: 2.0),
          borderRadius: BorderRadius.circular(borderradius),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderradius)),
      ),
    );
  }
}

// TextFormfield for Social media handles in edit profile

class SocialMediaField extends StatelessWidget {
  const SocialMediaField(
      {required this.fillcolor,
      required this.focuscolor,
      required this.outbordercolor,
      required this.borderradius,
      required this.controller,
      required this.validator,
      Key? key})
      : super(key: key);
  final Color fillcolor;
  final Color focuscolor;
  final Color outbordercolor;
  final double borderradius;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(color: kWhiteColor),
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        fillColor: fillcolor,
        focusColor: focuscolor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: outbordercolor, width: 2.0),
          borderRadius: BorderRadius.circular(borderradius),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderradius)),
      ),
    );
  }
}

class DftSearch extends StatelessWidget {
  const DftSearch(
      {required this.fillcolor,
      required this.focuscolor,
      required this.outbordercolor,
      required this.borderradius,
      Key? key})
      : super(key: key);
  final Color fillcolor;
  final Color focuscolor;
  final Color outbordercolor;
  final double borderradius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: kWhiteColor, fontSize: 15),
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
          hintText: "USER ID",
          hintStyle: TextStyle(
              color: kWhiteColor.withOpacity(
            0.40,
          )),
          contentPadding:
              EdgeInsets.symmetric(vertical: hm * 0.01, horizontal: 10),
          fillColor: fillcolor,
          focusColor: focuscolor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: outbordercolor, width: 2.0),
            borderRadius: BorderRadius.circular(borderradius),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderradius))),
    );
  }
}

class Dfttextformfieldborder extends StatelessWidget {
  const Dfttextformfieldborder(
      {required this.fillcolor,
      required this.focuscolor,
      required this.outbordercolor,
      required this.borderradius,
      required this.size,
      required this.maxline,
      Key? key})
      : super(key: key);
  final Color fillcolor;
  final Color focuscolor;
  final Color outbordercolor;
  final double borderradius;
  final double size;
  final int maxline;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: kWhiteColor),
      cursorColor: kWhiteColor,
      maxLines: maxline,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: size, horizontal: 10),
        fillColor: fillcolor,
        focusColor: focuscolor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: outbordercolor, width: 2.0),
          borderRadius: BorderRadius.circular(borderradius),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderradius)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ktextfildecolor, width: 2.0),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}


// Borderfor textformfields used in textformfield (only textformfield which contains name)
InputDecoration txtffInputDeco(
  BuildContext context,
) {
  return InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      fillColor: ktextfildecolor,
      focusColor: kWhiteColor,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ktextfildecolor, width: 2.0),
        borderRadius: BorderRadius.circular(4),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)));
}


// textformfield decoration for log in and sign up pages  ( for password textformfield)
InputDecoration txtffSiffixDeco(BuildContext context, Widget suffixIcon) {
  return InputDecoration(
      contentPadding: const EdgeInsets.all(10),
      fillColor: ktextfildecolor,
      focusColor: kWhiteColor,
      filled: true,
      suffixIcon: suffixIcon,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: ktextfildecolor, width: 2.0),
        borderRadius: BorderRadius.circular(4),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)));
}


// textformfield border for account section details section 
OutlineInputBorder accountBorder (BuildContext context){
 return OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: ktextfildecolor, width: 2.0),
                                );
}
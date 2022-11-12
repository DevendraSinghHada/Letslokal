import 'package:flutter/material.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';

class DftButton extends StatelessWidget {
  const DftButton(
      {required this.width,
      required this.height,
      required this.text,
      required this.color,
      required this.textcolor,
      required this.press,
      required this.radius,
      Key? key})
      : super(key: key);
  final double width;
  final double height;
  final String text;
  final Color color;
  final Color textcolor;
  final Function() press;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        onSurface: color,
        padding: EdgeInsets.only(
            left: width, right: width, top: height, bottom: height),
        textStyle: TextStyle(color: textcolor, fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}

class DefaultButtonLogin extends StatelessWidget {
  const DefaultButtonLogin({
    required this.width,
    required this.height,
    Key? key,
    required this.text,
    required this.press,
    required this.cicon,
    required this.color,
  }) : super(key: key);
  final String text;
  final Function() press;
  final double width;
  final double height;
  final Widget cicon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 20,
            ),
            Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: color,
                ),
                child: cicon),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultEButton extends StatelessWidget {
  const DefaultEButton({
    required this.width,
    required this.height,
    Key? key,
    this.child,
    this.text,
    required this.radius,
    required this.press,
    // required this.cicon,
    required this.color,
  }) : super(key: key);
  final String? text;
  final Widget? child;
  final Function() press;
  final double width;
  final double height;
  final double radius;
  // final Widget cicon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        color: color,
        onPressed: press,
        child: Center(child: child),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const SizedBox(
        //       width: 20,
        //     ),
        //     Container(
        //         height: 40,
        //         width: 100,
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(30),
        //           color: color,
        //         ),
        //         child: cicon),
        //     Text(
        //       text!,
        //       textAlign: TextAlign.center,
        //       style: const TextStyle(
        //           color: Colors.white,
        //           fontSize: 16,
        //           fontWeight: FontWeight.w700),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

//OutLined Button
class DefaultOutButton extends StatelessWidget {
  const DefaultOutButton({
    Key? key,
    required this.width,
    required this.fontSize,
    required this.RadiusClr,
    required this.height,
    required this.text,
    required this.radius,
    required this.press,
    required this.textClr,
    // required this.cicon,
    required this.color,
  }) : super(key: key);
  final String? text;

  final Function() press;
  final double width;
  final double fontSize;
  final double height;
  final double radius;
  final Color RadiusClr;
  final Color textClr;

  // final Widget cicon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: RadiusClr, width: 1), disabledForegroundColor: color.withOpacity(0.38),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: press,
        child: Center(
          child: FittedBox(
            child: Text(
              text!,
              style: textW.copyWith(color: textClr, fontSize: fontSize),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

// Social Log in Button
class SocialBttn extends StatelessWidget {
  const SocialBttn({
    required this.iconS,
    Key? key,
    required this.text,
    required this.press,
    // required this.cicon,
    required this.color,
  }) : super(key: key);
  final IconData iconS;
  final String text;

  final Function() press;

  // final Widget cicon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    hm = MediaQuery.of(context).size.height;
    wm = MediaQuery.of(context).size.width;
    return SizedBox(
      width: wm * 0.72,
      height: hm * 0.065,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: color,
        onPressed: press,
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Icon(
              iconS,
              color: kWhiteColor,
              size: 30,
            ),
            SizedBox(
              width: wm * 0.04,
            ),
            RichText(
                text: TextSpan(
                    text: "Continue with ",
                    style: textW.copyWith(fontSize: 16),
                    children: [
                  TextSpan(
                      text: text,
                      style: textW.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 16))
                ])),
          ]),
        ),
      ),
    );
  }
}

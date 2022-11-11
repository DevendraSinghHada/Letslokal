import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:letslokal/Services/auth.dart';
import 'package:letslokal/components/components.dart';
import 'package:letslokal/main.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/screens/OnBoarding/register.dart';
import 'package:letslokal/utils/constant/images.dart';
import 'package:letslokal/utils/dfttextformfield.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import '../../Services/SocialLogin/authService.dart';
import '../../utils/constant/screennavigation.dart';
import '../../utils/dftbutton.dart';
import '../../utils/styleguide/textstyle.dart';
import 'forgotpassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController lpasscontroller = TextEditingController(
      text: Preference.pref.getString("RememberedPass") ?? "");
  TextEditingController userController = TextEditingController(
      text: Preference.pref.getString("RememberedName") ?? "");

  bool checkboxvalue = false;
  bool isEyeMask = false;

  // bool? newUser;

  @override
  void initState() {
    super.initState();
    if (Preference.pref!.getBool("ClickedCheckbox") ?? false) {
      checkboxvalue = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size = MediaQuery.of(context).size;
    hm = Size.height;
    wm = Size.width;
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.all(wm * 0.04),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: hm * 0.04, bottom: hm * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            isNewUser == true;
                            replaceRoute(context, HomeNav(selectindex: 1));
                          },
                          child: Text('Skip', style: title))

                      // InkWell(
                      //     onTap: () {
                      //       isNewUser == true;
                      //       replaceRoute(context, HomeNav(selectindex: 1));
                      //     },
                      //     child: Text('Skip', style: title)),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    logoLetsLokal,
                    height: hm * 0.1,
                    width: wm * 0.4,
                  ),
                ),
                SizedBox(
                  height: hm * 0.02,
                ),
                Container(
                  // padding: EdgeInsets.all(20),
                  width: wm * 0.9,
                  decoration: BoxDecoration(
                      color: kcolorsubblack,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: kWhiteColor.withOpacity(0.20),
                            spreadRadius: 2,
                            blurRadius: 4)
                      ]),
                  child: Padding(
                    padding: EdgeInsets.all(wm * 0.045),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: hm * 0.02, bottom: hm * 0.005),
                          child: Text('Username', style: textW),
                        ),
                        TextFormField(
                          controller: userController,
                          style: const TextStyle(color: kWhiteColor),
                          cursorColor: kWhiteColor,
                          decoration: txtffInputDeco(context),
                          validator: ((userController) {
                            if (userController!.isEmpty ||
                                userController.trim().isEmpty) {
                              return "Please Enter login credential";
                            }
                            return null;
                          }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: hm * 0.02, bottom: hm * 0.005),
                          child: Text('Password', style: textW),
                        ),
                        TextFormField(
                          obscureText: isEyeMask ? false : true,
                          controller: lpasscontroller,
                          style: const TextStyle(color: kWhiteColor),
                          cursorColor: kWhiteColor,
                          decoration: txtffSiffixDeco(
                            context,
                            //Suffix Icon
                            IconButton(
                              icon: isEyeMask
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                              onPressed: () {
                                setState(() {
                                  isEyeMask = !isEyeMask;
                                });
                              },
                              color: kWhiteColor,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Password";
                            } else if (value.length < 8) {
                              return "Minimum 8 characters required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: hm * 0.031, bottom: hm * 0.035),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                WidgetSpan(
                                    child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      checkboxvalue = !checkboxvalue;
                                      // _onFormSubmit();
                                    });
                                  },
                                  child: Container(
                                    height: 22,
                                    width: 22,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: kdarkGreyclr,
                                        border: Border.all(
                                            color: checkboxvalue
                                                ? kblueColor
                                                : kBlackColor,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: checkboxvalue
                                        ? const Icon(
                                            Icons.done,
                                            size: 20,
                                            color: Colors.blue,
                                          )
                                        : const SizedBox(
                                            height: 0,
                                          ),
                                  ),
                                )),
                                TextSpan(text: "  Remember Me ", style: textW)
                              ])),
                              loading == true
                                  ? circleloader
                                  : DefaultEButton(
                                      width: wm * 0.21,
                                      height: hm * 0.065,
                                      press: () async {
                                        if (_formkey.currentState!.validate()) {
                                          if (checkboxvalue == true) {
                                            Preference.pref.setBool(
                                                "CheckboxClicked", true);
                                            Preference.pref.setString(
                                                "RememberName",
                                                userController.text);
                                            Preference.pref.setString(
                                                "RememberPass",
                                                lpasscontroller.text);
                                          } else {
                                            Preference.pref.setBool(
                                                "CheckboxClicked", false);
                                          }
                                          isNewUser = false;
                                          setState(() {
                                            loading = true;
                                          });

                                          await fetchLoginData(
                                            context,
                                            userController.text.toString(),
                                            lpasscontroller.text.toString(),
                                          ).then((value) {
                                            snackbr(
                                                context, apiLmsg, kCyanColor);
                                          }).whenComplete(() {
                                            if (apiLstatus == 200) {
                                              replaceRoute(context,
                                                  HomeNav(selectindex: 1));
                                            }
                                          });
                                          setState(() {
                                            loading = false;
                                          });
                                        }
                                      },

                                      color: kcolorlogin,
                                      radius: 6,

                                      // snackbr(context, apiLmsg, kWhiteColor);

                                      child: Text(
                                        "Log in",
                                        style: textW.copyWith(fontSize: 16),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: SocialBttn(
                              color: kcolorfacebook,
                              iconS: Icons.facebook_outlined,
                              press: () async {
                                await AuthService.facebookLogin();
                              },
                              text: " Facebook",
                            )),
                        SizedBox(
                          height: hm * 0.015,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SocialBttn(
                              iconS: FontAwesome5.google,
                              text: " Google",
                              press: () async {
                                await AuthService.googleLogin();
                              },
                              color: kcolorgoogle),
                        ),
                        // SizedBox(
                        //   height: hm * 0.015,
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      // left: wm * 0.05,
                      // right: wm * 0.05,
                      // top: hm * 0.015,
                      bottom: hm * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {
                            pushTo(context, const Register());
                          },
                          child: Text(
                            "Register |",
                            style: textW,
                          )),
                      // GestureDetector(
                      //     onTap: () {
                      //       pushTo(context, const Register());
                      //     },
                      //     child: Text(
                      //       'Register | ',
                      //       style: textW,
                      //     )),
                      TextButton(
                          autofocus: true,
                          onPressed: () {
                            pushTo(context, const ForgotPassword());
                          },
                          child: Text(
                            "Lost your Password?",
                            style: textW,
                          )),
                      // InkWell(
                      //     onTap: () {
                      //       pushTo(context, const ForgotPassword());
                      //     },
                      //     child: Text(
                      //       'Lost your Password?',
                      //       style: textW,
                      //     )),
                    ],
                  ),
                ),
                Center(
                    child: TextButton(
                        child: Text('Privacy Policy.',
                            style: textW.copyWith(
                              color: kblueColor,
                            )),
                        onPressed: () {}))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

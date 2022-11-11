import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:letslokal/Services/SocialLogin/authService.dart';
import 'package:letslokal/Services/auth.dart';
import 'package:letslokal/components/components.dart';
import 'package:letslokal/main.dart';
import 'package:letslokal/screens/OnBoarding/congratulationPage.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:letslokal/utils/dfttextformfield.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import '../../utils/constant/images.dart';
import '../../utils/styleguide/textstyle.dart';
import '../Homenav/homenav.dart';
import 'login-screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();

  bool isChecked = false;
  bool isPass = false;
  bool isCpass = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();

  bool isEmail(String input) => EmailValidator.validate(input);

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: hm * 0.04, bottom: hm * 0.04),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            isNewUser == true;
                            replaceRoute(context, HomeNav(selectindex: 1));
                          },
                          child: Text('Skip', style: title))),
                ),
                Image.asset(logoLetsLokal, height: hm * 0.1, width: wm * 0.4),
                Padding(
                  padding: EdgeInsets.only(top: hm * 0.01, bottom: hm * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: hm * 0.025,
                        width: wm * 0.014,
                        color: kcolorlogin,
                      ),
                      SizedBox(
                        width: wm * 0.054,
                      ),
                      Text(
                        'Register For This App',
                        style: title,
                      ),
                    ],
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(wm * 0.045),
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
                          padding: EdgeInsets.only(bottom: hm * 0.005),
                          child: Text('Name', style: textW),
                        ),
                        TextFormField(
                          controller: nameController,
                          style: const TextStyle(color: kWhiteColor),
                          cursorColor: kWhiteColor,
                          decoration: txtffInputDeco(context),
                          validator: (nameController) {
                            if (nameController!.isEmpty ||
                                nameController.trim().isEmpty) {
                              return "Please Enter Name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: hm * 0.005, top: hm * 0.02),
                          child: Text('Username', style: textW),
                        ),
                        TextFormField(
                          controller: userNameController,
                          style: const TextStyle(color: kWhiteColor),
                          cursorColor: kWhiteColor,
                          decoration: txtffInputDeco(context),
                          validator: (nameController) {
                            if (nameController!.isEmpty ||
                                nameController.trim().isEmpty) {
                              return "Please Enter Username";
                            } else {
                              return null;
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: hm * 0.02, bottom: hm * 0.005),
                          child: Text('Email', style: textW),
                        ),
                        TextFormField(
                            controller: emailController,
                            style: const TextStyle(color: kWhiteColor),
                            cursorColor: kWhiteColor,
                            decoration: txtffInputDeco(context),
                            validator: ((emailController) {
                              if (emailController!.isEmpty) {
                                return "Please enter Email";
                              } else if (!isEmail(emailController)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            })),
                        Padding(
                          padding: EdgeInsets.only(
                              top: hm * 0.02, bottom: hm * 0.005),
                          child: Text('Password', style: textW),
                        ),
                        TextFormField(
                          obscureText: isPass ? false : true,
                          controller: passwordController,
                          style: const TextStyle(color: kWhiteColor),
                          cursorColor: kWhiteColor,
                          decoration: txtffSiffixDeco(
                            context,
                            // Suffix Icon
                            IconButton(
                              icon: isPass
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                              onPressed: () {
                                setState(() {
                                  isPass = !isPass;
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
                              left: 2, top: hm * 0.02, bottom: hm * 0.005),
                          child: Text('Confirm Password ', style: textW),
                        ),
                        TextFormField(
                            obscureText: isCpass ? false : true,
                            controller: cpasswordController,
                            style: const TextStyle(color: kWhiteColor),
                            cursorColor: kWhiteColor,
                            decoration: txtffSiffixDeco(
                              context,

                              // Suffix Icon code
                              IconButton(
                                icon: isCpass
                                    ? const Icon(Icons.visibility_outlined)
                                    : const Icon(Icons.visibility_off_outlined),
                                color: kWhiteColor,
                                onPressed: () {
                                  setState(() {
                                    isCpass = !isCpass;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Confirm Password";
                              } else if (value.length < 8) {
                                return "Minimum 8 characters required";
                              } else if (value != passwordController.text) {
                                return "Password and confirm password does not match";
                              }
                              return null;
                            }),
                        SizedBox(
                          height: hm * 0.01,
                        ),
                        Text(
                            'Registration confrirmation will be emailed to you.',
                            style: textW),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                              padding: EdgeInsets.only(
                                  top: hm * 0.031, bottom: hm * 0.035),
                              child: loading == true
                                  ? circleloader
                                  : DefaultEButton(
                                      width: wm * 0.26,
                                      height: hm * 0.065,
                                      press: () async {
                                        if (_formkey.currentState!.validate()) {
                                          isNewUser = false;
                                          setState(() {
                                            loading = true;
                                          });
                                          await fetchsignUpData(
                                                  context,
                                                  nameController.text
                                                      .toString(),
                                                  userNameController.text
                                                      .toString(),
                                                  passwordController.text
                                                      .toString(),
                                                  emailController.text
                                                      .toString())
                                              .then(
                                            (value) {
                                              snackbr(
                                                  context, apiSmsg, kGreyColor);
                                            },
                                          ).whenComplete(() {
                                            if (apiRegstatus == 200) {
                                              replaceRoute(context,
                                                  const CongratulationPage());
                                            }
                                          });

                                          setState(() {
                                            loading = false;
                                          });
                                        } else if (nameController
                                                .text.isEmpty &&
                                            userNameController.text.isEmpty &&
                                            emailController.text.isEmpty &&
                                            passwordController.text.isEmpty &&
                                            cpasswordController.text.isEmpty) {
                                          snackbr(
                                              context,
                                              "All fields are required",
                                              Colors.red);
                                        }
                                      },
                                      color: kcolorlogin,
                                      radius: 6,
                                      child: Text(
                                        "Register",
                                        style: textW.copyWith(fontSize: 16),
                                      ),
                                    )),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: SocialBttn(
                              color: kcolorfacebook,
                              iconS: Icons.facebook_outlined,
                              press: () async {
                                AuthService.facebookLogin();
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(
                          // left: wm * 0.05,
                          // right: wm * 0.05,
                          // top: hm * 0.015,
                          bottom: hm * 0.015),
                      child: TextButton(
                          onPressed: () {
                            pushTo(context, const LoginPage());
                          },
                          child: Text(
                            "Log in ",
                            style: textW,
                          ))),
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

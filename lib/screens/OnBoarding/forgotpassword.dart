import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:letslokal/screens/OnBoarding/register.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';

import '../../utils/dftbutton.dart';
import 'login-screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  static String email = 'fredrik.eilertsen@gail.com';
  final bool isValid = EmailValidator.validate(email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      // appBar: myAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: wm * 0.07, right: wm * 0.07),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                // Center(
                //   child: Image.asset(
                //     'assets/image-png/logolokal.png',
                //     height: hm * 0.15,
                //     width: wm * 0.4,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: hm * 0.05),
                  child: Text('Forgot Password?',
                      style: textW.copyWith(fontSize: 30)),
                ),
                SizedBox(
                  height: hm * 0.02,
                ),
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: kBlackColor),
                  cursorColor: kBlackColor,
                  decoration: InputDecoration(
                      hintText: "Email*",
                      contentPadding: const EdgeInsets.all(10),
                      fillColor: kWhiteColor,
                      focusColor: kWhiteColor,
                      filled: true,
                      focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Please enter Email";
                    } else if (isValid) {}
                    return "Please enter a valid email";
                  }),
                ),
                SizedBox(
                  height: hm * 0.02,
                ),
                DefaultEButton(
                  width: double.infinity,
                  height: hm * 0.07,
                  radius: 8,
                  press: () {
                    if (_formkey.currentState!.validate()) {}
                  },
                  color: kcolorlogin,
                  child: Center(
                      child: Text(
                    "SUBMIT",
                    style: textW.copyWith(fontSize: 18),
                  )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: hm * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            pushTo(context, const LoginPage());
                          },
                          child: Text(
                            "Login",
                            style: textW.copyWith(color: kcolorlogin),
                          )),
                      InkWell(
                          onTap: () {
                            pushTo(context, const Register());
                          },
                          child: Text("Create account",
                              style: textW.copyWith(color: kcolorlogin))),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

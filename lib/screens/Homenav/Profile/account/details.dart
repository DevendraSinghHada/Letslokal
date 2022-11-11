import 'package:dotted_border/dotted_border.dart';
import 'package:letslokal/Services/auth.dart';
import 'package:letslokal/components/components.dart';
import 'package:letslokal/main.dart';
import 'package:letslokal/screens/Homenav/Profile/account/delete.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _formkey = GlobalKey<FormState>();

  bool isCurrent = false;
  bool isNew = false;
  bool isConfirm = false;

  bool isMadeChanges = false;
  // controller for name field
  TextEditingController nameController =
      TextEditingController(text: Preference.pref.getString("username") ?? "");

  // controller for diplay name field
  TextEditingController displayNameController =
      TextEditingController(text: Preference.pref.getString("name") ?? "");

  // controller for Current Password
  TextEditingController currentPassController = TextEditingController();

  // controller for new password
  TextEditingController newPassController = TextEditingController();

  //controller for confirm new password
  TextEditingController newCPassController = TextEditingController();

  @override
  void initState() {
    // updateProfileData(Preference.pref.getString("ID") ?? "",
    //     displayNameController.text.toString(), nameController.text.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(top: hm * 0.02),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: hm * 0.05,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: " Display name", style: ffText),
                TextSpan(text: "*", style: ffText.copyWith(color: kredColor))
              ])),
              SizedBox(
                height: hm * 0.01,
              ),
              TextFormField(
                  controller: displayNameController,
                  style: pelletStyle,
                  onChanged: (value) {
                    isMadeChanges = true;
                  },
                  cursorColor: kWhiteColor,
                  decoration: txtffDec()),
              SizedBox(
                height: hm * 0.05,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "User name", style: ffText),
                TextSpan(text: "*", style: ffText.copyWith(color: kredColor))
              ])),
              SizedBox(
                height: hm * 0.01,
              ),
              TextFormField(
                  // initialValue: Preference.pref.getString("name"),
                  controller: nameController,
                  readOnly: true,
                  style: pelletStyle,
                  cursorColor: kWhiteColor,
                  decoration: txtffDec()),
              SizedBox(
                height: hm * 0.01,
              ),
              Text(
                "This will be how your name will be displayed in the account section and in reviews",
                style: pelletStyle,
              ),
              SizedBox(
                height: hm * 0.05,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "Email address", style: ffText),
                TextSpan(text: "*", style: ffText.copyWith(color: kredColor))
              ])),
              SizedBox(
                height: hm * 0.01,
              ),
              TextFormField(
                  readOnly: true,
                  initialValue: Preference.pref.getString("email"),
                  style: pelletStyle,
                  cursorColor: kWhiteColor,
                  decoration: txtffDec()),
              SizedBox(
                height: hm * 0.05,
              ),
              Stack(children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: wm * 0.035, bottom: wm * 0.035),
                  child: DottedBorder(
                      radius: const Radius.circular(4),
                      color: kWhiteColor.withOpacity(0.2),
                      borderType: BorderType.Rect,
                      child: Padding(
                        padding: EdgeInsets.all(wm * 0.06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Current password (leave blank to leave unchanged)",
                              style: ffText,
                            ),
                            SizedBox(
                              height: hm * 0.01,
                            ),
                            TextFormField(
                              controller: currentPassController,
                              obscureText: isCurrent ? false : true,
                              style: pelletStyle,
                              cursorColor: kWhiteColor,
                              onChanged: (value) {
                                isMadeChanges = true;
                              },
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "Please enter old password";
                              //   }
                              // },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isCurrent
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  color: kWhiteColor,
                                  onPressed: () {
                                    setState(() {
                                      isCurrent = !isCurrent;
                                    });
                                  },
                                ),
                                focusColor: kWhiteColor,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ktextfildecolor, width: 2.0),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: ktextfildecolor, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: ktextfildecolor, width: 2.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: hm * 0.06,
                            ),
                            Text(
                              "New password (leave blank to leave unchanged)",
                              style: ffText,
                            ),
                            SizedBox(
                              height: hm * 0.01,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: newPassController,
                              obscureText: isNew ? false : true,
                              style: pelletStyle,
                              cursorColor: kWhiteColor,
                              onChanged: (value) {
                                isMadeChanges = true;
                              },
                              // validator: (value) {
                              //   if (newPassController.text.length < 3) {
                              //     return "Very Weak - Please enter a strong password";
                              //   } else if (newPassController.text.length < 6) {
                              //     return "Weak - Please enter a stronger password";
                              //   } else if (newPassController.text.length < 10) {
                              //     return "Medium";
                              //   }
                              // },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      isNew
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: kWhiteColor),
                                  onPressed: () {
                                    setState(() {
                                      isNew = !isNew;
                                    });
                                  },
                                ),
                                focusColor: kWhiteColor,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ktextfildecolor, width: 2.0),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: ktextfildecolor, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: ktextfildecolor, width: 2.0),
                                ),
                              ),
                            ),
                            SizedBox(height: hm * 0.06),
                            Text(
                              "Confirm new password",
                              style: ffText,
                            ),
                            SizedBox(
                              height: hm * 0.01,
                            ),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: (value) {
                                isMadeChanges = true;
                              },
                              controller: newCPassController,
                              obscureText: isConfirm ? false : true,
                              style: pelletStyle,
                              cursorColor: kWhiteColor,
                              // validator: (value) {
                              //   if (newPassController.text !=
                              //       newCPassController.text) {
                              //     return "Password do not match";
                              //   }

                              //   // if (newCPassController.text ==
                              //   //     newPassController.text) {
                              //   // } else
                              //   //   return "Password do not match";
                              // },
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10),
                                suffixIcon: IconButton(
                                  icon: Icon(isConfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  color: kWhiteColor,
                                  onPressed: () {
                                    setState(() {
                                      isConfirm = !isConfirm;
                                    });
                                  },
                                ),
                                focusColor: kWhiteColor,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: ktextfildecolor, width: 2.0),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: ktextfildecolor, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: ktextfildecolor, width: 2.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Positioned(
                  left: wm * 0.032,
                  top: 0,
                  child: Container(
                    height: hm * 0.035,
                    width: wm * 0.35,
                    margin: const EdgeInsets.only(bottom: 10, right: 5),
                    // margin: EdgeInsets.only(bottom: 0),
                    color: kBlackColor,
                    child: Center(
                      child: Text(
                        "Password change",
                        style: ffText,
                      ),
                    ),
                  ),
                )
              ]),
              Padding(
                padding: EdgeInsets.only(top: hm * 0.03, bottom: hm * 0.05),
                child: loading
                    ? circleloader
                    : DefaultEButton(
                        width: wm * 0.34,
                        height: hm * 0.06,
                        radius: 12,
                        press: () async {
                          if (_formkey.currentState!.validate()) {
                            if (isMadeChanges == true) {
                              setState(() {
                                loading = true;
                              });

                              await updateProfileData(
                                      Preference.pref.getString("ID"),
                                      displayNameController.text.toString(),
                                      nameController.text.toString(),
                                      currentPassController.text.toString(),
                                      newPassController.text.toString())
                                  .whenComplete(() {
                                setState(() {});
                              }).whenComplete(() => snackbr(
                                      context,
                                      "Profile updated Successfuly",
                                      kgreenclr));
                              // .whenComplete(
                              //   () {
                              //     if (displayNameController.text.isEmpty &&
                              //         currentPassController.text.isEmpty ||
                              //         newPassController.text.isEmpty ||
                              //         newCPassController.text.isEmpty) {
                              //       snackbr(
                              //           context,
                              //           "Please enter details to edit",
                              //           kredColor);
                              //     } else {
                              //       snackbr(context, "Profile Updated Successfully", kgreenclr);
                              //     }
                              //   },
                              // );
                              setState(() {
                                loading = false;
                              });
                            } else {
                              snackbr(context, "Please enter details to edit",
                                  kredColor);
                            }
                          }
                        },
                        color: kbttnColor,
                        child: Center(
                          child: Text(
                            "Save changes",
                            style: title,
                          ),
                        ),
                      ),
              ),
              DefaulatOBtn(
                  width: wm * 0.34,
                  fontSize: 12,
                  RadiusClr: kWhiteColor.withOpacity(0.4),
                  height: hm * 0.04,
                  text: "Delete account",
                  radius: 16,
                  press: () {
                    pushTo(context, const Delete());
                  },
                  textClr: kWhiteColor.withOpacity(0.4),
                  color: kBlackColor),
            ],
          ),
        ),
      ),
    );
  }
}

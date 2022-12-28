import 'package:letslokal/main.dart';
import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/utils/constant/images.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/screens/Homenav/Profile/account/edit-profile.dart';
import 'package:flutter/material.dart';

import 'package:fluttericon/brandico_icons.dart';
import '../../../utils/styleguide/textstyle.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     isFilled;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // var a=Preference.pref.getString("fbUrl")?.isNotEmpty;
    // print(a.toString());
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, true),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: hm * 0.03, top: hm * 0.03, right: wm * 0.03),
          child: Column(
            children: [
              CircleAvatar(
                minRadius: hm * 0.08,
                backgroundColor: kWhiteColor,
                child: CircleAvatar(
                  minRadius: hm * 0.075,
                  foregroundImage: const AssetImage(
                    profileImage,
                  ),
                ),
              ),
              SizedBox(
                height: hm * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Preference.pref.getString("name") ?? "",
                    style: const TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  SizedBox(
                    width: wm * 0.03,
                  ),
                  InkWell(
                    onTap: () {
                      pushTo(context, const EditProfile());
                    },
                    child: CircleAvatar(
                      minRadius: hm * 0.019,
                      backgroundColor: kWhiteColor,
                      child: CircleAvatar(
                          minRadius: hm * 0.017,
                          backgroundColor: ktextfildecolor,
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: kWhiteColor,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Container(
                padding: const EdgeInsets.all(1),
                height: hm * 0.07,
                // width: wm * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ktextfildecolor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Visibility(
                  visible: Preference.pref.getString("fbUrl")?.isNotEmpty ?? false,
                  child: Icon(
                        Icons.facebook_outlined,
                        color:
                            //  isFilled == true ?
                            kWhiteColor,
                        //  :
                        //  kWhiteColor,
                        size: hm * 0.04,
                      ),
                ),
                   Preference.pref.getString("twitterUrl")?.isEmpty ?? true ?  Container() : const Icon(
                      Brandico.twitter_bird,
                      color: kWhiteColor,
                      size: 20,
                    ) ,
                Preference.pref.getString("instaUrl")?.isEmpty ?? true ?   Container() :  const Icon(
                      Brandico.instagram_1,
                      color: kWhiteColor,
                      size: 20,
                    ) ,
                  Preference.pref.getString("tiktokUrl")?.isEmpty ?? true ? Container() :  Icon(
                      Icons.tiktok,
                      color: kWhiteColor,
                      size: hm * 0.04,
                    ) 
                  ],
                ),
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: hm * 0.18,
                width: wm * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ktextfildecolor,
                ),
                child: Column(
                  children: [
                    Text(
                      'RANK',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: hm * 0.040,
                          fontWeight: FontWeight.w600,
                          fontFamily: "BalooBhai2"),
                    ),
                    Text(
                      '-',
                      style: TextStyle(
                          color: kWhiteColor,
                          fontSize: hm * 0.040,
                          fontWeight: FontWeight.w600,
                          fontFamily: "BalooBhai2"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: hm * 0.13,
                width: wm * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ktextfildecolor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'EXP',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: hm * 0.019,
                              ),
                            ),
                            const Text(
                              '-',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 29,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'JOINED',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: hm * 0.019,
                              ),
                            ),
                            const Text(
                              '-',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 29,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'USERID',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: hm * 0.019,
                              ),
                            ),
                            const Text(
                              '-',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 29,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
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

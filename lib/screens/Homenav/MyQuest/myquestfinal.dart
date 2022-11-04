import 'package:letslokal/Model/myQuests.dart';
import 'package:letslokal/Services/auth.dart';
import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/screens/Homenav/Quests/quest.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';

import 'package:flutter/material.dart';

import 'quest_outbreak/quest_outbreak.dart';

class MyWishlist extends StatefulWidget {
  const MyWishlist({Key? key}) : super(key: key);

  @override
  State<MyWishlist> createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  final ScrollController _controller = ScrollController();

  MyQuests myQuests = MyQuests();

  @override
  void initState() {
    myQuest(Preference.pref.getString("userId") ?? "")
        .then((value) => myQuests = value);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size = MediaQuery.of(context).size;
    hm = Size.height;
    wm = Size.width;
    return Scaffold(
      appBar: myAppBar(context, false),
      backgroundColor: kBlackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: hm * 0.03, top: hm * 0.03, right: wm * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'My Quest',
                  style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: hm * 0.050,
                      fontFamily: "balooBhai2"),
                ),
              ),
              SizedBox(
                height: hm * 0.04,
              ),
              GridView.builder(
                  itemCount: 2,
                  // itemCount: myQuests.data!.length
                  //  lqdata.data!.length

                  shrinkWrap: true,
                  controller: _controller,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: (() {}),
                        child: Container(
                            // height: hm * 0.75,
                            width: wm * 0.44,
                            decoration: BoxDecoration(
                              color: ktextfildecolor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(wm * 0.035),
                                    child: Container(
                                      height: wm * 0.4,
                                      width: wm * 0.5,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/image-png/testimage.jpg"),
                                              // NetworkImage(lqdata.data!
                                              //     .elementAt(index)
                                              //     .productImage!),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: hm * 0.012,
                                    ),
                                    child: Text(
                                      // lqdata.data!
                                      //     .elementAt(index)
                                      //     .productName!
                                      " Quests Name",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: kWhiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: hm * 0.020,
                                      ),
                                    ),
                                  ),
                                ])));
                  }),
              Padding(
                padding: EdgeInsets.only(top: hm * 0.1, bottom: hm * 0.014),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: wm * 0.28,
                      height: hm * 0.065,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          onSurface: kWhiteColor,
                          side: const BorderSide(color: kWhiteColor, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "More Quests",
                          style: textW.copyWith(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          pushTo(context, HomeNav(selectindex: 4));
                        },
                      ),
                    ),
                    SizedBox(
                      width: wm * 0.035,
                    ),
                    SizedBox(
                      width: wm * 0.28,
                      height: hm * 0.065,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          onSurface: kWhiteColor,
                          side: const BorderSide(color: kWhiteColor, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Report Issue",
                          style: textW.copyWith(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          pushTo(context, HomeNav(selectindex: 4));
                        },
                      ),
                    )

                    //// when quest isn't purchased
                    // Center(
                    //   child: SizedBox(
                    //     width: wm * 0.4,
                    //     height: hm * 0.065,
                    //     child: OutlinedButton(
                    //       style: OutlinedButton.styleFrom(
                    //         onSurface: kWhiteColor,
                    //         side: const BorderSide(color: kWhiteColor, width: 1),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(30),
                    //         ),
                    //       ),
                    //       child: Text(
                    //         "How it Works",
                    //         style: textW.copyWith(
                    //             fontSize: 16, fontWeight: FontWeight.bold),
                    //       ),
                    //       onPressed: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //                 builder: ((context) => const quest_outbreak())));
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: hm * 0.09,
                    // ),

                    // Center(
                    //   child: Text(
                    //       'You have not booked any quest, join a quest now and explore a city.',
                    //       textAlign: TextAlign.center,
                    //       style: textW.copyWith(
                    //           color: kWhiteColor.withOpacity(0.8), fontSize: 20)),
                    // ),
                    // SizedBox(
                    //   height: hm * 0.08,
                    // ),
                    // Center(
                    //   child: SizedBox(
                    //     width: wm * 0.4,
                    //     height: hm * 0.065,
                    //     child: OutlinedButton(
                    //       style: OutlinedButton.styleFrom(
                    //         onSurface: kWhiteColor,
                    //         side: const BorderSide(color: kWhiteColor, width: 1),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(30),
                    //         ),
                    //       ),
                    //       child: Text(
                    //         "More Quests",
                    //         style: textW.copyWith(
                    //             fontSize: 16, fontWeight: FontWeight.bold),
                    //       ),
                    //       onPressed: () {
                    //         pushTo(context, HomeNav(selectindex: 4));
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Text(
                "Quests expire 30 days after purchase",
                style: pelletStyle.copyWith(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

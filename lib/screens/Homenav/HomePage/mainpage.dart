import 'package:letslokal/Model/lokalQuest_Tips_Model.dart';
import 'package:letslokal/Services/auth.dart';
import 'package:letslokal/main.dart';
import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/screens/Homenav/HomePage/ranking.dart';
import 'package:letslokal/screens/Homenav/HomePage/webview_tips.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/screens/Homenav/HomePage/webview_quest.dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/screens/Homenav/HomePage/how_to_joine.dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../components/components.dart';
import '../../../utils/constant/screennavigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //bool for expanding tips on view more button in the end of the screen
  bool isTipsExpand = false;

  // bool for Showing Loader
  bool isloading = true;

  final ScrollController _controller = ScrollController();

  LQdata lqdata = LQdata();

  @override
  void initState() {
    fetchLQdata(Preference.pref.getString("ID") ?? "").then((value) {
      lqdata = value;
      setState(() {
        isloading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    // hm = size.height;
    // wm = size.width;
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, false),
      body: SingleChildScrollView(
        child: isloading
            ? Center(
                child: Padding(
                padding: EdgeInsets.only(top: hm * 0.35),
                child: circleloader,
              ))
            : Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: hm * 0.03, top: hm * 0.03, right: wm * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          'Be an',
                          style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: hm * 0.080,
                              fontFamily: "BalooBhai2",
                              height: 1.5),
                        ),
                      ),
                      FittedBox(
                        child: GradientText(
                          'adventurer',
                          style: TextStyle(
                              fontSize: hm * 0.080,
                              fontWeight: FontWeight.bold,
                              fontFamily: "balooBhai2",
                              height: 01.05),
                          gradientType: GradientType.radial,
                          colors: const [korangeClr, kyColor, kredColor],
                        ),
                      ),
                      Text('Explore cities with scavenger hunts',
                          style: textAcc.copyWith(fontSize: 20)),
                      Padding(
                        padding:
                            EdgeInsets.only(top: hm * 0.02, bottom: hm * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DefaultEButton(
                              width: wm * 0.27,
                              height: hm * 0.045,
                              radius: 12,
                              press: () {
                                pushTo(context, HomeNav(selectindex: 4));
                              },
                              color: ktextfildecolor,
                              child: Text(
                                "Quests",
                                style: textW,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: wm * 0.02, left: wm * 0.02),
                              child: DefaultEButton(
                                width: wm * 0.27,
                                height: hm * 0.045,
                                radius: 12,
                                press: () {
                                  print("Button Pushed");

                                  isNewUser
                                      ? loginDialogue(context)
                                      : ranking(
                                              Preference.pref
                                                  .getString("userId"),
                                              context)
                                          .then(((value) {
                                          value = myUrl;
                                          pushTo(context, Ranking(url: myUrl));
                                        }));

                                  // pushTo(context, const GlobleRanking());
                                },
                                color: ktextfildecolor,
                                child: Text(
                                  "Ranking",
                                  style: textW,
                                ),
                              ),
                            ),
                            DefaultEButton(
                              width: wm * 0.27,
                              height: hm * 0.045,
                              radius: 12,
                              press: () {
                                pushTo(context, const HowtoJoine());
                              },
                              color: ktextfildecolor,
                              child: Text(
                                "How?",
                                style: textW,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: hm * 0.03, bottom: hm * 0.01),
                        child: FittedBox(
                          child: Text(
                            'Lokal Quests | Treasure hunts in \ncities',
                            style: lokalQTstyle.copyWith(
                                color: kWhiteColor, fontFamily: "balooBhai2"),
                          ),
                        ),
                      ),
                      GridView.builder(
                          itemCount: lqdata.data!.length <= 4
                              ? lqdata.data!.length
                              : 4,
                          shrinkWrap: true,
                          controller: _controller,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.48,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 25),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                pushTo(
                                    context,
                                    WebViewQuests(
                                      title: lqdata.data!
                                          .elementAt(index)
                                          .productName
                                          .toString(),
                                      url: lqdata.data!
                                          .elementAt(index)
                                          .link
                                          .toString(),
                                    ));

                                print("Pressed");
                              },
                              child: Container(
                                // height: hm * 0.75,
                                width: wm * 0.44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: wm * 0.5,
                                        width: wm * 0.5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(lqdata.data!
                                                    .elementAt(index)
                                                    .productImage!),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: hm * 0.012,
                                            ),
                                            child: Text(
                                              lqdata.data!
                                                  .elementAt(index)
                                                  .productName!,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(
                                                color: kWhiteColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: hm * 0.020,
                                              ),
                                            ),
                                          ),
                                          Text(
                                              '€${lqdata.data!.elementAt(index).price!} / group',
                                              overflow: TextOverflow.ellipsis,
                                              style: title.copyWith(
                                                  height: 2,
                                                  color: kWhiteColor
                                                      .withOpacity(0.60))),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                lqdata.data!
                                                    .elementAt(index)
                                                    .category
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: kWhiteColor
                                                      .withOpacity(0.80),
                                                  fontSize: hm * 0.018,
                                                ),
                                              ),
                                              IconButton(
                                                constraints:
                                                    const BoxConstraints(
                                                        maxHeight: 20),
                                                splashRadius: 25,
                                                onPressed: () {
                                                  print(
                                                      " this tapped ${lqdata.data!.elementAt(index).productId!} ");

                                                  Preference.pref.setInt(
                                                    "add_to_wishlist",
                                                    lqdata.data!
                                                        .elementAt(index)
                                                        .productId!,
                                                  );

                                                  // if(lqdata.data!.elementAt(index).isWishlist == 0){

                                                  isNewUser
                                                      ? loginDialogue(context)
                                                      : addTofav(
                                                              context,
                                                              Preference.pref
                                                                  .getString(
                                                                      "userId"),
                                                              Preference.pref
                                                                  .getInt(
                                                                      "add_to_wishlist"))
                                                          .then(
                                                          (value) {
                                                            if (lqdata.data!
                                                                    .elementAt(
                                                                        index)
                                                                    .isWishlist ==
                                                                1) {
                                                              return setState(
                                                                  () {
                                                                lqdata.data!
                                                                    .elementAt(
                                                                        index)
                                                                    .isWishlist = 0;
                                                              });
                                                            } else {
                                                              return setState(
                                                                  () {
                                                                lqdata.data!
                                                                    .elementAt(
                                                                        index)
                                                                    .isWishlist = 1;
                                                              });
                                                            }
                                                          },
                                                        );
                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                  lqdata.data!
                                                              .elementAt(index)
                                                              .isWishlist ==
                                                          0
                                                      ? Icons.favorite_border
                                                      : Icons.favorite,
                                                  color: lqdata.data!
                                                              .elementAt(index)
                                                              .isWishlist ==
                                                          0
                                                      ? kWhiteColor
                                                      : kredColor,
                                                  size: 20,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      Padding(
                        padding: EdgeInsets.only(top: hm * 0.04),
                        child: Center(
                          child: DefaultEButton(
                            width: wm * 0.25,
                            height: hm * 0.055,
                            radius: 12,
                            press: () {
                              pushTo(context, HomeNav(selectindex: 4));
                            },
                            color: ktextfildecolor,
                            child: Center(
                                child: Text(
                              "View all",
                              style: textW,
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: hm * 0.06,
                  ),
                  child: Container(
                    color: kWhiteColor,
                    // constraints: BoxConstraints(
                    //     maxHeight: isTipsExpand ? hm * 0.7 : hm * 0.5),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: hm * 0.03, top: hm * 0.03, right: wm * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lokal Tips | Highlights of cities',
                              style: lokalQTstyle.copyWith(
                                  fontFamily: "BalooBhai2")),
                          Padding(
                            padding: EdgeInsets.only(
                                top: hm * 0.04, bottom: hm * 0.08),
                            child: Container(
                              color: kWhiteColor,
                              child: GridView.builder(
                                  itemCount:
                                      isTipsExpand ? lqdata.post!.length : 2,
                                  shrinkWrap: true,
                                  controller: _controller,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.7,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 25),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        pushTo(
                                            context,
                                            WebViewTips(
                                                title: lqdata.post!
                                                    .elementAt(index)
                                                    .productName!,
                                                url: lqdata.post!
                                                    .elementAt(index)
                                                    .link!));
                                      },
                                      child: Container(
                                        width: wm * 0.44,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: kWhiteColor,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: kBlackColor
                                                      .withOpacity(0.20),
                                                  spreadRadius: 2,
                                                  blurRadius: 4)
                                            ]),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                height: hm * 0.20,
                                                width: wm * 0.5,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  8),
                                                          topRight:
                                                              Radius.circular(
                                                                  8)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        lqdata.post!
                                                            .elementAt(index)
                                                            .productImage!,
                                                      ),
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: wm * 0.02,
                                                  right: wm * 0.02,
                                                  top: wm * 0.02,
                                                ),
                                                child: Text(
                                                    lqdata.post!
                                                        .elementAt(index)
                                                        .productName!,
                                                    textAlign: TextAlign.center,
                                                    style: title.copyWith(
                                                        color: kBlackColor)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Center(
                            child: DefaulatOBtn(
                                width: wm * 0.25,
                                fontSize: 14,
                                RadiusClr: kBlackColor,
                                height: hm * 0.055,
                                text: isTipsExpand ? "View less" : "View more",
                                radius: 12,
                                press: () {
                                  isTipsExpand
                                      ? setState(() {
                                          isTipsExpand = false;
                                        })
                                      : setState(() {
                                          isTipsExpand = true;
                                        });
                                },
                                textClr: kBlackColor,
                                color: kWhiteColor),
                          ),
                          SizedBox(
                            height: hm * 0.04,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
      ),
    );
  }
}

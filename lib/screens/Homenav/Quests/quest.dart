import 'package:letslokal/Model/lokalQuest_Tips_Model.dart';
import 'package:letslokal/Services/auth.dart';
import 'package:letslokal/components/components.dart';
import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/screens/Homenav/HomePage/webview_quest.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:flutter/material.dart';

class MyQuest extends StatefulWidget {
  const MyQuest.quests({Key? key}) : super(key: key);

  @override
  State<MyQuest> createState() => _MyQuestState();
}

class _MyQuestState extends State<MyQuest> {
  final ScrollController _controller = ScrollController();

// var for showing loading indicator
  bool isQuestLoading = true;
  LQdata lQdata = LQdata();

  @override
  void initState() {
    fetchLQdata(Preference.pref.getString("ID") ?? "").then((value) {
      lQdata = value;
      setState(() {
        isQuestLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, false),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(wm * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Quests',
                  style:
                      textW.copyWith(fontSize: 34, fontFamily: "balooBhai2")),
              Padding(
                padding: EdgeInsets.only(top: hm * 0.01, bottom: hm * 0.055),
                child: Text(
                  'Explore cities with scavenger hounts',
                  style: textAcc.copyWith(color: kwhitedarkclr, fontSize: 20),
                ),
              ),
              isQuestLoading == true
                  ? circleloader
                  : GridView.builder(
                      itemCount: lQdata.data!.length,
                      shrinkWrap: true,
                      controller: _controller,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: wm / hm + 0.1,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 18),
                      itemBuilder: (BuildContext context, int index) {
                        print(wm / hm);
                        return GestureDetector(
                          onTap: () {
                            pushTo(
                                context,
                                WebViewQuests(
                                  title: lQdata.data!
                                      .elementAt(index)
                                      .productName
                                      .toString(),
                                  url: lQdata.data!
                                      .elementAt(index)
                                      .link
                                      .toString(),
                                ));
                          },
                          child: Container(
                            // height: hm * 0.15,
                            // width: wm * 0.44,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ktextfildecolor),
                            child: Padding(
                              padding: EdgeInsets.all(wm * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: hm * 0.27,
                                    width: wm * 0.5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              lQdata.data!
                                                  .elementAt(index)
                                                  .productImage!,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    height: hm * 0.01,
                                  ),
                                  Text(
                                    lQdata.data!.elementAt(index).productName!,
                                    style: ffText,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
            ],
          ),
        ),
      ),
    );
  }
}

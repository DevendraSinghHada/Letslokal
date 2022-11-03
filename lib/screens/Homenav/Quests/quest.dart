import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/utils/constant/images.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: wm * 0.045),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quests',
                style: textW.copyWith(fontSize: 34, fontFamily: "balooBhai2")),
            SizedBox(
              height: hm * 0.01,
            ),
            Text(
              'Explore cities with scavenger hounts',
              style: textAcc.copyWith(color: kwhitedarkclr, fontSize: 20),
            ),
            SizedBox(
              height: hm * 0.035,
            ),
            GridView.builder(
                itemCount: 2,
                shrinkWrap: true,
                controller: _controller,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.58,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 25),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: hm * 0.30,
                    width: wm * 0.44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: hm * 0.27,
                          width: wm * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(
                                    myQuestImage,
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          height: hm * 0.01,
                        ),
                        Text(
                          'Kuala Lumpur',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: hm * 0.019,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    ));
  }
}

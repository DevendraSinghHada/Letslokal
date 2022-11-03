import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/utils/dfttextformfield.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:flutter/material.dart';

class GlobleRanking extends StatefulWidget {
  const GlobleRanking({Key? key}) : super(key: key);

  @override
  State<GlobleRanking> createState() => _GlobleRankingState();
}

class _GlobleRankingState extends State<GlobleRanking> {
  final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size = MediaQuery.of(context).size;
    hm = Size.height;
    wm = Size.width;
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: wm * 0.03, right: wm * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Global Ranking',
                style: subtitatb,
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Container(
                  height: hm * 0.16,
                  width: wm * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ktextfildecolor,
                  ),
                  child: Image.asset(
                    'assets/image-png/tagimage7.jpg',
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: hm * 0.02,
              ),
              Text(
                'USER ID:',
                style: TextStyle(
                    fontSize: hm * 0.028, color: kWhiteColor.withOpacity(0.70)),
              ),
              SizedBox(
                height: hm * 0.015,
              ),
              DftSearch(
                  fillcolor: ktextfildecolor,
                  focuscolor: ktextfildecolor,
                  outbordercolor: ktextfildecolor,
                  borderradius: hm * 0.01),
              SizedBox(
                height: hm * 0.02,
              ),
              Table(
                defaultColumnWidth: FixedColumnWidth(
                  wm * 0.32,
                ),
                border: TableBorder.all(
                  color: ktextfildecolor,
                  style: BorderStyle.solid,
                ),
                children: [
                  TableRow(
                      decoration: const BoxDecoration(
                        color: kcolorlogin,
                      ),
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: kWhiteColor,
                                ),
                                Text('RANK',
                                    style: TextStyle(
                                        fontSize: hm * 0.018,
                                        color: kBlackColor))
                              ]),
                        ),
                        Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10),
                            child: Column(children: [
                              Text('BADGE',
                                  style: TextStyle(
                                    fontSize: hm * 0.018,
                                  ))
                            ])),
                        Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            child: Column(children: [
                              Text('NAME',
                                  style: TextStyle(
                                    fontSize: hm * 0.018,
                                  ))
                            ])),
                      ]),
                ],
              ),
              ListView.builder(
                  controller: _controller,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTile(
                      leading: const Icon(
                        Icons.add,
                        color: kWhiteColor,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      collapsedIconColor: ktextfildecolor,
                      title: SizedBox(
                        height: hm * 0.08,
                        width: hm * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '1',
                                style: subtital,
                              ),
                              Image.asset('assets/image-png/badge2.png'),
                              SizedBox(
                                width: wm * 0.01,
                              ),
                              Text(
                                'Danial',
                                style: subtital,
                              )
                            ],
                          ),
                        ),
                      ),
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Exp:',
                                  style: subsmalltital,
                                ),
                                SizedBox(
                                  width: wm * 0.02,
                                ),
                                Text(
                                  '250:90',
                                  style: subsmalltital,
                                ),
                              ],
                            ),
                            Divider(
                              color: kWhiteColor.withOpacity(0.50),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Joind:',
                                  style: subsmalltital,
                                ),
                                SizedBox(
                                  width: wm * 0.02,
                                ),
                                Text(
                                  '2',
                                  style: subsmalltital,
                                ),
                              ],
                            ),
                            Divider(
                              color: kWhiteColor.withOpacity(0.50),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Profile:',
                                  style: subsmalltital,
                                ),
                                SizedBox(
                                  width: wm * 0.02,
                                ),
                                Text(
                                  'View',
                                  style: subsmalltital,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    );
                  }),
              Text(
                'Ranking by Cities',
                style: subtitatb,
              ),
              SizedBox(
                height: hm * 0.04,
              ),
              Container(
                height: hm * 0.5,
                width: wm * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ktextfildecolor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: hm * 0.45,
                      width: wm * 1,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/image-png/test2.jpg',
                              ),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: hm * 0.01,
                    ),
                    Text(
                      'Kuala Lumpur',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: hm * 0.017,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hm * 0.02,
              ),
              Container(
                height: hm * 0.5,
                width: wm * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ktextfildecolor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: hm * 0.45,
                      width: wm * 1,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/image-png/bri.jpg',
                              ),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      height: hm * 0.01,
                    ),
                    Text(
                      'London',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: hm * 0.017,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: hm * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

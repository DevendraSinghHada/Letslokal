import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/screens/Homenav/MyQuest/quest_outbreak/ChatPage.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class quest_outbreak extends StatefulWidget {
  const quest_outbreak({Key? key}) : super(key: key);

  @override
  State<quest_outbreak> createState() => _quest_outbreakState();
}

class _quest_outbreakState extends State<quest_outbreak> {
  final List<Widget> _Pages = [
    const Out_one(),
    OutVideo(),
    const OutDetails(),
    const OutScoreAndRank(),
    const AlltheBest(),
  ];
  bool isShowButton = false;
  final controller = PageController();
  static const kDuration = Duration(milliseconds: 300);
  static const kCurve = Curves.ease;

  @override
  Widget build(BuildContext context) {
    Size = MediaQuery.of(context).size;
    hm = Size.height;
    wm = Size.width;
    return Scaffold(
        appBar: myAppBar(context, true),
        backgroundColor: kBlackColor,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: hm * 0.08),
                  child: Container(
                    height: hm * 0.5,
                    width: wm * 0.5,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        "assets/image-png/badge2.png",
                      ),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: hm * 0.7,
                width: wm,
                child: PageView.builder(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  pageSnapping: false,
                  itemCount: _Pages.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              index == 0
                                  ? const SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        controller.previousPage(
                                            duration: kDuration, curve: kCurve);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.arrow_upward_sharp,
                                            size: 22,
                                            color: kGreyColor,
                                          ),
                                          // SizedBox(
                                          //   width: wm * 0.01,
                                          // ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: wm * 0.01),
                                            child: const Text(
                                              "Back",
                                              style:
                                                  TextStyle(color: kGreyColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                              _Pages[index],
                              index == _Pages.length - 1
                                  ? SizedBox(
                                      height: hm * 0.065,
                                      width: wm * 0.17,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            onSurface: isShowButton
                                                ? kWhiteColor
                                                : kBlackColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: const BorderSide(
                                                    color: kGreyColor,
                                                    width: 3)),
                                          ),
                                          onPressed: isShowButton
                                              ? () {}
                                              : () {
                                                  setState(() {
                                                    isShowButton =
                                                        !isShowButton;
                                                  });
                                                  // controller.nextPage(
                                                  //     duration: kDuration, curve: kCurve);
                                                },
                                          child: Center(
                                            child: Text("Start",
                                                style: TextStyle(
                                                    color: isShowButton
                                                        ? kBlackColor
                                                        : kWhiteColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14)),
                                          )),
                                    )
                                  : SizedBox(
                                      height: hm * 0.06,
                                      width: wm * 0.23,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            onSurface: kbttnColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: const BorderSide(
                                                    color: kcolortrivango,
                                                    width: 3)),
                                          ),
                                          onPressed: () {
                                            controller.nextPage(
                                                duration: kDuration,
                                                curve: kCurve);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.arrow_downward,
                                                size: 16,
                                                color: kWhiteColor,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text("Next",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14)),
                                            ],
                                          )),
                                    ),
                              if (index == _Pages.length - 1)
                                isShowButton ? showButton() : const SizedBox()
                            ]));
                  },
                ),
              )
            ],
          ),
        ]));
  }

  showButton() {
    return Padding(
      padding: EdgeInsets.only(top: hm * 0.02),
      child: SizedBox(
        height: hm * 0.06,
        width: wm * 0.48,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              onSurface: kbttnColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: kcolortrivango, width: 3)),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const ChatPage()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.done,
                  size: 16,
                  color: kWhiteColor,
                ),
                SizedBox(
                  width: 4,
                ),
                Text("Contact Agent Ram",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
              ],
            )),
      ),
    );
  }
}

class Out_one extends StatelessWidget {
  const Out_one({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hm * 0.3,
      width: wm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: hm * 0.015,
          ),
          Image.asset(
            "assets/image-png/logolokal.png",
            height: hm * 0.07,
          ),
          SizedBox(
            height: hm * 0.020,
          ),
          Text.rich(TextSpan(children: [
            const TextSpan(
                text: "Outbreak\n",
                style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32)),
            WidgetSpan(
                child: SizedBox(
              height: hm * 0.02,
            )),
            const TextSpan(
                text: "Pasar Seni Scavenger Hunt\n",
                style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24)),
            WidgetSpan(
                child: SizedBox(
              height: hm * 0.015,
            )),
            const TextSpan(
                text: "By Letslokal",
                style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ])),
        ],
      ),
    );
  }
}

class OutVideo extends StatefulWidget {
  @override
  State<OutVideo> createState() => _OutVideoState();
}

class _OutVideoState extends State<OutVideo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlackColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: hm * 0.015,
        ),
        const Text("Introduction",
            style: TextStyle(
                color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 32)),
        SizedBox(
          height: hm * 0.015,
        ),
        FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
        IconButton(
          onPressed: () {
            setState(() {
              // pause
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // play
                _controller.play();
              }
            });
          },
          // icon
          icon: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            color: Colors.amber,
          ),
        ),
      ]),
    );
  }
}

class OutDetails extends StatelessWidget {
  const OutDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(
          text: "Details\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 32)),
      WidgetSpan(
          child: SizedBox(
        height: hm * 0.02,
      )),
      const TextSpan(
          text: "Start Point : Jalan Tun H.S Lee\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
      // WidgetSpan(
      //     child: SizedBox(
      //   height: hm * 0.01,
      // )),
      const TextSpan(
          text: "Start Time : Between 9am to 6 pm\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
      // WidgetSpan(
      //     child: SizedBox(
      //   height: hm * 0.015,
      // )),
      const TextSpan(
          text: "Walking Distance : 1.2km /0.8 miles\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
      // WidgetSpan(
      //     child: SizedBox(
      //   height: hm * 0.015,
      // )),
      const TextSpan(
          text: "Duration : 1 Hour\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
      // WidgetSpan(
      //     child: SizedBox(
      //   height: hm * 0.015,
      // )),
      const TextSpan(
          text: "Clues To Crack : 6\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
    ]));
  }
}

class OutScoreAndRank extends StatelessWidget {
  const OutScoreAndRank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      const TextSpan(
          text: "Score & Rank\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.bold, fontSize: 32)),
      WidgetSpan(
          child: SizedBox(
        height: hm * 0.02,
      )),
      const TextSpan(
          text: "Scoring System\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
      // WidgetSpan(
      //     child: SizedBox(
      //   height: hm * 0.01,
      // )),
      const TextSpan(
          text: "-You will be scored out of 100 based performance\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
      // WidgetSpan(
      //     child: SizedBox(
      //   height: hm * 0.015,
      // )),
      const TextSpan(
          text:
              "-Whene there's points to lose or gain, it will be noted at the bottom of the screen.\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
      WidgetSpan(
          child: SizedBox(
        height: hm * 0.065,
      )),
      const TextSpan(
          text: "Ranking system\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
      // WidgetSpan(
      //     child: SizedBox(
      //   height: hm * 0.015,
      // )),
      const TextSpan(
          text: "-Complete the whole trail to be scored\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
      const TextSpan(
          text: "-You can repeat but only the first will be in the ranking.\n",
          style: TextStyle(
              color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 14)),
    ]));
  }
}

class AlltheBest extends StatelessWidget {
  const AlltheBest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(TextSpan(children: [
          const TextSpan(
              text: "All The Best Devendra\n",
              style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32)),
          WidgetSpan(
              child: SizedBox(
            height: hm * 0.02,
          )),
          const TextSpan(
              text: "Note: Your tume will begin as soon as you start \n",
              style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)),
          WidgetSpan(
              child: SizedBox(
            height: hm * 0.04,
          )),
          const TextSpan(
              text:
                  "You have 70 minutes, each 5 minutes after 70 minutes will cost you 6 points",
              style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)),
          // WidgetSpan(
          //     child: SizedBox(
          //   height: hm * 0.015,
          // )),
        ])),
        SizedBox(
          height: hm * 0.035,
        )
      ],
    );
  }
}

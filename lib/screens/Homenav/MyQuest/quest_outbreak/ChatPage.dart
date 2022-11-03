import 'package:letslokal/screens/Homenav/MyQuest/quest_outbreak/AnimatedContainer/JumpingDots.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textcontroller = TextEditingController();
  _onFieldSubmitted(value) {
    setState(() {
      value = _textcontroller.text;
    });
  }
  // @override
  // void dispose() {
  //   setState(() {
  //     _textcontroller.dispose();
  //   });
  //   // TODO: implement
  //   // dispose
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size = MediaQuery.of(context).size;
    hm = Size.height;
    wm = Size.width;
    return Scaffold(
        backgroundColor: kBlackColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: hm * 0.18),
                        child: Container(
                          height: hm * 0.5,
                          width: wm * 0.5,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/image-png/logolokal.png"))),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: wm * 0.035,
                            right: wm * 0.035,
                            top: wm * 0.25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                                child: Text(
                              "Wednesday,August24,2022 at 2:33:48 PM",
                              style: TextStyle(color: Colors.red, fontSize: 13),
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: kWhiteColor,
                                  radius: 20,
                                  // backgroundImage: NetworkImage(
                                  //     "https://www.pngmart.com/files/15/Smiling-Business-Man-Standing-PNG-Image.png"),
                                ),
                                SizedBox(
                                  width: wm * 0.02,
                                ),
                                Container(
                                    width: wm * 0.55,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                            bottomRight: Radius.circular(30)),
                                        color: Colors.redAccent),
                                    child: Padding(
                                      padding: EdgeInsets.all(wm * 0.035),
                                      child: const Text(
                                          "Hey Devendra . I'm agent Ram, I was told that you are our best chance to stop Egor's vision"),
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: hm * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _textcontroller.hasListeners
                                    ? const JumpingDots()
                                    : Container(
                                        // width: 40,
                                        color: Colors.amber,
                                        child: Text(_textcontroller.text),
                                      ),
                                SizedBox(
                                  width: wm * 0.02,
                                ),
                                const CircleAvatar(
                                  backgroundColor: kWhiteColor,
                                  child: Center(
                                      child: Text(
                                    "you",
                                    style: TextStyle(
                                        color: kBlackColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Container(
                            //       // width: 40,
                            //       color: Colors.amber,
                            //       child: Text(_textcontroller.text),
                            //     ),
                            //   ],
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: hm * 0.016, bottom: hm * 0.016),
                              child: TextFormField(
                                  // focusNode: FocusNode(canRequestFocus: true),
                                  autofocus: true,
                                  // onFieldSubmitted: _onFieldSubmitted,
                                  controller: _textcontroller,
                                  decoration: InputDecoration(
                                    fillColor: kWhiteColor,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: kGreyColor, width: 3)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: kGreyColor, width: 3)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: kGreyColor, width: 3)),
                                  )),
                            ),
                            const Text(
                              "Note: Type and reply to Agent Ram.",
                              style:
                                  TextStyle(color: kWhiteColor, fontSize: 14),
                            ),
                            SizedBox(
                              height: hm * 0.01,
                            ),
                            SizedBox(
                              height: hm * 0.055,
                              width: wm * 0.2,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: kdarkGreyclr,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _onFieldSubmitted(context);
                                      // _textcontroller.clear();
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/image-png/sendIcon.png",
                                        height: wm * 0.04,
                                        width: wm * 0.04,
                                      ),
                                      SizedBox(
                                        width: wm * 0.008,
                                      ),
                                      const Text(
                                        "Send",
                                        style: TextStyle(
                                            color: kBlackColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ]),
          ),
        ));
  }
}

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:letslokal/Model/wishListData.dart';
import 'package:letslokal/Services/auth.dart';
import 'package:letslokal/components/components.dart';
import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:flutter/material.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  // List<MyWish> myLikedlist = [];

  bool isloading = true;
  // bool hasData = true;

  WishListData favListData = WishListData();
  List<favData> data = [];

  @override
  void initState() {
    wishListData(Preference.pref.getString("userId")).then((value) {
      if (value != null) {
        favListData = value;
        data.addAll(favListData.data!.toList());
      }

      setState(() {
        isloading = false;

        // hasData = favListData.data!.isNotEmpty;
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, false),
      backgroundColor: kBlackColor,
      body: Padding(
        padding:
            EdgeInsets.only(left: hm * 0.03, top: hm * 0.03, right: wm * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Wishlist',
                  style:
                      textW.copyWith(fontSize: 34, fontFamily: "BalooBhai2")),
              Padding(
                  padding: EdgeInsets.only(
                    top: hm * 0.05,
                  ),
                  child: isloading
                      ? circleloader
                      : data.isEmpty
                          ? Center(
                              child: Text(
                                "No product added to wishlist",
                                style: textAcc,
                              ),
                            )
                          :
                          // : hasData
                          // ?
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: ((context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: wm * 0.15,
                                          width: wm * 0.15,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              data
                                                  .elementAt(index)
                                                  .productImage
                                                  .toString(),
                                            ),
                                          )),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            bottom: hm * 0.025,
                                            left: wm * 0.03,
                                          ),
                                          child: Expanded(
                                            child: Text(
                                              data
                                                  .elementAt(index)
                                                  .productName
                                                  .toString(),
                                              style: dropdown.copyWith(
                                                fontSize: 22,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Add to cart",
                                              style: textAcc.copyWith(
                                                  color: kcolortrivango),
                                            )),
                                        SizedBox(
                                          width: wm * 0.3,
                                        ),
                                        IconButton(
                                            onPressed: () async {
                                              Preference.pref.setString(
                                                  "wishlistId",
                                                  data
                                                      .elementAt(index)
                                                      .wishlistId);

                                              await removeWishlist(
                                                      context,
                                                      Preference.pref
                                                          .getString("userId"),
                                                      Preference.pref.getString(
                                                          "wishlistId"))
                                                  .then((value) {
                                                if (value = true) {
                                                  data.removeAt(index);
                                                  setState(() {});
                                                }
                                              }).then((value) => snackbr(
                                                      context,
                                                      removeListMsg,
                                                      kdarkGreyclr));
                                              // .then((value) => snackbr(
                                              //     context,
                                              //     removeListMsg.toString(),
                                              //     kredColor));
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: kcolortrivango,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      height: hm * 0.05,
                                    )
                                  ],
                                );
                              }))),
              SizedBox(
                height: hm * 0.045,
              ),
              Center(
                child: SizedBox(
                  height: hm * 0.06,
                  width: wm * 0.35,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      // backgroundColor: kWhiteColor,
                      side: const BorderSide(color: kWhiteColor, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("More Quests", style: textW),
                    onPressed: () {
                      pushTo(context, HomeNav(selectindex: 4));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyWish {
  String imageUrl;
  String title;

  MyWish(this.imageUrl, this.title);
}

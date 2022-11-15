import 'package:letslokal/screens/Homenav/Profile/account/delete.dart';
import 'package:letslokal/screens/Homenav/homenav.dart';
import 'package:letslokal/utils/constant/screennavigation.dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:flutter/material.dart';
import '../../../../utils/styleguide/colors..dart';
import '../../../../utils/styleguide/textstyle.dart';

class ViewOrder extends StatefulWidget {
  const ViewOrder({super.key});

  @override
  State<ViewOrder> createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  // @override
  // void initState() {
  //   setState(() {
  //     isOrder = false;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return viewOrders(context);
  }

  Column viewOrders(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: hm * 0.04),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(text: "Order ", style: textW),
              TextSpan(text: "£37765 ", style: ffText),
              TextSpan(text: "was placed on ", style: textW),
              TextSpan(text: "24 August 2022 ", style: ffText),
              TextSpan(text: "and is currently ", style: textW),
              TextSpan(text: "Completed. ", style: ffText),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: hm * 0.08, bottom: hm * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Product",
                style: ffText,
              ),
              Text(
                "Total",
                style: ffText,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: hm * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Outbreak | Pasar Seni x 1",
                style: ffText,
              ),
              Text(
                "\$5.99",
                style: ffText,
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: kYellowclr,
          child: Padding(
            padding: EdgeInsets.all(hm * 0.02),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NOTE:",
                    style: ffText,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: hm * 0.01, bottom: hm * 0.04),
                    child: GestureDetector(
                      onTap: (() {
                        pushTo(
                            context,
                            HomeNav(
                              selectindex: 3,
                            ));
                      }),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(text: "Go to ", style: textW),
                        TextSpan(text: "My Quest ", style: ffText),
                        TextSpan(text: "to start.", style: textW)
                      ])),
                    ),
                  ),
                  Text(
                    "Expires in 30 days.",
                    style: ffText,
                  ),
                ]),
          ),
        ),
        SizedBox(
          height: hm * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: ffText,
            ),
            Text(
              "\$5.99",
              style: ffText,
            ),
          ],
        ),
        SizedBox(
          height: hm * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Discount",
              style: ffText,
            ),
            Text(
              "-\$5.99",
              style: ffText,
            ),
          ],
        ),
        SizedBox(
          height: hm * 0.04,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total:",
              style: ffText,
            ),
            Text(
              "\$0.00",
              style: ffText,
            ),
          ],
        ),
        SizedBox(
          height: hm * 0.03,
        ),
        DefaultEButton(
          width: wm * 0.32,
          height: hm * 0.06,
          radius: 10,
          press: () {},
          color: kbttnColor,
          child: Center(
            child: Text(
              "Order again",
              style: ffText,
            ),
          ),
        ),
        SizedBox(
          height: hm * 0.03,
        ),
        Container(
          decoration: BoxDecoration(
              color: kBlackColor,
              border: Border.all(color: kWhiteColor.withOpacity(0.4))),
          child: Column(
            children: [
              Container(
                height: hm * 0.08,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kdarkGreyclr,
                ),
                child: Padding(
                  padding: EdgeInsets.all(wm * 0.035),
                  child: Text(
                    "Billing address",
                    style: ffText,
                  ),
                ),
              ),
              SizedBox(
                height: hm * 0.2,
                width: double.infinity,
                // decoration: BoxDecoration(
                //     color: kBlackColor,
                //     border: Border.all(color: kWhiteColor.withOpacity(0.4))),
                child: Padding(
                  padding: EdgeInsets.only(left: wm * 0.035, top: wm * 0.055),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Devendra Singh\n",
                          style: ffText.copyWith(fontStyle: FontStyle.italic)),
                      WidgetSpan(
                          child: SizedBox(
                        height: hm * 0.03,
                      )),
                      TextSpan(
                          text: "India\n",
                          style: ffText.copyWith(fontStyle: FontStyle.italic)),
                      WidgetSpan(
                          child: SizedBox(
                        height: hm * 0.03,
                      )),
                      TextSpan(
                          text: "9001294315\n",
                          style: ffText.copyWith(fontStyle: FontStyle.italic)),
                      WidgetSpan(
                          child: SizedBox(
                        height: hm * 0.06,
                      )),
                      TextSpan(
                          text: "devendra.appic@gmail.com",
                          style: ffText.copyWith(fontStyle: FontStyle.italic)),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: hm * 0.1,
        ),
        DefaultOutButton(
            fontSize: 12,
            width: wm * 0.3,
            RadiusClr: kWhiteColor.withOpacity(0.4),
            height: hm * 0.04,
            text: "Delete account",
            radius: 16,
            press: () {
              pushTo(context,const Delete());
            },
            textClr: kWhiteColor.withOpacity(0.4),
            color: kBlackColor),
      ],
    );
  }
}

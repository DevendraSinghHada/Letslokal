import 'package:letslokal/main.dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: hm * 0.06, bottom: hm * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order:",
                style: ffText.copyWith(fontSize: 14),
              ),
              Text(
                "#37765",
                style: ffText.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: hm * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date:",
                style: ffText.copyWith(fontSize: 14),
              ),
              Text(
                "24 August 2022",
                style: ffText.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: hm * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "status:",
                style: ffText.copyWith(fontSize: 14),
              ),
              Text(
                "Completed",
                style: ffText.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: hm * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Task:",
                style: ffText.copyWith(fontSize: 14),
              ),
              Text(
                "\$0.00 for 1 item",
                style: ffText.copyWith(fontSize: 14),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: hm * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Actions:",
                style: ffText.copyWith(fontSize: 14),
              ),
              DefaultEButton(
                width: wm * 0.18,
                height: hm * 0.06,
                radius: 12,
                press: () {
                  setState(() {
                    isOrder = false;
                  });
                  // Navigator.canPop(context).pop(context);
                  print("view$isOrder");
                },
                color: kbttnColor,
                child: Text(
                  "View",
                  style: title,
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

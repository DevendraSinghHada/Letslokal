import 'package:letslokal/screens/Appbar/appbar.dart';
import 'package:letslokal/utils/dftbutton.dart';
import 'package:letslokal/utils/dfttextformfield.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';
import 'package:letslokal/utils/styleguide/textstyle.dart';
import 'package:flutter/material.dart';

class Delete extends StatefulWidget {
  const Delete({super.key});

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  TextEditingController deletenameController =
      TextEditingController(text: Preference.pref.getString("name"));
  TextEditingController deleteEmailController =
      TextEditingController(text: Preference.pref.getString("email"));


  TextEditingController reasonController = TextEditingController(text:  "-Select Reason-");  

  // String selectText = ""; 
  int selectindex =0;
   
   List<String> deleteList = [
    "-Select Reason-",
    "I need a break,I'll be back",
    "I want to create a new account", 
    "I have more than one account", 
    "I don't like the concept", 
    "I don't need it", 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: myAppBar(context, true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(wm * 0.05),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                  top: hm * 0.03,
                  bottom: hm * 0.01,
                  left: wm * 0.09,
                  right: wm * 0.09),
              child: Text(
                "Account Deletion Request",
                style: expTileStyle.copyWith(color: kWhiteColor, fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "We are sad to see you go",
                style: textW,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: hm * 0.1, bottom: hm * 0.01),
              child: Text("Name", style: ffText),
            ),
            TextFormField(
              // initialValue: Preference.pref.getString("name"),
              controller: deletenameController,
              style: pelletStyle,
              cursorColor: kWhiteColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                focusColor: kWhiteColor,
                focusedBorder: accountBorder(context),
                border: accountBorder(context),
                enabledBorder:accountBorder(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: hm * 0.03, bottom: hm * 0.01),
              child: Text("Registered Email address", style: ffText),
            ),
            TextFormField(
              controller: deleteEmailController,
              style: pelletStyle,
              cursorColor: kWhiteColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                focusColor: kWhiteColor,
                focusedBorder: accountBorder(context),
                border: accountBorder(context),
                enabledBorder: accountBorder(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: hm * 0.03, bottom: hm * 0.01),
              child: Text("Reason to Delete", style: ffText),
            ),
            TextFormField(
              readOnly: true,
              onTap: () {
                setState(() {
                  showList();
                });
              },
              // initialValue: "-Select Reason-",
              controller: reasonController,
              style: pelletStyle,
              cursorColor: kWhiteColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                focusColor: kWhiteColor,
                focusedBorder: accountBorder(context),
                border: accountBorder(context),
                enabledBorder:accountBorder(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: hm * 0.04, bottom: hm * 0.05),
              child: DefaultEButton(
                width: wm * 0.42,
                height: hm * 0.06,
                radius: 12,
                press: () {},
                color: kbttnColor,
                child: Center(
                  child: Text(
                    "Request To Delete",
                    style: title,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  showList() {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding: EdgeInsets.zero,
            backgroundColor: kWhiteColor,
            content: StatefulBuilder(builder: (BuildContext context,
                 StateSetter setState) {
              return SizedBox(
                width: wm,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      deleteList.length,
                      (index) => ListTile(
                            // dense: true,
                            shape: Border(
                                bottom: BorderSide(
                                    color: index == deleteList.length - 1
                                        ? Colors.transparent
                                        : kGreyColor.withOpacity(0.5),
                                    width: 1)),
                            onTap: (){
                              setState (() {
                               reasonController.text =    deleteList.elementAt(index);
                               selectindex = index;
                              //  deleteList.elementAt(index)  = !deleteList.elementAt(index).isSelect ;
                              },
                            
                      );
                        Navigator.pop(context);
                      
                      },
                            title: Text(
                              deleteList[index],
                              style: reasonStyle,
                            ),
                            
            trailing:                 Container(
    height: 18,
    width: 18,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kWhiteColor,
        border:
            // ignore: dead_code
            Border.all(color:  kBlackColor, width: 2)),
    child: selectindex == index ?  const Center(
      child: Padding(
        padding:  EdgeInsets.all(2),
        child: CircleAvatar(
          // ignore: dead_code
          backgroundColor:  kbttnColor,
        ),
      ),
    ) : Container()
  
                          ),
                ),
              )));
            }),
          );
        }));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:letslokal/Model/lokalQuest_Tips_Model.dart';
import 'package:letslokal/Model/myQuestsModel.dart';
import 'package:letslokal/Model/signupmodel.dart';
import 'package:letslokal/Model/updateProfile.dart';
import 'package:letslokal/Model/wishListData.dart';
import 'package:letslokal/Services/endpoint.dart';
import 'package:letslokal/components/components.dart';
import 'package:letslokal/utils/preference.dart';
import 'package:letslokal/utils/styleguide/colors..dart';

import '../Model/loginmodel.dart';

//login

//  var apiLdata;
late String apiLmsg;
late int apiLstatus;

//signUp

late String apiSmsg;
late int apiRegstatus;

//ranking Api

late String myUrl;

// wishlist api
late String wishMsg;

// removeWishlist Api

late String removeListMsg;
late int removeListStatus;

// var user_Name = "";
// var user_Password = "";

//HomePage Section 1

// var lokalquestdata;
late String lqmsg;

// Update data API variables
late String updateMsg;

// SignUp API
Future fetchsignUpData(BuildContext context, String name, String username,
    String password, String email) async {
  try {
    final response = await http.post(Uri.parse(baseUrl + uSignUpApi), body: {
      "name": name,
      "username": username,
      "password": password,
      "email": email
    });
    var apiSdata = json.decode(response.body);
    apiRegstatus = apiSdata["status"];
    apiSmsg = apiSdata["msg"];
    if (response.statusCode == 200) {
      SignUpData signUpData = signUpDataFromJson(response.body.toString());

      if (apiRegstatus == 200) {
        Preference.pref.setString("email", signUpData.data!.userEmail);
        Preference.pref.setString("name", signUpData.data!.displayName);
        Preference.pref.setString("username", signUpData.data!.userLogin);

        Preference.pref.setString("ID", signUpData.data!.id);

        Preference.pref.getString("email");
        Preference.pref.getString("username");
        Preference.pref.getString("ID");

        // replaceRoute(context, const CongratulationPage());
        print(
            'Registered successfully, Welcome ${Preference.pref.getString("name")}');
      }

      print("$apiSmsg");

      print("Api is running well");
    } else {
      print("API didn't called ");
    }
  } catch (e) {
    print(e.toString());
  }
}

// Login API

Future fetchLoginData(
  BuildContext context,
  String username,
  String password,
) async {
  try {
    final response = await http.post(Uri.parse(baseUrl + uLoginApi), body: {
      "username": username,
      "password": password,
    });
    var apiLdata = json.decode(response.body);
    apiLmsg = apiLdata["msg"];
    apiLstatus = apiLdata["status"];

    if (response.statusCode == 200) {
      LoginData loginData = loginDataFromJson(response.body.toString());

      if (apiLstatus == 200) {
        print("$apiLmsg");
        Preference.pref.setString("email", loginData.user!.userEmail);
        Preference.pref.setString("username", loginData.user!.userLogin);
        Preference.pref.setString("name", loginData.user!.displayName);

        Preference.pref.setString("ID", loginData.user!.id);
        Preference.pref.setBool("isNewUser", false);
        // Preference.pref.setBool("isRemeberMeClicked", isRemeberMeClicked);

        Preference.pref.getString("email");
        Preference.pref.getString("name");
        Preference.pref.getString("ID");

        // snackbr(context, "$apiLmsg", Colors.green);

        // if (
        // Preference.pref.getString("ID");
        // )

        // Preference.pref.setBool("login");
        // replaceRoute(context, HomeNav(selectindex: 1));
      }
    } else {
      print('$apiLmsg');
    }
  } catch (e) {
    print(e.toString());
  }
}

//HomePage Section API

Future fetchLQdata(String userId) async {
  try {
    final response = await http
        .post(Uri.parse(baseUrl + uHomePageApi), body: {"userId": userId});

    var lokalquestdata = json.decode(response.body);
    var lqStatus = lokalquestdata["status"];
    if (response.statusCode == 200) {
      LQdata lqdata = lqdataFromJson(response.body.toString());

      if (lqStatus == 200) {
        Preference.pref.setString(
          "userId",
          userId,
        );

        // Preference.pref.getString("userId");
        // Preference.pref.getInt("productId");
        print("Your HomePage API is Running");
      }

      return lqdata;

      // print("$lqmsg");
    }
  } catch (e) {
    print(e.toString());
  }
}

// Update Profile page API

Future updateProfileData(String userId, String name, String displayName,
    String oldPassword, String newPassword) async {
  try {
    final res = await http.post(Uri.parse(baseUrl + uUpdateProfApi), body: {
      "userId": userId,
      "name": displayName,
      "display_name": name,
      "old_password": oldPassword,
      "new_password": newPassword
    });
    var updateProfile = json.decode(res.body);

    var msg = updateProfile["msg"];

    if (res.statusCode == 200) {
      UpdateProfile updateProfile = updateProfileFromJson(res.body.toString());

      // updateMsg = updateProfile.msg;

      if (msg == "Success") {
        Preference.pref.setString("userId", updateProfile.user!.data!.id);
        Preference.pref
            .setString("username", updateProfile.user!.data!.userLogin);
        Preference.pref
            .setString("name", updateProfile.user!.data!.displayName);

        Preference.pref.getString("username");
        Preference.pref.getString("name");

        print("Your api is running");
      }
    }
  } catch (e) {
    print(e.toString());
  }
}

//AddToWishlist api

Future addTofav(BuildContext context, String userId, int addToWishlist) async {
  try {
    final response = await http.post(Uri.parse(baseUrl + uAddtoWish),
        headers: {
          "content-type": "application/json",
        },
        body: jsonEncode({
          'userId': userId,
          'add_to_wishlist': addToWishlist,
        }));

    var favData = json.decode(response.body);

    var favStatus = favData["status"];
    var favMsg = favData["msg"];
    // Preference.pref.SetString("wishlistId", wishlistId);

    if (response.statusCode == 200) {
      // Preference.pref.setString("msg", favData["msg"]);

      if (favStatus == 200) {
        Preference.pref.setString("userId", userId);

        if (favMsg == "Success") {
          snackbr(context, favMsg, kgreenclr);
        }
      }

      print("Add to Wishlist Api called ");
    }
  } catch (e) {
    print(e);
  }
}

Future wishListData(String userId) async {
  try {
    final response = await http
        .post(Uri.parse(baseUrl + uWishlistApi), body: {"userId": userId});

    var data = json.decode(response.body);
    wishMsg = data["msg"];

    if (response.statusCode == 200) {
      WishListData favListData = wishListDataFromJson(response.body.toString());

      if (wishMsg == "Success") {
        print("Here is your wihslist data $favListData");

        Preference.pref.setString("userId", userId);
      }
      return favListData;
    }
  } catch (e) {
    print(e.toString());
  }
}

// remove from Wishlist Api

Future removeWishlist(
    BuildContext context, String userId, String wishlistId) async {
  try {
    final response = await http.post(Uri.parse(baseUrl + uRemoveWishApi),
        body: {"userId": userId, "wishlistId": wishlistId});

    var data = json.decode(response.body);

    removeListMsg = data["msg"];
    if (response.statusCode == 200) {
      print(" Your remove wishlist ApI is Running  $removeListMsg");

      if (removeListStatus == 200) {
        Preference.pref.setString("userId", userId);

        // if(removeListMsg == "Success"){
        //   snackbr(context, "Item removed successfully", kGreyColor);
        // }
        return true;
      } else {
        return false;
      }
      // return data;
    }
  } catch (e) {
    print(e.toString());
  }
}

// Ranking API

Future ranking(String userId, BuildContext context) async {
  try {
    final response = await http
        .post(Uri.parse(baseUrl + uRankingApi), body: {"userId": userId});

    var data = json.decode(response.body);
    myUrl = data["pageLink"];
    var msg = data["msg"];

    if (response.statusCode == 200) {
      print(myUrl.toString());
      if (msg == "Success") {
        return myUrl;
      } else if (msg != "Success") {
        return snackbr(context, msg.toString(), kredColor);
      }
    }
  } catch (e) {
    print(e.toString());
  }
}

Future myQuest(String userId) async {
  try {
    final respose = await http.post(Uri.parse(baseUrl + uMyQuestApi), body: {
      "userId": userId,
    });

    var myQuestData = json.decode(respose.body);

    // var myQuestsMsg = myQuestData["msg"];
    var myQuestsStatus = myQuestData["status"];

    if (respose.statusCode == 200) {
      MyQuests myQuests = myQuestsFromJson(respose.body.toString());

      if (myQuestsStatus == 200) {
        Preference.pref.setString("userId", userId);
      }

      return myQuests;
    }
  } catch (e) {
    print(e.toString());
  }
}

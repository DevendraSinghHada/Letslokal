import 'dart:convert';
// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  LoginData({
    this.status,
    this.msg,
    this.user,
  });

  int? status;
  String? msg;
  User? user;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        status: json["status"],
        msg: json["msg"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.userLogin,
    this.userPass,
    this.userNicename,
    this.userEmail,
    this.userUrl,
    this.userRegistered,
    this.userActivationKey,
    this.userStatus,
    this.displayName,
    this.alpha,
  });

  String? id;
  String? userLogin;
  String? userPass;
  String? userNicename;
  String? userEmail;
  String? userUrl;
  DateTime? userRegistered;
  String? userActivationKey;
  String? userStatus;
  String? displayName;
  dynamic alpha;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["ID"],
        userLogin: json["user_login"],
        userPass: json["user_pass"],
        userNicename: json["user_nicename"],
        userEmail: json["user_email"],
        userUrl: json["user_url"],
        userRegistered: DateTime.parse(json["user_registered"]),
        userActivationKey: json["user_activation_key"],
        userStatus: json["user_status"],
        displayName: json["display_name"],
        alpha: json["alpha"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "user_login": userLogin,
        "user_pass": userPass,
        "user_nicename": userNicename,
        "user_email": userEmail,
        "user_url": userUrl,
        "user_registered": userRegistered!.toIso8601String(),
        "user_activation_key": userActivationKey,
        "user_status": userStatus,
        "display_name": displayName,
        "alpha": alpha,
      };
}

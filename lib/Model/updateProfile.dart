// To parse this JSON data, do
//
//     final updateProfile = updateProfileFromJson(jsonString);

import 'dart:convert';

UpdateProfile updateProfileFromJson(String str) =>
    UpdateProfile.fromJson(json.decode(str));

String updateProfileToJson(UpdateProfile data) => json.encode(data.toJson());

class UpdateProfile {
  UpdateProfile({
    this.status,
    this.msg,
    this.user,
  });

  int? status;
  String? msg;
  User? user;

  factory UpdateProfile.fromJson(Map<String, dynamic> json) => UpdateProfile(
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
    this.data,
    this.id,
    this.caps,
    this.capKey,
    this.roles,
    this.allcaps,
    this.filter,
  });

  Data? data;
  int? id;
  Caps? caps;
  String? capKey;
  List<String>? roles;
  Allcaps? allcaps;
  dynamic filter;

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: Data.fromJson(json["data"]),
        id: json["ID"],
        caps: Caps.fromJson(json["caps"]),
        capKey: json["cap_key"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        allcaps: Allcaps.fromJson(json["allcaps"]),
        filter: json["filter"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "ID": id,
        "caps": caps!.toJson(),
        "cap_key": capKey,
        "roles": List<dynamic>.from(roles!.map((x) => x)),
        "allcaps": allcaps!.toJson(),
        "filter": filter,
      };
}

class Allcaps {
  Allcaps({
    this.read,
    this.readOthersPosts,
    this.readOthersPages,
    this.readOthersProducts,
    this.customer,
  });

  bool? read;
  bool? readOthersPosts;
  bool? readOthersPages;
  bool? readOthersProducts;
  bool? customer;

  factory Allcaps.fromJson(Map<String, dynamic> json) => Allcaps(
        read: json["read"],
        readOthersPosts: json["read_others_posts"],
        readOthersPages: json["read_others_pages"],
        readOthersProducts: json["read_others_products"],
        customer: json["customer"],
      );

  Map<String, dynamic> toJson() => {
        "read": read,
        "read_others_posts": readOthersPosts,
        "read_others_pages": readOthersPages,
        "read_others_products": readOthersProducts,
        "customer": customer,
      };
}

class Caps {
  Caps({
    this.customer,
  });

  bool? customer;

  factory Caps.fromJson(Map<String, dynamic> json) => Caps(
        customer: json["customer"],
      );

  Map<String, dynamic> toJson() => {
        "customer": customer,
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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

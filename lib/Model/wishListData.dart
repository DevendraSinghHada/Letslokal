
// To parse this JSON data, do
//
//     final wishListData = wishListDataFromJson(jsonString);

import 'dart:convert';

WishListData wishListDataFromJson(String str) =>
    WishListData.fromJson(json.decode(str));

String wishListDataToJson(WishListData data) => json.encode(data.toJson());

class WishListData {
  WishListData({
    this.status,
    this.msg,
    this.data,
  });

  int? status;
  String? msg;
  List<favData>? data =[];

  factory WishListData.fromJson(Map<String, dynamic> json) => WishListData(
        status: json["status"],
        msg: json["msg"],
        data: List<favData>.from(json["data"].map((x) => favData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class favData {
  favData({
    this.wishlistId,
    this.productName,
    this.productImage,
    this.link,
  });

  String? wishlistId ;
  String? productName ;
  String? productImage ;
  String? link ;

  factory favData.fromJson(Map<String, dynamic> json) => favData(
        wishlistId: json["wishlistId"] ?? "",
        productName: json["productName"] ?? "",
        productImage: json["productImage"] ?? "",
        link: json["link"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "wishlistId": wishlistId,
        "productName": productName,
        "productImage": productImage,
        "link": link,
      };
}

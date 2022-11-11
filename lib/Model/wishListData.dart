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
  List<FavData>? data = [];

  factory WishListData.fromJson(Map<String, dynamic> json) => WishListData(
        status: json["status"],
        msg: json["msg"],
        data: List<FavData>.from(json["data"].map((x) => FavData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class FavData {
  FavData({
    this.wishlistId,
    this.productName,
    this.productImage,
    this.link,
  });

  String? wishlistId;
  String? productName;
  String? productImage;
  String? link;

  factory FavData.fromJson(Map<String, dynamic> json) => FavData(
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

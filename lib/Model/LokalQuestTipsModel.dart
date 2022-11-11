// lq = Lokal Quests, HomePage section-1 Model
// To parse this JSON data, do
//
//     final LQdata = lqDataFromJson(jsonString);

import 'dart:convert';

LQdata lqdataFromJson(String str) => LQdata.fromJson(json.decode(str));

String lqdataToJson(LQdata data) => json.encode(data.toJson());

class LQdata {
  LQdata({this.status, this.msg, this.data, this.post});

  int? status;
  String? msg;
  List<DataLQ>? data;
  List<DataLT>? post;

  factory LQdata.fromJson(Map<String, dynamic> json) => LQdata(
        status: json["status"],
        msg: json["msg"],
        data: List<DataLQ>.from(json["data"].map((x) => DataLQ.fromJson(x))),
        post: List<DataLT>.from(json["post"].map((e) => DataLT.fromJson(e))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "post": List<dynamic>.from(post!.map((e) => e.toJson()))
      };
}

class DataLQ {
  DataLQ({
    this.productId,
    this.productName,
    this.productImage,
    this.price,
    this.link,
    this.category,
    this.isWishlist,
  });
  int? productId;
  String? productName;
  String? productImage;
  String? price;
  String? link;
  String? category;
  int? isWishlist;
  // bool isSelected = false;

  factory DataLQ.fromJson(Map<String, dynamic> json) => DataLQ(
      productId: json["productId"] ?? "",
      productName: json["productName"] ?? "",
      productImage: json["productImage"] ?? "",
      price: json["price"] ?? "",
      link: json["link"] ?? "",
      category: json["category"] ?? "",
      isWishlist: json["isWishlist"] ?? "");

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "productImage": productImage,
        "price": price,
        "link": link,
        "category": category,
        "isWishlist": isWishlist
      };
}

class DataLT {
  DataLT(
      {this.productName,
      this.productImage,
      this.link,
      this.category,
      this.productId,
      this.isWishlist

      // this.isWishlist
      });

  String? productName;
  String? productImage;
  int? productId;
  String? link;
  String? category;
  int? isWishlist;

  factory DataLT.fromJson(Map<String, dynamic> json) => DataLT(
        productId: json["productId"] ?? "",
        productName: json["productName"] ?? "",
        productImage: json["productImage"] ?? "",
        category: json["category"] ?? "",
        link: json["link"] ?? "",
        isWishlist: json["isWishlist"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "productName": productName,
        "productImage": productImage,
        "category": category,
        "link": link,
        "isWishlist": isWishlist,
      };
}

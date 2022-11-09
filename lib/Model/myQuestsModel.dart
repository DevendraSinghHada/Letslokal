import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final myQuests = myQuestsFromJson(jsonString);

import 'dart:convert';

MyQuests myQuestsFromJson(String str) => MyQuests.fromJson(json.decode(str));

String myQuestsToJson(MyQuests data) => json.encode(data.toJson());

class MyQuests {
  MyQuests({
    this.status,
    this.msg,
    this.data,
  });

  int? status;
  String? msg;
  List<Data>? data;

  factory MyQuests.fromJson(Map<String, dynamic> json) => MyQuests(
        status: json["status"],
        msg: json["msg"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.productName,
    this.productImage,
    this.link,
  });

  int? id;
  String? productName;
  String? productImage;
  String? link;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] ?? "",
        productName: json["productName"] ?? "",
        productImage: json["productImage"] ?? "",
        link: json["link"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "productImage": productImage,
        "link": link,
      };
}

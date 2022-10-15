// To parse this JSON data, do
//
//     final audio = audioFromJson(jsonString);

import 'dart:convert';

Audio audioFromJson(String str) => Audio.fromJson(json.decode(str));

String audioToJson(Audio data) => json.encode(data.toJson());

class Audio {
  Audio({
    this.categories,
    this.count,
    this.success,
    this.message,
  });

  List<Category>? categories;
  int? count;
  bool? success;
  String? message;

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
    categories: List<Category>.from(json["Categories"].map((x) => Category.fromJson(x))),
    count: json["Count"],
    success: json["Success"],
    message: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
    "Count": count,
    "Success": success,
    "Message": message,
  };
}

class Category {
  Category({
    this.categoryId,
    this.imageName,
    this.createdOn,
    this.imagePath,
    this.name,
    this.isSelected,
    this.order,
  });

  int? categoryId;
  String? imageName;
  DateTime? createdOn;
  String? imagePath;
  String? name;
  bool? isSelected;
  int? order;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["CategoryId"],
    imageName: json["ImageName"],
    createdOn: DateTime.parse(json["CreatedOn"]),
    imagePath: json["ImagePath"],
    name: json["Name"],
    isSelected: json["IsSelected"],
    order: json["Order"],
  );

  Map<String, dynamic> toJson() => {
    "CategoryId": categoryId,
    "ImageName": imageName,
    "CreatedOn": createdOn!.toIso8601String(),
    "ImagePath": imagePath,
    "Name": name,
    "IsSelected": isSelected,
    "Order": order,
  };
}

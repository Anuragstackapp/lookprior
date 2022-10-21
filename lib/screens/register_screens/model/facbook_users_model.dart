// To parse this JSON data, do
//
//     final facbookusers = facbookusersFromJson(jsonString);

import 'dart:convert';

Facbookusers facbookusersFromJson(String str) => Facbookusers.fromJson(json.decode(str));

String facbookusersToJson(Facbookusers data) => json.encode(data.toJson());

class Facbookusers {
  Facbookusers({
    this.name,
    this.picture,
    this.id,
  });

  String? name;
  Picture? picture;
  String? id;

  factory Facbookusers.fromJson(Map<String, dynamic> json) => Facbookusers(
    name: json["name"],
    picture: Picture.fromJson(json["picture"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "picture": picture!.toJson(),
    "id": id,
  };
}

class Picture {
  Picture({
    this.data,
  });

  Data? data;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.height,
    this.isSilhouette,
    this.url,
    this.width,
  });

  int? height;
  bool? isSilhouette;
  String? url;
  int? width;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    height: json["height"],
    isSilhouette: json["is_silhouette"],
    url: json["url"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "is_silhouette": isSilhouette,
    "url": url,
    "width": width,
  };
}

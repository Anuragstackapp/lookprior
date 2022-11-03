// To parse this JSON data, do
//
//     final getAds = getAdsFromJson(jsonString);

import 'dart:convert';

GetAds getAdsFromJson(String str) => GetAds.fromJson(json.decode(str));

String getAdsToJson(GetAds data) => json.encode(data.toJson());

class GetAds {
  GetAds({
    this.success,
    this.message,
    this.pageNo,
    this.isNextPage,
    this.pageSize,
    this.totalRecords,
    this.filteredAddList,
  });

  bool? success;
  String? message;
  num? pageNo;
  bool? isNextPage;
  num? pageSize;
  num? totalRecords;
  List<FilteredAddList>? filteredAddList;

  factory GetAds.fromJson(Map<String, dynamic> json) => GetAds(
    success: json["Success"],
    message: json["Message"],
    pageNo: json["pageNo"],
    isNextPage: json["IsNextPage"],
    pageSize: json["pageSize"],
    totalRecords: json["TotalRecords"],
    filteredAddList: List<FilteredAddList>.from(json["FilteredAddList"].map((x) => FilteredAddList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Success": success,
    "Message": message,
    "pageNo": pageNo,
    "IsNextPage": isNextPage,
    "pageSize": pageSize,
    "TotalRecords": totalRecords,
    "FilteredAddList": List<dynamic>.from(filteredAddList!.map((x) => x.toJson())),
  };
}

class FilteredAddList {
  FilteredAddList({
    this.broadCastId,
    this.userId,
    this.adDetailId,
    this.title,
    this.fullAddress,
    this.state,
    this.city,
    this.stateName,
    this.cityName,
    this.amount,
    this.amountStr,
    this.adImage,
    this.adImageThumb,
    this.adVideo,
    this.adVideoThumb,
    this.isLiked,
    this.isFavAd,
    this.noOfViews,
    this.description,
    this.isOwner,
    this.isTopAdd,
    this.isMyAd,
    this.orderByDistance,
    this.randomSort,
    this.isDeleted,
    this.isReviewed,
    this.isApproved,
    this.latitude,
    this.longitude,
    this.totalExposureDays,
    this.perDayExposurePrice,
    this.isFeatureAd,
    this.hasOnlyVideo,
    this.categoryId,
    this.subCategoryId,
    this.categoryName,
    this.subCategoryName,
  });

  num? broadCastId;
  num? userId;
  num? adDetailId;
  String? title;
  FullAddress? fullAddress;
  String? state;
  String? city;
  dynamic stateName;
  dynamic cityName;
  num? amount;
  String? amountStr;
  String? adImage;
  String? adImageThumb;
  String? adVideo;
  String? adVideoThumb;
  bool? isLiked;
  bool? isFavAd;
  num? noOfViews;
  String? description;
  bool? isOwner;
  bool? isTopAdd;
  bool? isMyAd;
  dynamic orderByDistance;
  num? randomSort;
  bool? isDeleted;
  bool? isReviewed;
  bool? isApproved;
  double? latitude;
  double? longitude;
  dynamic totalExposureDays;
  dynamic perDayExposurePrice;
  bool? isFeatureAd;
  bool? hasOnlyVideo;
  num? categoryId;
  num? subCategoryId;
  CategoryName? categoryName;
  SubCategoryName? subCategoryName;

  factory FilteredAddList.fromJson(Map<String, dynamic> json) => FilteredAddList(
    broadCastId: json["BroadCastId"],
    userId: json["UserId"],
    adDetailId: json["AdDetailId"],
    title: json["Title"],
    fullAddress: fullAddressValues.map![json["FullAddress"]],
    state: json["State"],
    city: json["City"],
    stateName: json["StateName"],
    cityName: json["CityName"],
    amount: json["Amount"],
    amountStr: json["AmountStr"],
    adImage: json["AdImage"],
    adImageThumb: json["AdImageThumb"],
    adVideo: json["AdVideo"],
    adVideoThumb: json["AdVideoThumb"],
    isLiked: json["IsLiked"],
    isFavAd: json["IsFavAd"],
    noOfViews: json["NoOfViews"],
    description: json["Description"],
    isOwner: json["IsOwner"],
    isTopAdd: json["IsTopAdd"],
    isMyAd: json["IsMyAd"],
    orderByDistance: json["OrderByDistance"],
    randomSort: json["RandomSort"],
    isDeleted: json["IsDeleted"],
    isReviewed: json["IsReviewed"],
    isApproved: json["IsApproved"],
    latitude: json["Latitude"].toDouble(),
    longitude: json["Longitude"].toDouble(),
    totalExposureDays: json["TotalExposureDays"],
    perDayExposurePrice: json["PerDayExposurePrice"],
    isFeatureAd: json["IsFeatureAd"],
    hasOnlyVideo: json["HasOnlyVideo"],
    categoryId: json["CategoryId"],
    subCategoryId: json["SubCategoryId"],
    categoryName: categoryNameValues.map![json["CategoryName"]],
    subCategoryName: subCategoryNameValues.map![json["SubCategoryName"]],
  );

  Map<String, dynamic> toJson() => {
    "BroadCastId": broadCastId,
    "UserId": userId,
    "AdDetailId": adDetailId,
    "Title": title,
    "FullAddress": fullAddressValues.reverse![fullAddress],
    "State": state,
    "City": city,
    "StateName": stateName,
    "CityName": cityName,
    "Amount": amount,
    "AmountStr": amountStr,
    "AdImage": adImage,
    "AdImageThumb": adImageThumb,
    "AdVideo": adVideo,
    "AdVideoThumb": adVideoThumb,
    "IsLiked": isLiked,
    "IsFavAd": isFavAd,
    "NoOfViews": noOfViews,
    "Description": description,
    "IsOwner": isOwner,
    "IsTopAdd": isTopAdd,
    "IsMyAd": isMyAd,
    "OrderByDistance": orderByDistance,
    "RandomSort": randomSort,
    "IsDeleted": isDeleted,
    "IsReviewed": isReviewed,
    "IsApproved": isApproved,
    "Latitude": latitude,
    "Longitude": longitude,
    "TotalExposureDays": totalExposureDays,
    "PerDayExposurePrice": perDayExposurePrice,
    "IsFeatureAd": isFeatureAd,
    "HasOnlyVideo": hasOnlyVideo,
    "CategoryId": categoryId,
    "SubCategoryId": subCategoryId,
    "CategoryName": categoryNameValues.reverse![categoryName],
    "SubCategoryName": subCategoryNameValues.reverse![subCategoryName],
  };
}

enum CategoryName { COMMUNITY }

final categoryNameValues = EnumValues({
  "Community": CategoryName.COMMUNITY
});

enum FullAddress { SURAT_GUJARAT_INDIA }

final fullAddressValues = EnumValues({
  "Surat, Gujarat, India": FullAddress.SURAT_GUJARAT_INDIA
});

enum SubCategoryName { ACTIVITIES }

final subCategoryNameValues = EnumValues({
  "Activities": SubCategoryName.ACTIVITIES
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

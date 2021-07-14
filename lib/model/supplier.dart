import 'dart:convert';

import 'package:erp_app/model/goods.dart';

SupplierModel supplierModelFromJson(String str) =>
    SupplierModel.fromJson(json.decode(str));

String supplierModelToJson(SupplierModel data) => json.encode(data.toJson());

class SupplierModel {
  String supplierName;
  String contact;
  String phoneNum;
  String workTime;
  String supplierImgUrl;
  String introDuceText;
  List<GoodsList> supplierList;

  SupplierModel({
    this.supplierName,
    this.contact,
    this.phoneNum,
    this.workTime,
    this.supplierImgUrl,
    this.introDuceText,
    this.supplierList,
  });

  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
        supplierName: json["supplierName"],
        contact: json["contact"],
        phoneNum: json["phoneNum"],
        workTime: json["workTime"],
        supplierImgUrl: json["supplierImgUrl"],
        introDuceText: json["introDuceText"],
        supplierList: List<GoodsList>.from(
            json["supplierList"].map((x) => GoodsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "supplierName": supplierName,
        "contact": contact,
        "phoneNum": phoneNum,
        "workTime": workTime,
        "supplierImgUrl": supplierImgUrl,
        "introDuceText": introDuceText,
        "supplierList": List<dynamic>.from(supplierList.map((x) => x.toJson())),
      };
}

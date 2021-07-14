/// 供应商provider
import 'package:flutter/foundation.dart';
import 'package:erp_app/model/goods.dart';
import 'package:erp_app/model/supplier.dart';
import 'package:erp_app/services/services.dart';

class SupplierPageProvider with ChangeNotifier {

  bool loading = true;
  String supplierName = '';
  String contact = '';
  String phoneNum = '';
  String workTime = '';

  String supplierImgUrl = "";
  String introDuceText = '';

  List<GoodsList> supplierList = [];

  SupplierPageProvider() {
    /// 数据加载
    initData();
  }

  Future initData({bool refresh = false}) async {
    SupplierModel res = await SupplierAPI.getData();
    supplierName = res.supplierName;
    contact = res.contact;
    phoneNum = res.phoneNum;
    workTime = res.workTime;
    supplierList = res.supplierList;
    supplierImgUrl = res.supplierImgUrl;
    introDuceText = res.introDuceText;
    loading = false;
    notifyListeners();
  }

  /// 上拉加载
  Future loadData({bool refresh = false}) async {
    SupplierModel res = await SupplierAPI.getData();
    supplierList += res.supplierList;
    loading = false;

    notifyListeners();
  }
}

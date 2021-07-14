import 'package:flutter/foundation.dart';
import 'package:erp_app/model/category.dart';
import 'package:erp_app/services/services.dart';

class CateGoryPageProvider with ChangeNotifier {
  bool loading = true;
  List<CategoryDatum> categoryData;

  CateGoryPageProvider() {
    /// 数据加载
    initData();
  }

  Future initData() async {
    CateGoryModel res = await CateGoryAPI.getData();

    /// 加载数据
    categoryData = res.categoryData;
    loading = false;
    notifyListeners();
  }
}

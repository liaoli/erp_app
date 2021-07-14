import 'package:flutter/foundation.dart';

import 'package:erp_app/model/goods.dart';
import 'package:erp_app/model/search.dart';
import 'package:erp_app/services/search.dart';

class SearchPageProvider with ChangeNotifier {

  List<GoodsList> result = [];
  bool loading = true;

  SearchPageProvider() {
    /// 数据加载
    searchData();
    notifyListeners();
  }
  Future searchData({bool refresh = false, String keyword}) async {
    // print(keyword);
    loading = true;

    /// 这里keyword有存在空的情况，后期需要判断
    SearchModel res = await SearchAPI.searchData(keyword: keyword);

    /// 初次加载
    result = res.result;
    loading = false;

    /// 下拉刷新
    if (refresh) {
    }
    notifyListeners();
  }

  /// 上拉加载
  Future loadData({bool refresh = false, String keyword}) async {
    SearchModel res = await SearchAPI.searchData(keyword: keyword);
    result += res.result;

    notifyListeners();
  }
}

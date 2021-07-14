import 'package:flutter/foundation.dart';

import 'package:erp_app/model/goods.dart';
import 'package:erp_app/model/home.dart';
import 'package:erp_app/services/services.dart';

class ManagePageProvider with ChangeNotifier {
  bool loading = true;
  List<GoodsList> hotList = [];


  ManagePageProvider() {
    /// 首页数据加载
    initData();
  }
  Future initData({bool refresh = false}) async {
    HomeModel res = await HomeAPI.getHomeData();
    hotList = res.hotList;
    loading = false;

    /// 下拉刷新
    if (refresh) {
      hotList = res.hotList;
      loading = false;
    }
    notifyListeners();
  }

  /// 上拉加载
  Future loadData({bool refresh = false}) async {
    HomeModel res = await HomeAPI.getHomeData();
    hotList += res.hotList;
    loading = false;

    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';

import 'package:erp_app/model/goods.dart';
import 'package:erp_app/model/home.dart';
import 'package:erp_app/services/services.dart';

class HomePageProvider with ChangeNotifier {

  bool loading = true;
  List<String> banerList = [];
  List<BrandListElement> cateGoryList = [];
  List<BrandListElement> brandList = [];
  List<GoodsList> hotList = [];

  HomePageProvider() {
    /// 首页数据加载
    initData();
  }
  Future initData({bool refresh = false}) async {
    HomeModel res = await HomeAPI.getHomeData();

    /// 初次加载
    banerList = res.banerList;
    cateGoryList = res.cateGoryList;
    brandList = res.brandList;
    hotList = res.hotList;
    loading = false;

    /// 下拉刷新
    if (refresh) {
      banerList = res.banerList;
      cateGoryList = res.cateGoryList;
      brandList = res.brandList;
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
    if (hotList.length < 20) {

    } else {

    }
    notifyListeners();
  }
}

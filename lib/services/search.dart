import 'package:erp_app/model/search.dart';
import 'package:erp_app/utils/request.dart';

/// 搜索页面
class SearchAPI {
  /// 搜索数据
  static Future<SearchModel> searchData({String keyword}) async {
    var response = await RequestUtil().get(
      '/search',
      params: {"keyword": keyword},
    );
    return SearchModel.fromJson(response);
  }
}

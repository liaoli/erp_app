import 'package:erp_app/model/supplier.dart';
import 'package:erp_app/utils/request.dart';

/// 详情页面
class SupplierAPI {
  /// 获取供应商数据
  static Future<SupplierModel> getData() async {
    var response = await RequestUtil().get('/supplier');
    return SupplierModel.fromJson(response);
  }
}

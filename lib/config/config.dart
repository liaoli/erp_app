import 'package:erp_app/env.dart';

// 开发环境
const SERVER_HOST_DEV = 'http://xieyezi.com:9003/mock/14/airi';

// 生产环境
const SERVER_HOST_PROD = 'http://xieyezi.com:9003/mock/14/airi';

const SERVER_API_URL = ENV == "DEV" ? SERVER_HOST_DEV : SERVER_HOST_PROD;

import 'package:erp_app/pages/main/components/my_bottom_navigation_bar.dart';
import 'package:erp_app/pages/manage/manage_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:erp_app/pages/category/category_page.dart';
import 'package:erp_app/pages/order/order_page.dart';
import 'package:erp_app/utils/my_navigator.dart';
import '../home/home_page.dart';
import 'store/main_provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  ///hide your splash screen
  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 750), () {
      FlutterSplashScreen.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mainState = Provider.of<MainProvider>(context, listen: false);
    // 保存 ctx
    MyNavigator.ctx = context;

    /// 根据iphone X 高度适配,高度去掉 顶部、底部
    ScreenUtil.init(context,
        width: 375, height: 812 - 44 - 34, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      bottomNavigationBar: MyBottomNavigationBar(onTap: (index) {
        mainState.tabBarPageController.jumpToPage(index);
        setState(() {
          mainState.setTabBarSelectedIndex = index;
        });
      }),
      body: PageView(
        controller: mainState.tabBarPageController,
        children: <Widget>[
          HomePage(),
          CategoryPage(),
          OrderPage(),
          ManagePage()
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:erp_app/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:erp_app/model/goods.dart';
import 'package:erp_app/pages/home/components/brand_swiper.dart';
import 'package:erp_app/pages/home/components/commodity_category.dart';
import 'package:erp_app/pages/home/components/head_swiper.dart';
import 'package:erp_app/pages/home/store/home_page_provider.dart';
import 'package:erp_app/pages/main/components/preload_images.dart';
import 'package:erp_app/pages/search/search_page.dart';
import 'package:erp_app/styles/colors.dart';
import 'package:erp_app/utils/my_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => HomePageProvider(),
      child: BaseScaffold(
        leadType: AppBarBackType.None,
        actions: <Widget>[AppBarShopCartIconButton()],
        title: '首页',
        centerTitle: true,
        body: HomePageContainer(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class HomePageContainer extends StatefulWidget {
  @override
  _HomePageContainerState createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomePageProvider>(context);

    return state.loading
        ? MyLoadingWidget()
        : Container(
            color: AppColors.primaryBackground,
            child: GestureDetector(),
          );
  }

  /// 热销商品区域
  List<Widget> _hotCommodity(List<GoodsList> hotList) {
    return [
      SliverToBoxAdapter(
        child: Container(
            height: 44,
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: LeftTitle(
              tipColor: AppColors.primaryColor,
              title: '热销商品',
            )),
      ),
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Wrap(
            spacing: 8.0,
            // 主轴(水平)方向间距
            runSpacing: 10.0,
            // 纵轴（垂直）方向间距
            alignment: WrapAlignment.start,
            //沿主轴方向居中
            direction: Axis.horizontal,
            children: hotList.map<Widget>(
              (item) {
                return CommdityItemHome(goodData: item);
              },
            ).toList(),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          height: 15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: null,
        ),
      ),
    ];
  }
}

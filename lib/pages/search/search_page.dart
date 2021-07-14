import 'package:erp_app/components/components.dart';
import 'package:erp_app/utils/my_navigator.dart';
import 'package:erp_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_app/model/goods.dart';
import 'package:erp_app/pages/search/store/search_provider.dart';
import 'package:erp_app/pages/shopping_cart/cart_page.dart';
import 'package:erp_app/styles/colors.dart';

class SearchPage extends StatelessWidget {
  final String title;
  final String keyword;

  const SearchPage({Key key, this.title, this.keyword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchPageProvider(),
      child: BaseScaffold(
        leadType: AppBarBackType.Back,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              'assets/images/home/gouwuche.png',
              width: duSetWidth(25),
              height: duSetHeight(23.5),
            ),
            onPressed: () => MyNavigator.push(CartPage()),
          ),
        ],
        title: title,
        body: SerachContainer(keyword: keyword),
      ),
    );
  }
}

class SerachContainer extends StatefulWidget {
  final String keyword;

  const SerachContainer({Key key, this.keyword}) : super(key: key);

  @override
  _SerachContainerState createState() => _SerachContainerState();
}

class _SerachContainerState extends State<SerachContainer> {
  String keyWord = '';

  @override
  void initState() {
    keyWord = widget.keyword;
    super.initState();
  }

  /// 下方搜索结果列表
  Widget _buildresultList(List<GoodsList> resultList) {
    return GoodList(goodsList: resultList);
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<SearchPageProvider>(context);
    return Container(
      color: AppColors.primaryBackground,
      child: Column(
        children: <Widget>[
          SearchBar(
            keyword: keyWord,
            myOntap: (value) {
              setState(() {
                keyWord = value; // 重新设置当前搜索框的值
              });
              state.searchData(keyword: value); // 跳转到Provider进行搜索请求
            },
          ),
          Expanded(
            child: state.loading
                ? MyLoadingWidget()
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.all(15),
                    child: _buildresultList(state.result),
                  ),
          ),
        ],
      ),
    );
  }
}

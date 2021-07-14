import 'package:flutter/material.dart';
import 'package:erp_app/model/goods.dart';

import 'commdity_item.dart';
import 'my_divider.dart';

class GoodList extends StatelessWidget {
  final List<GoodsList> goodsList;
  const GoodList({Key key, this.goodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: goodsList.length,
      itemBuilder: (context, index) {
        return CommdityItem(goodData: goodsList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return MyDivider();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_app/product/widget/card/restaurant_card.dart';
import 'package:mvvm_app/view/home/dashboard/model/dashboard_model.dart';

class DashBoardGrid extends StatelessWidget {
  final List<DashBoardModel>? models;
  final void Function(DashBoardModel item, int index)? onPressed;
  const DashBoardGrid({Key? key, this.models, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.1, crossAxisCount: 2),
        itemCount: models!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => DashBoardRestaurantCard(
              model: models![index],
              onPressed: () {
                onPressed!(models![index], index);
              },
            ));
  }
}

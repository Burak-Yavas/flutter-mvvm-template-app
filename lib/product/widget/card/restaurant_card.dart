import 'package:flutter/material.dart';
import 'package:mvvm_app/core/extension/context_extension.dart';
import 'package:mvvm_app/view/home/dashboard/model/dashboard_model.dart';

class DashBoardRestaurantCard extends StatelessWidget {
  final DashBoardModel? model;
  final VoidCallback? onPressed;
  const DashBoardRestaurantCard({Key? key, this.model, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingLowVertical,
        child: Column(children: [
          Expanded(
            child: Center(
              child: Image.network(
                model!.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              model!.money!.toString(),
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Icon(Icons.star)
          ]),
        ]),
      ),
    );
  }
}

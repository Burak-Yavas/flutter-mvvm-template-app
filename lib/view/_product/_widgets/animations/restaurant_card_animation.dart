import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:mvvm_app/view/home/restaurants/model/restaurant_model.dart';
import 'package:mvvm_app/view/home/restaurants/view/restaurant_detail_view.dart';

class OpenContainerRestaurantlWrapper extends StatelessWidget {
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  const OpenContainerRestaurantlWrapper({
    this.closedBuilder,
    this.onClosed,
    this.restaurant,
  });

  final OpenContainerBuilder? closedBuilder;
  final ClosedCallback<bool?>? onClosed;
  final Restaurant? restaurant;
  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: _transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return RestaurantDetailView();
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder:
          closedBuilder as Widget Function(BuildContext, void Function()),
    );
  }
}

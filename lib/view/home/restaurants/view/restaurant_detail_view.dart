import 'package:flutter/material.dart';
import 'package:mvvm_app/core/extension/context_extension.dart';
import 'package:mvvm_app/core/init/network/vexana_manager.dart';
import 'package:mvvm_app/view/home/restaurants/model/restaurant_model.dart';
import 'package:mvvm_app/view/home/restaurants/service/IRestaurantsService.dart';
import 'package:mvvm_app/view/home/restaurants/service/restaurants_service.dart';
import 'package:vexana/vexana.dart';

class RestaurantDetailView extends StatelessWidget {
  final Restaurant? restaurant;

  final INetworkManager manager = VexanaManager.instance.networkManager;

  IRestaurantsService get restaurantService =>
      RestaurantsService(manager, null);
  RestaurantDetailView({Key? key, this.restaurant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: Text("data")));
  }
}



//NEED TO UPDATE AFTER THE DETAIL PAGE COMPLETED
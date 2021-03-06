import 'package:flutter/material.dart';
import 'package:mvvm_app/view/home/detail/view/detail_view.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/init/network/vexana_manager.dart';
import '../model/restaurant_model.dart';
import '../service/IRestaurantsService.dart';
import '../service/restaurants_service.dart';

class RestaurantDetailView extends StatelessWidget {
  final Restaurant? restaurant;

  final INetworkManager manager = VexanaManager.instance.networkManager;

  IRestaurantsService get restaurantService =>
      RestaurantsService(manager, null);
  RestaurantDetailView({Key? key, this.restaurant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailView());
  }
}



//NEED TO UPDATE AFTER THE DETAIL PAGE COMPLETED
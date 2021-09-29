import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_model/query/restaurant_query.dart';
import '../model/restaurant_model.dart';

abstract class IRestaurantsService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldyKey;

  IRestaurantsService(this.manager, this.scaffoldyKey);

  Future<List<Restaurant>> fetchRestaurantsList(RestaurantQuery query);
  Future<List<Restaurant>> fetcRestaurantNameQuery(String text);
  Future<Restaurant?> fetchRestaurant(id);
}

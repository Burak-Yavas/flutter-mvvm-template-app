import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_model/query/restaurant_query.dart';
import '../../../_product/_model/query/restaurant_query_enum.dart';
import '../../../_product/_utility/serivce_helper.dart';
import '../../../_product/enum/network_route_enum.dart';
import '../model/restaurant_model.dart';
import 'IRestaurantsService.dart';

class RestaurantsService extends IRestaurantsService with ServiceHelper {
  RestaurantsService(
      INetworkManager manager, GlobalKey<ScaffoldState>? scaffoldyKey)
      : super(manager, scaffoldyKey);

  @override
  Future<Restaurant?> fetchRestaurant(id) async {
    final response = await manager.send<Restaurant, Restaurant>(
        NetworkRoutes.RESTAURANT.rawValue,
        parseModel: Restaurant(),
        urlSuffix: '/$id',
        method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }

  @override
  Future<List<Restaurant>> fetchRestaurantsList(RestaurantQuery query) async {
    final response = await manager.send<Restaurant, List<Restaurant>>(
        NetworkRoutes.RESTAURANT.rawValue,
        parseModel: Restaurant(),
        queryParameters: {
          RestaurantQueryEnum.LIMIT.rawValue: query.limit,
          RestaurantQueryEnum.Q.rawValue: query.q
        },
        method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data ?? [];
  }

  @override
  Future<List<Restaurant>> fetcRestaurantNameQuery(String text) {
    // TODO: implement fetchUserNameQuery
    throw UnimplementedError();
  }
}

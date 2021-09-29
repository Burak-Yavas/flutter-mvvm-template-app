import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/dashboard_enums.dart';
import '../model/dashboard_model.dart';
import '../model/slider_model.dart';

abstract class IDashBoardService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  IDashBoardService(this.manager, this.scaffoldyKey);

  Future<List<SliderModel>?> fetchSliderItems();
  Future<List<DashBoardModel>?> fetchDashBoardItems(DashBoardEnums type);

  // Future<List<Restaurant>> fetcRestaurantNameQuery(String text);
  // Future<Restaurant?> fetchRestaurant(id);
}

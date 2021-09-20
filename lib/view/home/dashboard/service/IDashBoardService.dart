import 'package:flutter/material.dart';
import 'package:mvvm_app/view/home/dashboard/model/dashboard_enums.dart';
import 'package:mvvm_app/view/home/dashboard/model/dashboard_model.dart';
import 'package:mvvm_app/view/home/dashboard/model/slider_model.dart';
import 'package:vexana/vexana.dart';

abstract class IDashBoardService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  IDashBoardService(this.manager, this.scaffoldyKey);

  Future<List<SliderModel>?> fetchSliderItems();
  Future<List<DashBoardModel>?> fetchDashBoardItems(DashBoardEnums type);

  // Future<List<Restaurant>> fetcRestaurantNameQuery(String text);
  // Future<Restaurant?> fetchRestaurant(id);
}

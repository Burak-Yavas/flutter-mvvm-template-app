import 'package:flutter/material.dart';
import 'package:mvvm_app/view/_product/_utility/serivce_helper.dart';
import 'package:mvvm_app/view/_product/enum/network_route_enum.dart';
import 'package:mvvm_app/view/home/dashboard/model/slider_model.dart';
import 'package:mvvm_app/view/home/dashboard/model/dashboard_model.dart';
import 'package:mvvm_app/view/home/dashboard/model/dashboard_enums.dart';

import 'package:vexana/vexana.dart';

import 'IDashBoardService.dart';

class DashBoardService extends IDashBoardService with ServiceHelper {
  DashBoardService(
      INetworkManager manager, GlobalKey<ScaffoldState> scaffoldyKey)
      : super(manager, scaffoldyKey);

  @override
  Future<List<DashBoardModel>> fetchDashBoardItems(DashBoardEnums type) async {
    final response = await manager.send<DashBoardModel, List<DashBoardModel>>(
        NetworkRoutes.DASHBOARD.rawValue,
        urlSuffix: '/${type.index + 1}',
        parseModel: DashBoardModel(),
        method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);

    await Future.delayed(Duration(seconds: 5));
    return response.data!;
  }

  @override
  Future<List<SliderModel>> fetchSliderItems() async {
    final response = await manager.send<SliderModel, List<SliderModel>>(
        NetworkRoutes.SLIDER.rawValue,
        parseModel: SliderModel(),
        method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    await Future.delayed(Duration(seconds: 5));
    return response.data!;
  }
}

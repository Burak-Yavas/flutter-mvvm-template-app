import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../../../_product/_utility/serivce_helper.dart';
import '../../../_product/enum/network_route_enum.dart';
import '../model/feed_model.dart';
import 'IFeedService.dart';

class FeedService extends IFeedService with ServiceHelper {
  FeedService(INetworkManager manager, GlobalKey<ScaffoldState> key)
      : super(manager, key);

  @override
  Future<List<HouseModel>?> fetchUserHouseList() async {
    final response = await manager.send<HouseModel, List<HouseModel>>(
        NetworkRoutes.FEED.rawValue,
        parseModel: HouseModel(),
        method: RequestType.GET);
    showMessage(scaffoldyKey, response.error);
    return response.data;
  }
}

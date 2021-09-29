import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/feed_model.dart';

abstract class IFeedService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  IFeedService(this.manager, this.scaffoldyKey);

  Future<List<HouseModel>?> fetchUserHouseList();
}

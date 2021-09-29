import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../_product/_utility/decoration_helper.dart';
import '../model/feed_model.dart';
import '../service/feed_service.dart';

part 'feed_view_model.g.dart';

class FeedViewModel = _FeedViewModelBase with _$FeedViewModel;

abstract class _FeedViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  late FeedService feedService;

  late DecorationHelper helper;

  @observable
  List<HouseModel>? feedModels = [];

  @computed
  HouseModel get sliderFeed => feedModels!.first;

  @observable
  bool isLoading = false;
  void init() {
    helper = DecorationHelper(context: context);
    feedService = FeedService(vexanaManager!.networkManager, scaffoldKey);
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> getListAll() async {
    _changeLoading();
    feedModels = await feedService.fetchUserHouseList();
    _changeLoading();
  }
}

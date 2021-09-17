import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_app/core/base/model/base_view_model.dart';
import 'package:mvvm_app/view/_product/_model/query/restaurant_query.dart';
import 'package:mvvm_app/view/_product/_utility/throttle_helper.dart';
import 'package:mvvm_app/view/home/restaurants/model/restaurant_model.dart';
import 'package:mvvm_app/view/home/restaurants/service/IRestaurantsService.dart';
import 'package:mvvm_app/view/home/restaurants/service/restaurants_service.dart';
part 'restaurant_view_model.g.dart';

class RestaurantViewModel = _RestaurantViewModelBase with _$RestaurantViewModel;

abstract class _RestaurantViewModelBase with Store, BaseViewModel {
  final IRestaurantsService _socialService;
  int _page = 0;
  String? _query = '';
  bool isLazyLoadDataFinish = false;

  int get page => _page;

  late ThrottleStringHelper _throttleStringHelper;
  @observable
  List<Restaurant> socialUserList = [];
  @observable
  bool isPageLoading = false;

  @observable
  bool isPageLoadingLazyLoad = false;

  _RestaurantViewModelBase(this._socialService);

  @override
  void setContext(BuildContext? context) => this.context = context;
  @override
  void init() {
    _throttleStringHelper = ThrottleStringHelper();
    _fetchAllUser();
  }

  @action
  Future<void> _fetchAllUser() async {
    _changeLoading();
    final response =
        await _socialService.fetchRestaurantsList(RestaurantQuery());
    socialUserList = response;
    _changeLoading();
  }

  @action
  Future<void> fetchAllUserLoading(int index) async {
    if (isPageLoadingLazyLoad ||
        index != socialUserList.length - 1 ||
        isLazyLoadDataFinish) return;
    _changeLoading();

    final response = await _socialService
        .fetchRestaurantsList(RestaurantQuery(limit: _page + 1, q: _query));
    if (response.isNotEmpty) {
      if (socialUserList.isEmpty) {
        socialUserList = response;
      } else if (response.last != socialUserList.last) {
        socialUserList.addAll(response);
        socialUserList = socialUserList;
      }
      _page++;
    } else {
      isLazyLoadDataFinish = true;
    }

    _changeLoading();
  }

  @action
  void fetchAllSearchQuery(String text) {
    _throttleStringHelper.onDelayTouch(text, (text) {
      if (_query!.isEmpty) {
        _page = -1;
      }
      _query = text;
      isLazyLoadDataFinish = false;
      socialUserList = [];
      fetchAllUserLoading(socialUserList.length - 1);
    });
  }

  @action
  void _changeLoading() {
    isPageLoading = !isPageLoading;
  }

  @action
  void _changeLoadingLazyLoad() {
    isPageLoadingLazyLoad = !isPageLoadingLazyLoad;
  }
}

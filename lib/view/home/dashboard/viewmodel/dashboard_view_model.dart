import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_app/core/base/model/base_view_model.dart';
import 'package:mvvm_app/view/home/dashboard/model/dashboard_enums.dart';
import 'package:mvvm_app/view/home/dashboard/model/dashboard_model.dart';
import 'package:mvvm_app/view/home/dashboard/model/slider_model.dart';
import 'package:mvvm_app/view/home/dashboard/service/dashboard_service.dart';
part 'dashboard_view_model.g.dart';

class DashBoardViewModel = _DashBoardViewModelBase with _$DashBoardViewModel;

abstract class _DashBoardViewModelBase with Store, BaseViewModel {
  _DashBoardViewModelBase(this.dashBoardService);
  List<SliderModel>? sliderItems = [];
  List<DashBoardModel>? recomItems = [];
  List<DashBoardModel>? allItems = [];

  @override
  void setContext(BuildContext context) => this.context = context;

  final DashBoardService dashBoardService;

  @observable
  bool isLoading = false;

  @override
  void init() {
    fetchSliderItems();
    onRecomItems();
    onAllItems();
  }

  @action
  Future<void> fetchSliderItems() async {
    changeLoading();
    final response = await dashBoardService.fetchSliderItems();
    sliderItems = response;
    changeLoading();
  }

  @action
  Future<void> onRecomItems() async {
    // if (recomItems.isNotEmpty) return recomItems;
    //if (recomItems.isNotEmpty) return;
    changeLoading();
    final response =
        await dashBoardService.fetchDashBoardItems(DashBoardEnums.RECOM);
    recomItems = response;
    changeLoading();

    //if (recomItems!.isNotEmpty) return;
    // return response;
  }

  @action
  Future<void> onAllItems() async {
    // if (allItems.isNotEmpty) return allItems;
    changeLoading();
    final response =
        await dashBoardService.fetchDashBoardItems(DashBoardEnums.ALL);
    allItems = response;
    changeLoading();
    // return response;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_app/core/base/model/base_view_model.dart';
import 'package:mvvm_app/core/extension/context_extension.dart';
import 'package:mvvm_app/view/_product/_utility/detail_utility_enums.dart';
import 'package:mvvm_app/view/home/detail/model/detail_model.dart';
import 'package:mvvm_app/view/home/detail/service/detail_service.dart';
part 'detail_view_model.g.dart';

class DetailViewModel = _DetailViewModelBase with _$DetailViewModel;

abstract class _DetailViewModelBase with Store, BaseViewModel {
  final DetailService detailService;

  _DetailViewModelBase(this.detailService);

  @observable
  bool isLoading = false;

  @observable
  bool isLoadingMain = false;

  @observable
  List<DetailModel> favoriteDetails = [];
  @observable
  List<DetailModel> mainDetails = [];

  RangeValues? _values;

  bool _isAscending = true;
  @observable
  bool isFiltering = false;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    fetchFavorite();
    fetchNormalItems();
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  void _changeLoadingMain() {
    isLoadingMain = !isLoadingMain;
  }

  @action
  void changeFiltering() {
    isFiltering = !isFiltering;
  }

  @action
  Future<void> fetchFavorite() async {
    _changeLoading();
    favoriteDetails = await detailService.fetchFavorites();
    _changeLoading();
  }

  @action
  Future<void> fetchNormalItems() async {
    if (mainDetails.isNotEmpty) return;
    _changeLoadingMain();
    mainDetails =
        await detailService.fetchSorted(sortValue: DetailSortValues.RATES);
    _changeLoadingMain();
  }

  void changeRangeValues(RangeValues values) {
    _values = values;
  }

  void changeAscending(bool value) {
    _isAscending = value;
  }

  @action
  Future<void> fetchMinMax() async {
    // context.navigation.pop();
    _changeLoadingMain();
    changeFiltering();

    mainDetails = await detailService.fetchLimited(
        max: _values?.end, min: _values?.start);
    changeFiltering();
    _changeLoadingMain();
  }

  Future<void> fetchSort(DetailSortValues value) async {
    // context.navigation.pop();
    _changeLoadingMain();
    mainDetails = await detailService.fetchSorted(
        sortValue: value,
        valuesType:
            _isAscending ? DetailSortValuesType.ASC : DetailSortValuesType.DSC);
    _changeLoadingMain();
  }
}

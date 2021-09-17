// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RestaurantViewModel on _RestaurantViewModelBase, Store {
  final _$socialUserListAtom =
      Atom(name: '_RestaurantViewModelBase.socialUserList');

  @override
  List<Restaurant> get socialUserList {
    _$socialUserListAtom.reportRead();
    return super.socialUserList;
  }

  @override
  set socialUserList(List<Restaurant> value) {
    _$socialUserListAtom.reportWrite(value, super.socialUserList, () {
      super.socialUserList = value;
    });
  }

  final _$isPageLoadingAtom =
      Atom(name: '_RestaurantViewModelBase.isPageLoading');

  @override
  bool get isPageLoading {
    _$isPageLoadingAtom.reportRead();
    return super.isPageLoading;
  }

  @override
  set isPageLoading(bool value) {
    _$isPageLoadingAtom.reportWrite(value, super.isPageLoading, () {
      super.isPageLoading = value;
    });
  }

  final _$isPageLoadingLazyLoadAtom =
      Atom(name: '_RestaurantViewModelBase.isPageLoadingLazyLoad');

  @override
  bool get isPageLoadingLazyLoad {
    _$isPageLoadingLazyLoadAtom.reportRead();
    return super.isPageLoadingLazyLoad;
  }

  @override
  set isPageLoadingLazyLoad(bool value) {
    _$isPageLoadingLazyLoadAtom.reportWrite(value, super.isPageLoadingLazyLoad,
        () {
      super.isPageLoadingLazyLoad = value;
    });
  }

  final _$_fetchAllUserAsyncAction =
      AsyncAction('_RestaurantViewModelBase._fetchAllUser');

  @override
  Future<void> _fetchAllUser() {
    return _$_fetchAllUserAsyncAction.run(() => super._fetchAllUser());
  }

  final _$fetchAllUserLoadingAsyncAction =
      AsyncAction('_RestaurantViewModelBase.fetchAllUserLoading');

  @override
  Future<void> fetchAllUserLoading(int index) {
    return _$fetchAllUserLoadingAsyncAction
        .run(() => super.fetchAllUserLoading(index));
  }

  final _$_RestaurantViewModelBaseActionController =
      ActionController(name: '_RestaurantViewModelBase');

  @override
  void fetchAllSearchQuery(String text) {
    final _$actionInfo = _$_RestaurantViewModelBaseActionController.startAction(
        name: '_RestaurantViewModelBase.fetchAllSearchQuery');
    try {
      return super.fetchAllSearchQuery(text);
    } finally {
      _$_RestaurantViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$_RestaurantViewModelBaseActionController.startAction(
        name: '_RestaurantViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_RestaurantViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingLazyLoad() {
    final _$actionInfo = _$_RestaurantViewModelBaseActionController.startAction(
        name: '_RestaurantViewModelBase._changeLoadingLazyLoad');
    try {
      return super._changeLoadingLazyLoad();
    } finally {
      _$_RestaurantViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
socialUserList: ${socialUserList},
isPageLoading: ${isPageLoading},
isPageLoadingLazyLoad: ${isPageLoadingLazyLoad}
    ''';
  }
}

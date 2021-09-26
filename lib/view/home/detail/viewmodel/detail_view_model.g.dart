// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailViewModel on _DetailViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_DetailViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoadingMainAtom = Atom(name: '_DetailViewModelBase.isLoadingMain');

  @override
  bool get isLoadingMain {
    _$isLoadingMainAtom.reportRead();
    return super.isLoadingMain;
  }

  @override
  set isLoadingMain(bool value) {
    _$isLoadingMainAtom.reportWrite(value, super.isLoadingMain, () {
      super.isLoadingMain = value;
    });
  }

  final _$favoriteDetailsAtom =
      Atom(name: '_DetailViewModelBase.favoriteDetails');

  @override
  List<DetailModel> get favoriteDetails {
    _$favoriteDetailsAtom.reportRead();
    return super.favoriteDetails;
  }

  @override
  set favoriteDetails(List<DetailModel> value) {
    _$favoriteDetailsAtom.reportWrite(value, super.favoriteDetails, () {
      super.favoriteDetails = value;
    });
  }

  final _$mainDetailsAtom = Atom(name: '_DetailViewModelBase.mainDetails');

  @override
  List<DetailModel> get mainDetails {
    _$mainDetailsAtom.reportRead();
    return super.mainDetails;
  }

  @override
  set mainDetails(List<DetailModel> value) {
    _$mainDetailsAtom.reportWrite(value, super.mainDetails, () {
      super.mainDetails = value;
    });
  }

  final _$isFilteringAtom = Atom(name: '_DetailViewModelBase.isFiltering');

  @override
  bool get isFiltering {
    _$isFilteringAtom.reportRead();
    return super.isFiltering;
  }

  @override
  set isFiltering(bool value) {
    _$isFilteringAtom.reportWrite(value, super.isFiltering, () {
      super.isFiltering = value;
    });
  }

  final _$fetchFavoriteAsyncAction =
      AsyncAction('_DetailViewModelBase.fetchFavorite');

  @override
  Future<void> fetchFavorite() {
    return _$fetchFavoriteAsyncAction.run(() => super.fetchFavorite());
  }

  final _$fetchNormalItemsAsyncAction =
      AsyncAction('_DetailViewModelBase.fetchNormalItems');

  @override
  Future<void> fetchNormalItems() {
    return _$fetchNormalItemsAsyncAction.run(() => super.fetchNormalItems());
  }

  final _$fetchMinMaxAsyncAction =
      AsyncAction('_DetailViewModelBase.fetchMinMax');

  @override
  Future<void> fetchMinMax() {
    return _$fetchMinMaxAsyncAction.run(() => super.fetchMinMax());
  }

  final _$_DetailViewModelBaseActionController =
      ActionController(name: '_DetailViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$_DetailViewModelBaseActionController.startAction(
        name: '_DetailViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_DetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingMain() {
    final _$actionInfo = _$_DetailViewModelBaseActionController.startAction(
        name: '_DetailViewModelBase._changeLoadingMain');
    try {
      return super._changeLoadingMain();
    } finally {
      _$_DetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeFiltering() {
    final _$actionInfo = _$_DetailViewModelBaseActionController.startAction(
        name: '_DetailViewModelBase.changeFiltering');
    try {
      return super.changeFiltering();
    } finally {
      _$_DetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoadingMain: ${isLoadingMain},
favoriteDetails: ${favoriteDetails},
mainDetails: ${mainDetails},
isFiltering: ${isFiltering}
    ''';
  }
}

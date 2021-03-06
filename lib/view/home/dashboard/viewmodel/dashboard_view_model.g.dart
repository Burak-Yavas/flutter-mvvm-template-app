// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashBoardViewModel on _DashBoardViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_DashBoardViewModelBase.isLoading');

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

  final _$fetchSliderItemsAsyncAction =
      AsyncAction('_DashBoardViewModelBase.fetchSliderItems');

  @override
  Future<void> fetchSliderItems() {
    return _$fetchSliderItemsAsyncAction.run(() => super.fetchSliderItems());
  }

  final _$onRecomItemsAsyncAction =
      AsyncAction('_DashBoardViewModelBase.onRecomItems');

  @override
  Future<void> onRecomItems() {
    return _$onRecomItemsAsyncAction.run(() => super.onRecomItems());
  }

  final _$onAllItemsAsyncAction =
      AsyncAction('_DashBoardViewModelBase.onAllItems');

  @override
  Future<void> onAllItems() {
    return _$onAllItemsAsyncAction.run(() => super.onAllItems());
  }

  final _$_DashBoardViewModelBaseActionController =
      ActionController(name: '_DashBoardViewModelBase');

  @override
  void changeLoading() {
    final _$actionInfo = _$_DashBoardViewModelBaseActionController.startAction(
        name: '_DashBoardViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_DashBoardViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_LoginViewModelBase.isLoading');

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

  final _$isVisibleOpenAtom = Atom(name: '_LoginViewModelBase.isVisibleOpen');

  @override
  bool get isVisibleOpen {
    _$isVisibleOpenAtom.reportRead();
    return super.isVisibleOpen;
  }

  @override
  set isVisibleOpen(bool value) {
    _$isVisibleOpenAtom.reportWrite(value, super.isVisibleOpen, () {
      super.isVisibleOpen = value;
    });
  }

  final _$fetchLoginServiceAsyncAction =
      AsyncAction('_LoginViewModelBase.fetchLoginService');

  @override
  Future<void> fetchLoginService() {
    return _$fetchLoginServiceAsyncAction.run(() => super.fetchLoginService());
  }

  final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase');

  @override
  dynamic isLoadingChanged() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.isLoadingChanged');
    try {
      return super.isLoadingChanged();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isVisibleStateChanged() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.isVisibleStateChanged');
    try {
      return super.isVisibleStateChanged();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isVisibleOpen: ${isVisibleOpen}
    ''';
  }
}

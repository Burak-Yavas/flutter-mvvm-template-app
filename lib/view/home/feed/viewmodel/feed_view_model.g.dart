// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedViewModel on _FeedViewModelBase, Store {
  Computed<HouseModel>? _$sliderFeedComputed;

  @override
  HouseModel get sliderFeed =>
      (_$sliderFeedComputed ??= Computed<HouseModel>(() => super.sliderFeed,
              name: '_FeedViewModelBase.sliderFeed'))
          .value;

  final _$feedModelsAtom = Atom(name: '_FeedViewModelBase.feedModels');

  @override
  List<HouseModel>? get feedModels {
    _$feedModelsAtom.reportRead();
    return super.feedModels;
  }

  @override
  set feedModels(List<HouseModel>? value) {
    _$feedModelsAtom.reportWrite(value, super.feedModels, () {
      super.feedModels = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_FeedViewModelBase.isLoading');

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

  final _$_FeedViewModelBaseActionController =
      ActionController(name: '_FeedViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$_FeedViewModelBaseActionController.startAction(
        name: '_FeedViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_FeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
feedModels: ${feedModels},
isLoading: ${isLoading},
sliderFeed: ${sliderFeed}
    ''';
  }
}

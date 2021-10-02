import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extension/context_extension.dart';

part 'app_menu_view_model.g.dart';

class AppMenuViewModel = _AppMenuViewModelBase with _$AppMenuViewModel;

abstract class _AppMenuViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  Future<void> navigate() async {
    await Future.delayed(context.normalDuration * 2);
    navigation.navigateToPage(path: NavigationConstants.SETTINGS);
  }

  Future<void> navigateSearch() async {
    await Future.delayed(context.normalDuration * 2);
    navigation.navigateToPage(path: NavigationConstants.RESTAURANT);
  }
}

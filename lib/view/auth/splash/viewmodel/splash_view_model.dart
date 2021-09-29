import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extension/context_extension.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @observable
  bool isFirstInit = true;

  @override
  void init() {
    startAnimationOnView();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      navigate();
    });
  }

  Future<void> startAnimationOnView() async {
    await Future.delayed(context.normalDuration);
    _changeFirstInit();
  }

  @action
  void _changeFirstInit() {
    isFirstInit = !isFirstInit;
  }

  Future<void> navigate() async {
    await Future.delayed(context.normalDuration * 2);
    if (PreferencesKeys.IS_FIRST_APP == true) {
      navigation.navigateToPageClear(path: NavigationConstants.ON_BOARD);
    } else {
      navigation.navigateToPageClear(path: NavigationConstants.LOGIN);
    }
  }
}

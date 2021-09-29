import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_constants/image_path_svg.dart';
import '../model/on_board_model.dart';

part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  List<OnBoardModel> onBoardItems = [];

  @observable
  int currentIndex = 0;

  @observable
  bool isLoading = false;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  void init() {
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page1_title.tr(),
        LocaleKeys.onBoard_page1_desc.locale, ImagePathSvg.instance!.svg1));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page2_title.tr(),
        LocaleKeys.onBoard_page2_desc.locale, ImagePathSvg.instance!.svg2));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page3_title.tr(),
        LocaleKeys.onBoard_page3_desc.locale, ImagePathSvg.instance!.svg3));
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();
    if (navigation.navigatorKey.currentState!.canPop()) {
      navigation.navigatorKey.currentState!.pop();
    } else {
      await navigation.navigateToPageClear(path: NavigationConstants.LOGIN);
    }
  }
}

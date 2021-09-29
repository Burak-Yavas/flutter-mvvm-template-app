import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/notifier/theme_notifer.dart';
import '../../../product/model/user.dart';
import '../model/settings_dynamic_model.dart';

part 'settings_view_model.g.dart';
part 'subviewmodel/about_view_model.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  final userModel = UserModel.fake();
  String current = "";
  @override
  void setContext(BuildContext context) => this.context = context;

  @observable
  Locale? appLocale;

  @override
  void init() {
    appLocale = context.deviceLocale; //?
  }

  void changeAppTheme() {
    context.read<ThemeNotifier>().changeTheme();
  }

  @action
  void changeAppLocalization(Locale? locale) {
    appLocale = locale;
    //context.setLocale(locale);
    if (locale != null) {
      context.setLocale(locale);
    }
  }
}

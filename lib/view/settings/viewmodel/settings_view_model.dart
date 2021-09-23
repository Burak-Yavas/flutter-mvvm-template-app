import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_app/core/base/model/base_view_model.dart';
import 'package:mvvm_app/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_app/core/init/lang/language_manager.dart';
import 'package:mvvm_app/core/init/notifier/theme_notifer.dart';
import 'package:mvvm_app/product/model/user.dart';
import 'package:mvvm_app/view/settings/model/settings_dynamic_model.dart';
import 'package:provider/provider.dart';
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

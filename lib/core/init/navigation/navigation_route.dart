import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../product/exception/navigate_model_not_found.dart';
import '../../../view/auth/login/view/login_view.dart';
import '../../../view/auth/onboard/view/on_board_view.dart';
import '../../../view/auth/splash/view/splash_view.dart';
import '../../../view/home/app_menu/view/app_menu_view.dart';
import '../../../view/home/dashboard/view/dashboard_view.dart';
import '../../../view/home/restaurants/view/restaurants_view.dart';
import '../../../view/settings/model/settings_dynamic_model.dart';
import '../../../view/settings/view/settings_view.dart';
import '../../../view/settings/view/subview/settings_dynamic_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(SplashView());
      case NavigationConstants.LOGIN:
        return normalNavigate(LoginView());
      case NavigationConstants.ON_BOARD:
        return normalNavigate(OnBoardView());
      case NavigationConstants.DASHBOARD:
        return normalNavigate(DashBoardView());
      case NavigationConstants.SETTINGS:
        return normalNavigate(SettingsView());
      case NavigationConstants.RESTAURANT:
        return normalNavigate(RestaurantsView());
      case NavigationConstants.APPMENUVIEW:
        return normalNavigate(AppMenuView());
      case NavigationConstants.SETTINGS_WEB_VIEW:
        if (args.arguments is SettingsDynamicModel) {
          return normalNavigate(SettingsDynamicView(
            model: args.arguments as SettingsDynamicModel,
          ));
        }
        throw NavigateException<SettingsDynamicModel>(args.arguments);
      default:
        return MaterialPageRoute(
          builder: (context) => OnBoardView(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}

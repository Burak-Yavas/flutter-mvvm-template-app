import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_app/view/auth/onboard/view/on_board_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:

      case NavigationConstants.ON_BOARD:
        return normalNavigate(OnBoardView());

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

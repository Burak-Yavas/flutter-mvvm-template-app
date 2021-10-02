import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/components/decoration/circle_decoration.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/app_menu_view_model.dart';
import '../../dashboard/view/dashboard_menu_view.dart';
import '../../feed/view/feed_menu_view.dart';

class AppMenuView extends StatelessWidget {
  const AppMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AppMenuViewModel>(
      viewModel: AppMenuViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, AppMenuViewModel viewModel) =>
          DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: buildAppBar(context, viewModel),
          body: TabBarView(
              children: <Widget>[FeedMenuView(), DashBoardMenuView()]),
        ),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
        indicator:
            CircleDecoration(color: context.colors.onSecondary, radius: 2),
        tabs: [
          Tab(
            text: LocaleKeys.home_appMenu_tab1.tr(),
          ),
          Tab(
            text: LocaleKeys.home_appMenu_tab2.tr(),
          ),
        ]);
  }

  Center buildCenter() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  AppBar buildAppBar(BuildContext context, AppMenuViewModel viewModel) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        LocaleKeys.home_dashboard_title.tr(),
        style: Theme.of(context).textTheme.headline5!.copyWith(
            color: context.colors.onError, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.settings),
        onPressed: () => viewModel.navigate(),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => viewModel.navigateSearch(),
        )
      ],
      bottom: buildTabBar(context),
    );
  }
}

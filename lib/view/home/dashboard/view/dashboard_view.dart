import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_app/core/base/view/base_widget.dart';
import 'package:mvvm_app/core/extension/context_extension.dart';
import 'package:mvvm_app/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_app/core/init/network/vexana_manager.dart';
import 'package:mvvm_app/product/widget/card/restaurant_card.dart';
import 'package:mvvm_app/product/widget/grid/dashboard_grid_view.dart';
import 'package:mvvm_app/product/widget/pageview/dashboard_slider.dart';
import 'package:mvvm_app/view/home/dashboard/model/dashboard_model.dart';
import 'package:mvvm_app/view/home/dashboard/model/dashboard_view_state.dart';
import 'package:mvvm_app/view/home/dashboard/model/slider_model.dart';
import 'package:mvvm_app/view/home/dashboard/service/dashboard_service.dart';
import 'package:mvvm_app/view/home/dashboard/viewmodel/dashboard_view_model.dart';

class DashBoardView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldyKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<DashBoardViewModel>(
      viewModel: DashBoardViewModel(DashBoardService(
          VexanaManager.instance.networkManager, _scaffoldyKey)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, DashBoardViewModel viewModel) =>
          Scaffold(
              key: _scaffoldyKey,
              appBar: buildAppBar(context),
              body: Observer(builder: (_) {
                return viewModel.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : DefaultTabController(
                        length: 2,
                        child: ListView.builder(
                            itemCount: DashBoardViewItems.values.length,
                            itemBuilder: (context, index) {
                              switch (DashBoardViewItems.values[index]) {
                                case DashBoardViewItems.SEARCH_BAR:
                                  return buildSearchBar(context);
                                case DashBoardViewItems.TAB_BAR:
                                  return buildTabBar();
                                case DashBoardViewItems.SLIDER:
                                  return buildSizedBoxSlider(
                                      context, viewModel.sliderItems!);
                                case DashBoardViewItems.RECOMM_RESTAURANTS:
                                  return buildRecommsSizedBox(
                                      context, viewModel.recomItems!);
                                case DashBoardViewItems.ALL_RESTAURANTS:
                                  return buildAllSizedBox(
                                      context, viewModel.allItems!);
                                default:
                                  throw Exception("State Not Found");
                                // return Card(child: Text("data"));
                              }
                            }),
                      );
              })),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        leading: Icon(Icons.api_rounded),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          LocaleKeys.home_dashboard_title.tr(),
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: context.colors.onError, fontWeight: FontWeight.bold),
        ));
  }

  Widget buildRecommsSizedBox(
      BuildContext context, List<DashBoardModel> items) {
    return SizedBox(
      height: context.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRecommTitleText(context),
          Expanded(
              child: DashBoardGrid(
            models: items,
          )),
        ],
      ),
    );
  }

  Widget buildAllSizedBox(BuildContext context, List<DashBoardModel> items) {
    return SizedBox(
      height: context.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAllTitleText(context),
          Expanded(child: DashBoardGrid(models: items)),
        ],
      ),
    );
  }

  TabBar buildTabBar() => TabBar(tabs: [Text("1"), Text("2")]);

  Text buildRecommTitleText(BuildContext context) {
    return Text(
      LocaleKeys.home_dashboard_recommendedRestaurants.tr(),
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: context.colors.onError),
    );
  }

  Text buildAllTitleText(BuildContext context) {
    return Text(
      LocaleKeys.home_dashboard_allRestaurants.tr(),
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: context.colors.onError),
    );
  }

  Widget buildSizedBoxSlider(BuildContext context, List<SliderModel> items) {
    return Padding(
      padding: context.paddingLowVertical,
      child: SizedBox(
          height: context.height * 0.3,
          child: DashBoardSlider(
            sliderModel: items,
          )),
    );
  }

  Padding buildSearchBar(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: TextFormField(
        decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}

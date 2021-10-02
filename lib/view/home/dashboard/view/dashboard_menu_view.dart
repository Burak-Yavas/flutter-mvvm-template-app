import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../../../../product/widget/grid/dashboard_grid_view.dart';
import '../../../../product/widget/pageview/dashboard_slider.dart';
import '../model/dashboard_model.dart';
import '../model/dashboard_view_state.dart';
import '../model/slider_model.dart';
import '../service/dashboard_service.dart';
import '../viewmodel/dashboard_view_model.dart';

class DashBoardMenuView extends StatelessWidget {
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
              body: Observer(builder: (_) {
                return viewModel.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: context.paddingLow,
                        child: ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: DashBoardMenuViewItems.values.length,
                            itemBuilder: (context, index) {
                              switch (DashBoardMenuViewItems.values[index]) {
                                case DashBoardMenuViewItems.SLIDER:
                                  return buildSizedBoxSlider(
                                      context, viewModel.sliderItems!);
                                case DashBoardMenuViewItems.RECOMM_RESTAURANTS:
                                  return buildRecommsSizedBox(
                                      context, viewModel.recomItems!);
                                case DashBoardMenuViewItems.ALL_RESTAURANTS:
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

  Text buildRecommTitleText(BuildContext context) {
    return Text(
      LocaleKeys.home_dashboard_recommendedRestaurants.tr(),
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: context.colors.onError),
    );
  }

  Widget buildRecommsSizedBox(
      BuildContext context, List<DashBoardModel> items) {
    return SizedBox(
      height: context.height * 0.3,
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

  Text buildAllTitleText(BuildContext context) {
    return Text(
      LocaleKeys.home_dashboard_allRestaurants.tr(),
      style: Theme.of(context)
          .textTheme
          .subtitle1!
          .copyWith(color: context.colors.onError),
    );
  }

  Widget buildAllSizedBox(BuildContext context, List<DashBoardModel> items) {
    return SizedBox(
      height: context.height * 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAllTitleText(context),
          Expanded(child: DashBoardGrid(models: items)),
        ],
      ),
    );
  }
}

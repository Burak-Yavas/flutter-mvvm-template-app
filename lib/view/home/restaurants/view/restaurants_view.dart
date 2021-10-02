import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../../../_product/_widgets/animations/restaurant_card_animation.dart';
import '../../../_product/_widgets/listtile/restaurant_card.dart';
import '../service/restaurants_service.dart';
import '../viewmodel/restaurant_view_model.dart';

class RestaurantsView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<RestaurantViewModel>(
      viewModel: RestaurantViewModel(RestaurantsService(
          VexanaManager.instance.networkManager, scaffoldKey)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, RestaurantViewModel viewModel) =>
          Container(
        color: context.colors.primaryVariant,
        padding: context.paddingLow,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextFindRestaurants(context).tr(),
              Spacer(flex: 2),
              TextField(
                onChanged: (value) {
                  viewModel.fetchAllSearchQuery(value);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,
                        color: context.colors.secondaryVariant)),
              ),
              Spacer(flex: 2),
              Expanded(
                  flex: 90,
                  child: Observer(
                      builder: (_) => buildListViewRestaurant(viewModel)))
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Text buildTextFindRestaurants(BuildContext context) {
    return Text(
      LocaleKeys.home_restaurants_search,
      style: context.textTheme.headline4!
          .copyWith(fontWeight: FontWeight.bold, color: context.colors.onError),
    );
  }

  Widget buildListViewRestaurant(RestaurantViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.socialUserList.length,
      itemBuilder: (context, index) {
        viewModel.fetchAllUserLoading(index);
        return OpenContainerRestaurantlWrapper(
          restaurant: viewModel.socialUserList[index],
          closedBuilder: (BuildContext _, VoidCallback openContainer) =>
              RestaurantCard(
            restaurant: viewModel.socialUserList[index],
            onPressed: openContainer,
          ),
        );
      },
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../model/feed_model.dart';
import '../viewmodel/feed_view_model.dart';

class FeedMenuView extends StatelessWidget {
  const FeedMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<FeedViewModel>(
      viewModel: FeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getListAll();
      },
      onPageBuilder: (BuildContext context, FeedViewModel viewModel) =>
          Scaffold(
        key: viewModel.scaffoldKey,
        body: Observer(builder: (_) {
          return viewModel.isLoading
              ? buildCenter()
              : viewModel.feedModels == null || viewModel.feedModels!.isEmpty
                  ? Center(child: Text(LocaleKeys.home_feed_notFound))
                  : buildListViewRecomm(context, viewModel);
        }),
      ),
    );
  }

  ListView buildListViewRecomm(BuildContext context, FeedViewModel viewModel) {
    return ListView(
      padding: context.paddingLow,
      children: [
        buildOnTopRecommsPageView(viewModel),
        Padding(
          padding: context.paddingLow,
          child: Text(
            LocaleKeys.home_feed_subtitle_recommended.tr(),
            style: context.textTheme.headline5!.copyWith(),
          ),
        ),
        buildOnBottomAllRecommsListView(viewModel)
      ],
    );
  }

  ListView buildOnBottomAllRecommsListView(FeedViewModel viewModel) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SizedBox(
          height: context.height * 0.17,
          child: Card(
              child: Row(
            children: [
              Expanded(
                child: Image.network(
                  viewModel.feedModels![index].image!,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                  flex: 8,
                  child: buildColumnUserCard(
                      context, viewModel.feedModels![index])),
            ],
          ))),
      itemCount: viewModel.feedModels!.length,
      shrinkWrap: true,
    );
  }

  SizedBox buildOnTopRecommsPageView(FeedViewModel viewModel) {
    return SizedBox(
      //color: context.colors.primary,
      height: 300,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.95),
        itemBuilder: (context, index) =>
            buildStack(context, viewModel.sliderFeed),
        itemCount: 3,
      ),
    );
  }

  Center buildCenter() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildStack(BuildContext context, HouseModel model) {
    return Padding(
      padding: context.paddingLow,
      child: Stack(
        children: [
          Positioned.fill(
              bottom: 100,
              child: Image.network(
                model.image!,
                fit: BoxFit.cover,
              )),
          Positioned.fill(
              left: 15,
              right: 15,
              top: 150,
              child: Card(
                child: Padding(
                  padding: context.paddingLow,
                  child: buildColumnUserCard(context, model),
                ),
              )),
        ],
      ),
    );
  }

  Column buildColumnUserCard(BuildContext context, HouseModel house) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: CircleAvatar(
              child: Image.network(
            house.user!.image!,
            fit: BoxFit.cover,
          )),
          title: Text(house.user!.name!),
          subtitle: Text(house.user!.date!),
        ),
        Text(house.title!,
            style: context.textTheme.headline6!
                .copyWith(fontWeight: FontWeight.w300, fontSize: 20)),
        Text(house.description!),
      ],
    );
  }
}

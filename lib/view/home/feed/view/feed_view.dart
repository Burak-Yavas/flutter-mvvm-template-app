import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_app/core/base/view/base_widget.dart';
import 'package:mvvm_app/core/components/decoration/circle_decoration.dart';
import 'package:mvvm_app/core/extension/context_extension.dart';
import 'package:mvvm_app/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_app/view/home/feed/model/feed_model.dart';
import 'package:mvvm_app/view/home/feed/viewmodel/feed_view_model.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

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
        appBar: buildAppBar(),
        body: DefaultTabController(
          length: 4,
          child: Observer(builder: (_) {
            return viewModel.isLoading
                ? buildCenter()
                : viewModel.feedModels == null || viewModel.feedModels!.isEmpty
                    ? Center(child: Text("Not Found!"))
                    : buildListViewRecomm(context, viewModel);
          }),
        ),
      ),
    );
  }

  ListView buildListViewRecomm(BuildContext context, FeedViewModel viewModel) {
    return ListView(
      padding: context.paddingLow,
      children: [
        buildTabBar(context),
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

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
        indicator:
            CircleDecoration(color: context.colors.onSecondary, radius: 2),
        tabs: [
          Tab(
            text: LocaleKeys.home_feed_tabBar_tab1.tr(),
          ),
          Tab(
            text: LocaleKeys.home_feed_tabBar_tab2.tr(),
          ),
          Tab(
            text: LocaleKeys.home_feed_tabBar_tab3.tr(),
          ),
          Tab(
            text: LocaleKeys.home_feed_tabBar_tab4.tr(),
          )
        ]);
  }

  Center buildCenter() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
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
          leading: CircleAvatar(),
          title: Text(house.user!.name!),
          subtitle: Text(house.user!.date!),
          trailing: Text("RATE"),
        ),
        Text(house.title!,
            style: context.textTheme.headline6!
                .copyWith(fontWeight: FontWeight.w300, fontSize: 20)),
        Text(house.description!),
      ],
    );
  }
}

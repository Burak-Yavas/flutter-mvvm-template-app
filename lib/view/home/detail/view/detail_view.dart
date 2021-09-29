import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/components/slider/range_price_slider.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../../../_product/_utility/detail_utility_enums.dart';
import '../../../_product/_widgets/card/detail_card.dart';
import '../service/detail_service.dart';
import '../viewmodel/detail_view_model.dart';

enum _DetailEnum { TITLE, TOP_SELLERS, NORMAL_TITLE, NORMAL_SORT }

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<DetailViewModel>(
      viewModel:
          DetailViewModel(DetailService(VexanaManager.instance.networkManager)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, DetailViewModel viewModel) =>
          Scaffold(
              appBar: buildAppBar(context, viewModel),
              body: Padding(
                padding: context.paddingLow,
                child: Observer(builder: (_) {
                  return viewModel.isLoading
                      ? buildCenterLoading()
                      : ListView.builder(
                          itemCount: _DetailEnum.values.length,
                          itemBuilder: (context, index) {
                            final _views = _DetailEnum.values[index];
                            switch (_views) {
                              case _DetailEnum.TITLE:
                                return buildTitleText(
                                    context, LocaleKeys.home_detail_title.tr());
                              case _DetailEnum.TOP_SELLERS:
                                return buildSizedBoxDetailCard(
                                    context, viewModel);
                              case _DetailEnum.NORMAL_TITLE:
                                return buildTitleText(context,
                                    LocaleKeys.home_detail_title2.tr());
                              case _DetailEnum.NORMAL_SORT:
                                viewModel.fetchNormalItems();
                                return buildSizedBoxDetailCardNormal(
                                    viewModel, context);
                            }
                          });
                }),
              )),
    );
  }

  AppBar buildAppBar(BuildContext context, DetailViewModel viewModel) {
    return AppBar(actions: [
      IconButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => buildBottomSheetBody(context, viewModel));
          },
          icon: Icon(Icons.filter_list_outlined))
    ]);
  }

  Widget buildBottomSheetBody(
          BuildContext context, DetailViewModel viewModel) =>
      Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.home_detail_filter.tr()),
            Divider(height: 2, thickness: 2),
            Row(
              children: [
                Expanded(
                  child: RangePriceSLider(
                    min: 10,
                    max: 50,
                    onCompleted: (values) {
                      viewModel.changeRangeValues(values);
                    },
                  ),
                ),
                IconButton(onPressed: () {
                  viewModel.fetchMinMax();
                }, icon: Observer(builder: (context) {
                  return viewModel.isFiltering == true
                      ? Icon(Icons.donut_large)
                      : Icon(Icons.done);
                }))
              ],
            ),
            Card(
              child: Column(
                children: [
                  Wrap(
                    spacing: 10,
                    children: DetailSortValues.values
                        .map((e) => IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              viewModel.fetchSort(e);
                            },
                            icon: Text(e.rawValue, maxLines: 1)))
                        .toList(),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => viewModel.changeAscending(true),
                          icon: Icon(Icons.plus_one)),
                      IconButton(
                          onPressed: () => viewModel.changeAscending(true),
                          icon: Icon(Icons.design_services_rounded)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildSizedBoxDetailCardNormal(
      DetailViewModel viewModel, BuildContext context) {
    return Padding(
      padding: context.paddingNormalVertical,
      child: SizedBox(
        child: Observer(
          builder: (_) {
            return viewModel.isLoadingMain
                ? buildCenterLoading()
                : GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: viewModel.mainDetails.length,
                    itemBuilder: (context, index) {
                      return DetailCard(model: viewModel.mainDetails[index]);
                    });
          },
        ),
      ),
    );
  }

  Center buildCenterLoading() =>
      Center(child: CircularProgressIndicator.adaptive());

  Widget buildSizedBoxDetailCard(
      BuildContext context, DetailViewModel viewModel) {
    return Padding(
      padding: context.paddingNormalVertical,
      child: SizedBox(
          height: context.height * 0.3,
          child: DetailCard().buildList(viewModel.favoriteDetails)),
    );
  }

  Widget buildTitleText(BuildContext context, String title) {
    return Padding(
      padding: context.paddingLowVertical,
      child: Text(
        title,
        style: context.textTheme.headline4?.copyWith(
            color: context.colors.onSecondary, fontWeight: FontWeight.w400),
      ),
    );
  }
}

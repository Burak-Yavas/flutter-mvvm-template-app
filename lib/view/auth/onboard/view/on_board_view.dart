import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvvm_app/core/base/model/base_view_model.dart';
import 'package:mvvm_app/core/base/view/base_widget.dart';
import 'package:mvvm_app/core/components/avatar/on_board_circle_avatar.dart';
import 'package:mvvm_app/core/components/text/auto_locale_text.dart';
import 'package:mvvm_app/core/extension/context_extension.dart';
import 'package:mvvm_app/view/_product/_constants/image_path_svg.dart';
import 'package:mvvm_app/view/auth/onboard/model/on_board_model.dart';
import 'package:mvvm_app/view/auth/onboard/viewModel/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              Spacer(flex: 1),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Spacer(
                flex: 1,
              ),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context)),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
        onPageChanged: (value) {
          viewModel.changeCurrentIndex(value);
        },
        itemCount: viewModel.onBoardItems.length,
        itemBuilder: (context, index) =>
            buildColumnBody(context, viewModel.onBoardItems[index]));
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: buildListViewOfCircles(viewModel)),
        Expanded(child: Center(child: Observer(builder: (_) {
          return Visibility(
              visible: viewModel.isLoading == true,
              child: CircularProgressIndicator());
        }))),
        floatingActionButtonSkip(context, viewModel)
      ],
    );
  }

  ListView buildListViewOfCircles(OnBoardViewModel viewModel) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.paddingLow,
            child: Observer(builder: (_) {
              return OnBoardCircleAvatar(
                  isSelected: viewModel.currentIndex == index);
            }),
          );
        });
  }

  FloatingActionButton floatingActionButtonSkip(
      BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
      backgroundColor: context.colors.onBackground,
      onPressed: () => viewModel.completeToOnBoard(),
      child: Icon(
        Icons.done,
        color: context.colors.background,
      ),
    );
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingNormalHorizontal,
          child: buildAutoLocaleTextDesc(model, context),
        )
      ],
    );
  }

  AutoLocaleText buildAutoLocaleTextDesc(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
        value: model.description,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: context.colors.secondary));
  }

  AutoLocaleText buildAutoLocaleTextTitle(
      OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: Theme.of(context).textTheme.headline4!.copyWith(
          fontWeight: FontWeight.w600, color: context.colors.secondary),
      textAlign: TextAlign.center,
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);
}

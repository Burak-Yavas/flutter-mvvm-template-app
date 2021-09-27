import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_app/core/base/view/base_widget.dart';
import 'package:mvvm_app/core/constants/image/image_constatns.dart';
import 'package:mvvm_app/core/extension/context_extension.dart';
import 'package:mvvm_app/core/init/network/vexana_manager.dart';
import 'package:mvvm_app/view/auth/splash/service/splash_service.dart';
import 'package:mvvm_app/view/auth/splash/viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) =>
          buildScaffoldBody(context, viewModel),
    );
  }

  Scaffold buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Stack(
        children: [
          buildAnimatedText(context, viewModel),
          buildAnimatedAlign(viewModel, context),
        ],
      )),
    );
  }

  Widget buildAnimatedText(BuildContext context, SplashViewModel viewModel) {
    return Center(
      child: Observer(
        builder: (_) {
          return AnimatedOpacity(
            duration: context.normalDuration * 2,
            opacity: viewModel.isFirstInit ? 0 : 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("WELCOME TO MEAL DELIVERY APP",
                    style: context.textTheme.headline4
                        ?.copyWith(color: Colors.white),
                    textAlign: TextAlign.center),
                CircularProgressIndicator.adaptive()
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildAnimatedAlign(SplashViewModel viewModel, BuildContext context) {
    return Observer(
      builder: (_) {
        return AnimatedAlign(
            alignment: viewModel.isFirstInit
                ? Alignment.center
                : Alignment.bottomCenter,
            duration: context.lowDuration * 2,
            child: Image.asset(ImageConstants.instance.splash));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/constants/image/image_constatns.dart';
import '../../../../core/extension/context_extension.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) =>
          DefaultTabController(
        length: 2,
        child: Scaffold(
          key: viewModel.scaffoldState,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                buildAnimatedContainer(context),
                buildTabBarContainer(context),
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: context.paddingNormal,
                      child: buildForm(viewModel, context),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildTabBarContainer(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: buildTabBar(context),
        ));
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
      tabs: [
        Text("Login",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: context.colors.secondary)),
        Text("SignUp",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: context.colors.secondary))
      ],
    );
  }

  Form buildForm(LoginViewModel viewModel, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: viewModel.formState,
      child: Column(
        children: [
          Spacer(
            flex: 4,
          ),
          buildTextFormFieldEmail(viewModel),
          buildTextFormFieldPassword(viewModel),
          buildForgotPasswordTextButton(context),
          Spacer(
            flex: 2,
          ),
          buildLoginTextButton(context, viewModel),
          buildDontHaveAccountTextButton(context),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: (value) => value!.isNotEmpty ? null : 'This field required',
        obscureText: viewModel.isVisibleOpen,
        decoration: InputDecoration(
            fillColor: Colors.grey,
            labelText: " Password ",
            icon: Icon(Icons.password),
            suffixIcon: IconButton(
              icon: Observer(builder: (_) {
                return Icon(viewModel.isVisibleOpen
                    ? Icons.visibility_off
                    : Icons.visibility);
              }),
              onPressed: () {
                viewModel.isVisibleStateChanged();
              },
            )),
      );
    });
  }

  TextFormField buildTextFormFieldEmail(LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      //validator: (value) => value!.isValidEmails ? null : "Invalid Email",
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          fillColor: Colors.grey, labelText: "Email", icon: Icon(Icons.email)),
    );
  }

  Widget buildLoginTextButton(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextButton(
        child: Text(
          "   Login   ",
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: context.colors.secondary),
        ),
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginService();
              },
        style: TextButton.styleFrom(
            shape: StadiumBorder(), backgroundColor: Colors.black),
      );
    });
  }

  Align buildForgotPasswordTextButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text(
          "Forgot Password?",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: context.colors.secondary),
        ),
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: StadiumBorder(),
        ),
      ),
    );
  }

  Align buildDontHaveAccountTextButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text(
          "Don't have an account? SignUp",
          textAlign: TextAlign.end,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: context.colors.secondary),
        ),
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: StadiumBorder(),
        ),
      ),
    );
  }
}

AnimatedContainer buildAnimatedContainer(BuildContext context) {
  return AnimatedContainer(
      duration: context.lowDuration,
      height:
          context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
      color: Colors.white,
      child: Center(child: Image.asset(ImageConstants.instance.login)));
}

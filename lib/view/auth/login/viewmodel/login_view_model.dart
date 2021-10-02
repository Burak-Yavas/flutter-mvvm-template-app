import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_app/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_app/core/extension/context_extension.dart';
import 'package:mvvm_app/view/auth/login/service/ILogin_service.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../model/login_model.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    loginService = LoginService(VexanaManager.instance.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  Future<void> fetchLoginSevice() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(LoginModel(
          email: emailController!.text, password: passwordController!.text));

      if (response != null) {
        if (scaffoldState.currentState != null) {
          // ignore: deprecated_member_use
          scaffoldState.currentState!
              // ignore: deprecated_member_use
              .showSnackBar(SnackBar(content: Text(response.token!)));
        }
        await localeManager.setStringValue(
            PreferencesKeys.TOKEN, response.token!);
      }
    }
    isLoadingChange();
    navigate();
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  Future<void> navigate() async {
    await Future.delayed(context.normalDuration * 2);
    navigation.navigateToPageClear(path: NavigationConstants.APPMENUVIEW);
  }
}

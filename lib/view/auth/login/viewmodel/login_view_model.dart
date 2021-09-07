import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_app/core/base/model/base_view_model.dart';
import 'package:mvvm_app/core/constants/enums/locale_keys_enum.dart';
import 'package:mvvm_app/core/init/network/vexana_manager.dart';
import 'package:mvvm_app/view/auth/login/model/login_model.dart';
import 'package:mvvm_app/view/auth/login/service/ILogin_service.dart';
import 'package:mvvm_app/view/auth/login/service/login_service.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  late ILoginService loginService;
  void setContext(BuildContext context) => this.context = context;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  void init() {
    loginService = LoginService(VexanaManager.instance.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @observable
  bool isLoading = false;

  @observable
  bool isVisibleOpen = false;

  @action
  Future<void> fetchLoginService() async {
    isLoadingChanged();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(LoginModel(
          email: emailController!.text, password: passwordController!.text));
      if (response != null) {
        if (scaffoldState.currentState != null) {
          // ignore: deprecated_member_use
          scaffoldState.currentState!
              .showSnackBar(SnackBar(content: Text(response.token!)));
        }
        await localeManager.setStringValue(
            PreferencesKeys.TOKEN, response.token!);
      }
    }
    isLoadingChanged();
  }

  @action
  isLoadingChanged() {
    isLoading = !isLoading;
  }

  @action
  void isVisibleStateChanged() {
    isVisibleOpen = !isVisibleOpen;
  }
}

import 'package:flutter/material.dart';
import 'package:tmdb_test/presenter/loginScreenPresenter/loginPresenterContract.dart';
import 'package:tmdb_test/service/parseService.dart';

class LoginScreenPresenter implements LoginScreenPresenterContract {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Future<bool> onLogin() async {
    bool result = await ParseService.login(
        "", userController.text, passwordController.text);

    if (result != true) {
      result = await onRegister();
    }

    return result;
  }

  @override
  Future<bool> onRegister() async {
    bool result = await ParseService.onRegister(
        "", userController.text, passwordController.text);

    return result;
  }
}

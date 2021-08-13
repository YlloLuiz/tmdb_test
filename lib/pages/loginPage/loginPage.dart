import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tmdb_test/generated/l10n.dart';

import 'package:tmdb_test/pages/homePage/homePage.dart';
import 'package:tmdb_test/presenter/loginScreenPresenter/loginPresenter.dart';
import 'package:tmdb_test/presenter/loginScreenPresenter/loginViewContract.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginViewContract {
  late LoginScreenPresenter _presenter;
  bool passwordObscurity = true;

  @override
  void onError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).loginErrorMensage),
      ),
    );
  }

  @override
  Future<void> onLogin() async {
    bool login = await _presenter.onLogin();

    if (login == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      onError();
    }
  }

  @override
  void initState() {
    _presenter = LoginScreenPresenter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _presenter.scaffoldKey,
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// App Logo
              Center(
                child: SvgPicture.asset("assets/appLogo/blue_short.svg"),
              ),

              /// Login FormField
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Form(
                  key: _presenter.formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: TextFormField(
                          controller: _presenter.userController,
                          validator: (value) {
                            if (value!.isEmpty == true) {
                              return "";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: S.of(context).inputLoginField),
                        ),
                      ),
                      TextFormField(
                        controller: _presenter.passwordController,
                        obscureText: passwordObscurity,
                        validator: (value) {
                          if (value!.isEmpty == true) {
                            return "";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: S.of(context).inputPasswordField,
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility,
                              color: Colors.green.shade600,
                            ),
                            onPressed: () => setState(
                                () => passwordObscurity = !passwordObscurity),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /// Login Button
              Padding(
                padding: EdgeInsets.only(top: 32.0),
                child: FloatingActionButton.extended(
                  onPressed: () async {
                    if (_presenter.formKey.currentState!.validate() == true) {
                      await onLogin();
                    } else {
                      onError();
                    }
                  },
                  label: Text(S.of(context).inputLoginButton),
                  elevation: 0,
                  highlightElevation: 0,
                  icon: Icon(Icons.login),
                  backgroundColor: Colors.green.shade400,
                  splashColor: Colors.blue.shade200,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

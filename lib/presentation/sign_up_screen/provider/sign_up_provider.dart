import 'package:flutter/material.dart';
import 'package:helthio/presentation/sign_up_screen/models/sign_up_model.dart';

/// A provider class for the SignUpScreen.
///
/// This provider manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpProvider extends ChangeNotifier {
  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  SignUpModel signUpModelObj = SignUpModel();

  bool isShowPassword = true;

  bool agreeCheckBox = false;

  @override
  void dispose() {
    super.dispose();
    nameEditTextController.dispose();
    emailEditTextController.dispose();
    passwordEditTextController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void changeCheckBox(bool value) {
    agreeCheckBox = value;
    notifyListeners();
  }
}

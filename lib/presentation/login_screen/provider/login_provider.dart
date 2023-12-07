import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helthio/data/models/loginPost/post_login_post_req.dart';
import 'package:helthio/data/models/loginPost/post_login_post_resp.dart';
import 'package:helthio/data/repository/repository.dart';
import 'package:helthio/presentation/login_screen/models/login_model.dart';

/// A provider class for the LoginScreen.
///
/// This provider manages the state of the LoginScreen, including the
/// current loginModelObj

// ignore_for_file: must_be_immutable
class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController(text: 'mituls');

  TextEditingController passwordController =
      TextEditingController(text: 'Admin@123');

  LoginModel loginModelObj = LoginModel();

  bool isShowPassword = true;

  final _repository = Repository();

  var postLoginPostResp = PostLoginPostResp();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void changePasswordVisibility() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  FutureOr<void> callLoginPost({Function? onSuccess}) async {
    var postLoginPostReq = PostLoginPostReq(
      username: emailController.text,
      password: passwordController.text,
    );
    await _repository
        .loginPost(
      requestData: postLoginPostReq.toJson(),
    )
        .then((value) async {
      postLoginPostResp = value;
      _onLoginPostSuccess(value);
      onSuccess?.call();
      notifyListeners();
    }).onError((error, stackTrace) {
      //implement error call
      _onLoginPostError();
    });
  }

  void _onLoginPostSuccess(PostLoginPostResp resp) {}
  void _onLoginPostError() {
    //implement error method body...
  }
}

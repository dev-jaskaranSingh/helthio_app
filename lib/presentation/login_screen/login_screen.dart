import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';
import 'package:helthio/core/utils/validation_functions.dart';
import 'package:helthio/domain/facebookauth/facebook_auth_helper.dart';
import 'package:helthio/domain/googleauth/google_auth_helper.dart';
import 'package:helthio/widgets/app_bar/appbar_leading_image.dart';
import 'package:helthio/widgets/app_bar/appbar_subtitle.dart';
import 'package:helthio/widgets/app_bar/custom_app_bar.dart';
import 'package:helthio/widgets/custom_elevated_button.dart';
import 'package:helthio/widgets/custom_outlined_button.dart';
import 'package:helthio/widgets/custom_text_form_field.dart';

import 'provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LoginProvider(), child: LoginScreen());
  }
}

// ignore_for_file: must_be_immutable
class LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
                    child: Column(children: [
                      _buildEmail(context),
                      SizedBox(height: 16.v),
                      _buildPassword(context),
                      SizedBox(height: 10.v),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text("msg_forgot_password".tr,
                              style: theme.textTheme.titleSmall)),
                      SizedBox(height: 32.v),
                      _buildLoginButton(context),
                      SizedBox(height: 26.v),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 48.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 1.v),
                                    child: Text("msg_don_t_have_an_account".tr,
                                        style: theme.textTheme.bodyMedium)),
                                Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text("lbl_sign_up".tr,
                                        style: CustomTextStyles.titleSmall15))
                              ])),
                      SizedBox(height: 32.v),
                      _buildOrDivider(context),
                      SizedBox(height: 29.v),
                      _buildSignInWithGoogleButton(context),
                      SizedBox(height: 16.v),
                      _buildSignInWithAppleButton(context),
                      SizedBox(height: 16.v),
                      _buildSignInWithFacebookButton(context),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgButton,
            margin: EdgeInsets.only(left: 24.h)),
        centerTitle: true,
        title: AppbarSubtitle(text: "lbl_login".tr));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<LoginProvider, TextEditingController?>(
        selector: (context, provider) => provider.emailController,
        builder: (context, emailController, child) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "msg_enter_your_email".tr,
              textInputType: TextInputType.emailAddress,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgIconEmail,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field is required";
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, child) {
      return CustomTextFormField(
          controller: provider.passwordController,
          hintText: "msg_enter_your_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgIconPassword,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 56.v),
          suffix: InkWell(
              onTap: () {
                provider.changePasswordVisibility();
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(12.h, 16.v, 24.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgIconEyeSlash,
                      height: 24.adaptSize,
                      width: 24.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: provider.isShowPassword,
          contentPadding: EdgeInsets.symmetric(vertical: 18.v));
    });
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_login".tr,
        onPressed: () {
          login(context);
        });
  }

  /// Section Widget
  Widget _buildOrDivider(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
              child: SizedBox(width: 137.h, child: Divider())),
          Text("lbl_or".tr, style: theme.textTheme.bodyLarge),
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 9.v),
              child: SizedBox(width: 137.h, child: Divider()))
        ]);
  }

  /// Section Widget
  Widget _buildSignInWithGoogleButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_sign_in_with_google".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgGoogle, height: 20.v, width: 19.h)),
        onPressed: () {
          onTapSignInWithGoogleButton(context);
        });
  }

  /// Section Widget
  Widget _buildSignInWithAppleButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_sign_in_with_apple".tr,
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgApple, height: 20.v, width: 16.h)));
  }

  /// Section Widget
  Widget _buildSignInWithFacebookButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_sign_in_with_facebook".tr,
        onPressed: () {
          onTapSignInWithFacebookButton(context);
        });
  }

  login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Provider.of<LoginProvider>(context, listen: false).callLoginPost(
        onSuccess: () {
          _onLoginPostEventSuccess(context);
        },
      );
    }
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  void _onLoginPostEventSuccess(BuildContext context) {
    NavigatorService.popAndPushNamed(
      AppRoutes.homeContainerScreen,
    );
  }

  onTapSignInWithGoogleButton(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  onTapSignInWithFacebookButton(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}

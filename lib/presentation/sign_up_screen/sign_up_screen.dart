import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';
import 'package:helthio/core/utils/validation_functions.dart';
import 'package:helthio/widgets/app_bar/appbar_leading_image.dart';
import 'package:helthio/widgets/app_bar/appbar_subtitle.dart';
import 'package:helthio/widgets/app_bar/custom_app_bar.dart';
import 'package:helthio/widgets/custom_checkbox_button.dart';
import 'package:helthio/widgets/custom_elevated_button.dart';
import 'package:helthio/widgets/custom_text_form_field.dart';

import 'provider/sign_up_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key})
      : super(
          key: key,
        );

  @override
  SignUpScreenState createState() => SignUpScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      child: SignUpScreen(),
    );
  }
}

class SignUpScreenState extends State<SignUpScreen> {
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
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 40.v,
            ),
            child: Column(
              children: [
                _buildNameEditText(context),
                SizedBox(height: 16.v),
                _buildEmailEditText(context),
                SizedBox(height: 16.v),
                _buildPasswordEditText(context),
                SizedBox(height: 16.v),
                _buildAgreeCheckBox(context),
                SizedBox(height: 28.v),
                _buildSignUpButton(context),
                SizedBox(height: 28.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "msg_already_have_an".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text(
                          "lbl_log_in2".tr,
                          style: CustomTextStyles.titleSmall15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 64.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgButton,
        margin: EdgeInsets.only(left: 24.h),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "lbl_sign_up".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildNameEditText(BuildContext context) {
    return Selector<SignUpProvider, TextEditingController?>(
      selector: (
        context,
        provider,
      ) =>
          provider.nameEditTextController,
      builder: (context, nameEditTextController, child) {
        return CustomTextFormField(
          controller: nameEditTextController,
          hintText: "lbl_enter_your_name".tr,
          prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgIconUseroutline,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 56.v,
          ),
          validator: (value) {
            if (!isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildEmailEditText(BuildContext context) {
    return Selector<SignUpProvider, TextEditingController?>(
      selector: (
        context,
        provider,
      ) =>
          provider.emailEditTextController,
      builder: (context, emailEditTextController, child) {
        return CustomTextFormField(
          controller: emailEditTextController,
          hintText: "msg_enter_your_email".tr,
          textInputType: TextInputType.emailAddress,
          prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgIconEmail,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 56.v,
          ),
          validator: (value) {
            if (value == null || (!isValidEmail(value, isRequired: true))) {
              return "err_msg_please_enter_valid_email".tr;
            }
            return null;
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return Consumer<SignUpProvider>(
      builder: (context, provider, child) {
        return CustomTextFormField(
          controller: provider.passwordEditTextController,
          hintText: "msg_enter_your_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgIconPassword,
              height: 24.adaptSize,
              width: 24.adaptSize,
            ),
          ),
          prefixConstraints: BoxConstraints(
            maxHeight: 56.v,
          ),
          suffix: InkWell(
            onTap: () {
              provider.changePasswordVisibility();
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(30.h, 16.v, 24.h, 16.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgIconEyeSlash,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 56.v,
          ),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: provider.isShowPassword,
          contentPadding: EdgeInsets.symmetric(vertical: 18.v),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildAgreeCheckBox(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(right: 28.h),
        child: Selector<SignUpProvider, bool?>(
          selector: (
            context,
            provider,
          ) =>
              provider.agreeCheckBox,
          builder: (context, agreeCheckBox, child) {
            return CustomCheckboxButton(
              alignment: Alignment.centerLeft,
              text: "msg_i_agree_to_the_medidoc".tr,
              isExpandedText: true,
              value: agreeCheckBox,
              onChange: (value) {
                context.read<SignUpProvider>().changeCheckBox(value);
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
      text: "lbl_sign_up".tr,
    );
  }
}

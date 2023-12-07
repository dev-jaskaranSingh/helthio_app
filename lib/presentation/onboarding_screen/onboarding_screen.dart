import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';
import 'package:helthio/widgets/custom_elevated_button.dart';
import 'package:helthio/widgets/custom_outlined_button.dart';

import 'provider/onboarding_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingProvider(),
      child: OnboardingScreen(),
    );
  }
}

class OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 23.h,
            vertical: 60.v,
          ),
          child: Column(
            children: [
              Spacer(
                flex: 40,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 66.v,
                width: 59.h,
              ),
              SizedBox(height: 5.v),
              Text(
                "lbl_helthio".tr,
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(height: 40.v),
              Text(
                "msg_let_s_get_started".tr,
                style: CustomTextStyles.titleLargeOnPrimary,
              ),
              SizedBox(height: 9.v),
              Container(
                width: 260.h,
                margin: EdgeInsets.only(
                  left: 34.h,
                  right: 33.h,
                ),
                child: Text(
                  "msg_login_to_enjoy_the".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleMediumGray600.copyWith(
                    height: 1.50,
                  ),
                ),
              ),
              Spacer(
                flex: 59,
              ),
              CustomElevatedButton(
                text: "lbl_login".tr,
              ),
              SizedBox(height: 16.v),
              CustomOutlinedButton(
                text: "lbl_sign_up".tr,
                buttonStyle: CustomButtonStyles.outlinePrimary,
                buttonTextStyle: CustomTextStyles.titleMediumPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

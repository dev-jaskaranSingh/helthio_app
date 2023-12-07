import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';
import 'package:helthio/widgets/custom_elevated_button.dart';

import '../models/slider_item_model.dart';

// ignore: must_be_immutable
class SliderItemWidget extends StatelessWidget {
  SliderItemWidget(
    this.sliderItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SliderItemModel sliderItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.only(right: 70.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Container(
          height: 135.v,
          width: 281.h,
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          decoration: AppDecoration.linear.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 130.v,
                  width: 103.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 113.v,
                            width: 103.h,
                            margin: EdgeInsets.only(bottom: 1.v),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                56.h,
                              ),
                              border: Border.all(
                                color: appTheme.whiteA700.withOpacity(0.53),
                                width: 18.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.img7xm6,
                        height: 130.v,
                        width: 83.h,
                        radius: BorderRadius.circular(
                          10.h,
                        ),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 9.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 164.h,
                        child: Text(
                          sliderItemModelObj.earlyProtection!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              CustomTextStyles.titleMediumWhiteA700_1.copyWith(
                            height: 1.39,
                          ),
                        ),
                      ),
                      SizedBox(height: 13.v),
                      CustomElevatedButton(
                        height: 30.v,
                        width: 89.h,
                        text: "lbl_learn_more".tr,
                        buttonStyle: CustomButtonStyles.fillWhiteA,
                        buttonTextStyle: CustomTextStyles.labelLargePrimary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

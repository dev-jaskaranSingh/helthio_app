import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';

import '../models/top_doctor_item_model.dart';

// ignore: must_be_immutable
class TopDoctorItemWidget extends StatelessWidget {
  TopDoctorItemWidget(
    this.topDoctorItemModelObj, {
    Key? key,
    this.navigateToDoctorDetail,
  }) : super(
          key: key,
        );

  TopDoctorItemModel topDoctorItemModelObj;

  VoidCallback? navigateToDoctorDetail;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDoctorDetail!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.v),
        decoration: AppDecoration.outlineGray200.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgRectangle959,
              height: 111.adaptSize,
              width: 111.adaptSize,
              radius: BorderRadius.circular(
                8.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topDoctorItemModelObj.name!,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 10.v),
                  Text(
                    topDoctorItemModelObj.speciality!,
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(height: 9.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgIconlyBoldStar,
                        height: 16.adaptSize,
                        width: 16.adaptSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.h),
                        child: Text(
                          topDoctorItemModelObj.rating!,
                          style: CustomTextStyles.labelLargeAmber500_1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 9.v),
                  Row(
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgIconlyBoldLocation,
                        height: 13.adaptSize,
                        width: 13.adaptSize,
                        margin: EdgeInsets.only(bottom: 1.v),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3.h),
                        child: Text(
                          topDoctorItemModelObj.distance!,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

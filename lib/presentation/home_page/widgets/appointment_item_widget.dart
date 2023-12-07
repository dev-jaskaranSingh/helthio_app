import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';

import '../models/appointment_item_model.dart';

// ignore: must_be_immutable
class AppointmentItemWidget extends StatelessWidget {
  AppointmentItemWidget(
    this.appointmentItemModel, {
    Key? key,
  }) : super(
          key: key,
        );

  AppointmentItemModel appointmentItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse88,
            height: 30.adaptSize,
            width: 30.adaptSize,
            radius: BorderRadius.circular(
              15.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              bottom: 3.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointmentItemModel.name!,
                  style: CustomTextStyles.labelLargeSecondaryContainer,
                ),
                SizedBox(height: 1.v),
                Text(
                  appointmentItemModel.speciality!,
                  style: CustomTextStyles.labelMediumGray500,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 5.v,
              bottom: 2.v,
            ),
            child: Column(
              children: [
                Text(
                  appointmentItemModel.date!,
                  style: theme.textTheme.labelMedium,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    appointmentItemModel.time!,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

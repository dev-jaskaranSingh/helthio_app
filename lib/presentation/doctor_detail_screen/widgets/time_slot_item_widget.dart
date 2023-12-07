import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';

import '../models/time_slot_item_model.dart';

// ignore: must_be_immutable
class TimeSlotItemWidget extends StatelessWidget {
  TimeSlotItemWidget(
    this.timeSlotItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  TimeSlotItemModel timeSlotItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 25.h,
        vertical: 11.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        timeSlotItemModelObj.time!,
        style: TextStyle(
          color: (timeSlotItemModelObj.isSelected ?? false)
              ? appTheme.gray400
              : theme.colorScheme.primaryContainer,
          fontSize: 12.fSize,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (timeSlotItemModelObj.isSelected ?? false),
      backgroundColor: appTheme.whiteA700,
      selectedColor: appTheme.whiteA700,
      shape: (timeSlotItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.gray100,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(
                15.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.blueGray100,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(
                15.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}

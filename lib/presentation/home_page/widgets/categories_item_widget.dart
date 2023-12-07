import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';

import '../models/categories_item_model.dart';

// ignore: must_be_immutable
class CategoriesItemWidget extends StatelessWidget {
  CategoriesItemWidget(
    this.categoriesItemModelObj, {
    Key? key,
    this.navigateToTopDoctor,
  }) : super(
          key: key,
        );

  CategoriesItemModel categoriesItemModelObj;

  VoidCallback? navigateToTopDoctor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          navigateToTopDoctor!.call();
        },
        child: Column(
          children: [
            Container(
              height: 54.v,
              width: 64.h,
              padding: EdgeInsets.symmetric(
                horizontal: 17.h,
                vertical: 8.v,
              ),
              decoration: AppDecoration.fillBlue.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: CustomImageView(
                imagePath: categoriesItemModelObj.orthopaedics,
                height: 40.v,
                width: 30.h,
              ),
            ),
            SizedBox(height: 10.v),
            Text(
              categoriesItemModelObj.orthopaedics1!,
              style: CustomTextStyles.labelLargeGray800,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

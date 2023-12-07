import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';
import 'package:helthio/widgets/app_bar/appbar_leading_image.dart';
import 'package:helthio/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:helthio/widgets/app_bar/appbar_trailing_image.dart';
import 'package:helthio/widgets/app_bar/custom_app_bar.dart';

import '../top_doctor_screen/widgets/top_doctor_item_widget.dart';
import 'models/top_doctor_item_model.dart';
import 'provider/top_doctor_provider.dart';

class TopDoctorScreen extends StatefulWidget {
  const TopDoctorScreen({Key? key}) : super(key: key);

  @override
  TopDoctorScreenState createState() => TopDoctorScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TopDoctorProvider(), child: TopDoctorScreen());
  }
}

class TopDoctorScreenState extends State<TopDoctorScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TopDoctorProvider>(context, listen: false)
          .callGetDoctorList();
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 24.h, top: 24.v, right: 24.h),
                child: Consumer<TopDoctorProvider>(
                    builder: (context, provider, child) {
                  return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16.v);
                      },
                      itemCount:
                          provider.topDoctorModelObj.topDoctorItemList.length,
                      itemBuilder: (context, index) {
                        TopDoctorItemModel model =
                            provider.topDoctorModelObj.topDoctorItemList[index];
                        return TopDoctorItemWidget(model,
                            navigateToDoctorDetail: () {
                          NavigatorService.pushNamed(
                              AppRoutes.doctorDetailScreen,
                              arguments: {
                                NavigationArgs.id:
                                    Provider.of<TopDoctorProvider>(context,
                                            listen: false)
                                        .postGetDoctorListResp
                                        .data
                                        ?.data?[index]
                                        .id
                              });
                        });
                      });
                }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgButton,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_top_doctor".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent1,
              margin: EdgeInsets.fromLTRB(24.h, 13.v, 24.h, 11.v))
        ]);
  }
}

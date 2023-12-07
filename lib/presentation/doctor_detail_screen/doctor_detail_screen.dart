import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';
import 'package:helthio/widgets/app_bar/appbar_leading_image.dart';
import 'package:helthio/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:helthio/widgets/app_bar/appbar_trailing_image.dart';
import 'package:helthio/widgets/app_bar/custom_app_bar.dart';
import 'package:helthio/widgets/custom_elevated_button.dart';
import 'package:helthio/widgets/custom_icon_button.dart';
import 'package:readmore/readmore.dart';

import '../doctor_detail_screen/widgets/time_slot_item_widget.dart';
import 'models/time_slot_item_model.dart';
import 'provider/doctor_detail_provider.dart';

class DoctorDetailScreen extends StatefulWidget {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  DoctorDetailScreenState createState() => DoctorDetailScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DoctorDetailProvider(),
        child: DoctorDetailScreen());
  }
}

class DoctorDetailScreenState extends State<DoctorDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map<String, dynamic> arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

      String doctorId = arguments[NavigationArgs.id];
      Provider.of<DoctorDetailProvider>(context, listen: false)
          .setDoctorId(doctorId);
      Provider.of<DoctorDetailProvider>(context, listen: false)
          .callDoctorsGet();
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 32.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(right: 3.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle959,
                                height: 115.adaptSize,
                                width: 115.adaptSize,
                                radius: BorderRadius.circular(8.h)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 15.h, top: 7.v, bottom: 7.v),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Selector<DoctorDetailProvider, String?>(
                                          selector: (context, provider) =>
                                              provider
                                                  .doctorDetailModelObj!.name,
                                          builder: (context, drMarcusHorizon,
                                              child) {
                                            return Text(drMarcusHorizon ?? "",
                                                style: theme
                                                    .textTheme.titleMedium);
                                          }),
                                      SizedBox(height: 9.v),
                                      Selector<DoctorDetailProvider, String?>(
                                          selector: (context, provider) =>
                                              provider.doctorDetailModelObj!
                                                  .speciality,
                                          builder:
                                              (context, chardiologist, child) {
                                            return Text(chardiologist ?? "",
                                                style: CustomTextStyles
                                                    .titleSmallGray500);
                                          }),
                                      SizedBox(height: 7.v),
                                      Row(children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgIconlyBoldStar,
                                            height: 18.adaptSize,
                                            width: 18.adaptSize,
                                            margin:
                                                EdgeInsets.only(bottom: 1.v)),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 4.h, top: 3.v),
                                            child: Selector<
                                                    DoctorDetailProvider,
                                                    String?>(
                                                selector: (context, provider) =>
                                                    provider
                                                        .doctorDetailModelObj!
                                                        .rating,
                                                builder: (context, fortySeven,
                                                    child) {
                                                  return Text(fortySeven ?? "",
                                                      style: CustomTextStyles
                                                          .labelLargeAmber500);
                                                }))
                                      ]),
                                      SizedBox(height: 7.v),
                                      Row(children: [
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgIconlyBoldLocation,
                                            height: 16.adaptSize,
                                            width: 16.adaptSize,
                                            margin:
                                                EdgeInsets.only(bottom: 1.v)),
                                        Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Selector<
                                                    DoctorDetailProvider,
                                                    String?>(
                                                selector: (context, provider) =>
                                                    provider
                                                        .doctorDetailModelObj!
                                                        .distance,
                                                builder:
                                                    (context, distance, child) {
                                                  return Text(distance ?? "",
                                                      style: CustomTextStyles
                                                          .titleSmallGray500);
                                                }))
                                      ])
                                    ]))
                          ])),
                      SizedBox(height: 17.v),
                      Text("lbl_about".tr,
                          style: CustomTextStyles.titleMedium16),
                      SizedBox(height: 12.v),
                      SizedBox(
                          width: 305.h,
                          child: ReadMoreText("msg_lorem_ipsum_dolor".tr,
                              trimLines: 3,
                              colorClickableText: theme.colorScheme.primary,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "lbl_read_more".tr,
                              moreStyle: CustomTextStyles
                                  .bodySmallInterGray60001
                                  .copyWith(height: 1.67),
                              lessStyle: CustomTextStyles
                                  .bodySmallInterGray60001
                                  .copyWith(height: 1.67))),
                      SizedBox(height: 29.v),
                      _buildCalendar(context),
                      SizedBox(height: 32.v),
                      Divider(color: appTheme.blueGray50),
                      SizedBox(height: 32.v),
                      _buildTimeSlot(context),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildBookAppointment(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgButton,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () => Navigator.pop(context)),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "lbl_doctor_detail".tr),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgComponent1,
              margin: EdgeInsets.fromLTRB(24.h, 13.v, 24.h, 11.v))
        ]);
  }

  /// Section Widget
  Widget _buildCalendar(BuildContext context) {
    return Row(children: [
      _buildThirtyOne(context, dayName: "lbl_mon".tr, dayNumber: "lbl_21".tr),
      Padding(
          padding: EdgeInsets.only(left: 12.h),
          child: _buildThirtyOne(context,
              dayName: "lbl_tue".tr, dayNumber: "lbl_22".tr)),
      Padding(
          padding: EdgeInsets.only(left: 11.h),
          child: _buildThirtyOne(context,
              dayName: "lbl_wed".tr, dayNumber: "lbl_23".tr)),
      Padding(
          padding: EdgeInsets.only(left: 11.h),
          child: _buildThirtyOne(context,
              dayName: "lbl_thu".tr, dayNumber: "lbl_24".tr)),
      Padding(
          padding: EdgeInsets.only(left: 11.h),
          child: _buildThirtyOne(context,
              dayName: "lbl_fri".tr, dayNumber: "lbl_25".tr)),
      Padding(
          padding: EdgeInsets.only(left: 6.h),
          child: _buildThirtyOne(context,
              dayName: "lbl_sat".tr, dayNumber: "lbl_26".tr))
    ]);
  }

  /// Section Widget
  Widget _buildTimeSlot(BuildContext context) {
    return Consumer<DoctorDetailProvider>(builder: (context, provider, child) {
      return Wrap(
          runSpacing: 9.v,
          spacing: 9.h,
          children: List<Widget>.generate(
              provider.doctorDetailModelObj.doctorItemList.length, (index) {
            TimeSlotItemModel model =
                provider.doctorDetailModelObj.doctorItemList[index];
            return TimeSlotItemWidget(model, onSelectedChipView: (value) {
              provider.onSelectedChipView(index, value);
            });
          }));
    });
  }

  /// Section Widget
  Widget _buildBookAppointment(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 28.v),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomIconButton(
              height: 50.adaptSize,
              width: 50.adaptSize,
              padding: EdgeInsets.all(13.h),
              child: CustomImageView(imagePath: ImageConstant.imgButtonChat)),
          Expanded(
              child: CustomElevatedButton(
                  height: 50.v,
                  text: "lbl_book_apointment".tr,
                  margin: EdgeInsets.only(left: 11.h),
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700))
        ]));
  }

  /// Common widget
  Widget _buildThirtyOne(
    BuildContext context, {
    required String dayName,
    required String dayNumber,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
        decoration: AppDecoration.outlineBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder15),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 2.h),
                  child: Text(dayName,
                      style: theme.textTheme.bodySmall!
                          .copyWith(color: appTheme.blueGray300))),
              SizedBox(height: 2.v),
              Text(dayNumber,
                  style: theme.textTheme.titleMedium!
                      .copyWith(color: theme.colorScheme.primaryContainer))
            ]));
  }
}

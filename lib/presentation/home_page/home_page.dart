import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:helthio/core/app_export.dart';
import 'package:helthio/widgets/app_bar/appbar_title.dart';
import 'package:helthio/widgets/app_bar/appbar_trailing_image.dart';
import 'package:helthio/widgets/app_bar/custom_app_bar.dart';
import 'package:helthio/widgets/custom_search_view.dart';

import '../home_page/widgets/appointment_item_widget.dart';
import '../home_page/widgets/categories_item_widget.dart';
import '../home_page/widgets/slider_item_widget.dart';
import 'models/appointment_item_model.dart';
import 'models/categories_item_model.dart';
import 'models/slider_item_model.dart';
import 'provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeProvider(), child: HomePage());
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).callGetDashboardList();
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              child: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    SizedBox(height: 17.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: Selector<HomeProvider, TextEditingController?>(
                            selector: (context, provider) =>
                                provider.searchController,
                            builder: (context, searchController, child) {
                              return CustomSearchView(
                                  controller: searchController,
                                  hintText: "msg_search_doctor_drugs".tr);
                            })),
                    SizedBox(height: 14.v),
                    _buildSlider(context),
                    SizedBox(height: 33.v),
                    _buildCategories(context),
                    SizedBox(height: 30.v),
                    _buildUpcomingAppointmentTitle(context),
                    SizedBox(height: 10.v),
                    _buildUpcomingAppointmentList(context)
                  ])),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 90.v,
        title: AppbarTitle(
            text: "msg_find_your_desire".tr,
            margin: EdgeInsets.only(left: 24.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgIconlyLightNotification,
              margin: EdgeInsets.fromLTRB(24.h, 5.v, 24.h, 34.v))
        ]);
  }

  /// Section Widget
  Widget _buildSlider(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 24.h),
        child: Consumer<HomeProvider>(builder: (context, provider, child) {
          return CarouselSlider.builder(
              options: CarouselOptions(
                  height: 135.v,
                  initialPage: 0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    provider.sliderIndex = index;
                  }),
              itemCount: provider.homeModelObj.sliderItemList.length,
              itemBuilder: (context, index, realIndex) {
                SliderItemModel model =
                    provider.homeModelObj.sliderItemList[index];
                return SliderItemWidget(model);
              });
        }));
  }

  /// Section Widget
  Widget _buildCategories(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 21.h),
            child: Consumer<HomeProvider>(builder: (context, provider, child) {
              return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 82.v,
                      crossAxisCount: 3,
                      mainAxisSpacing: 11.h,
                      crossAxisSpacing: 11.h),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: provider.homeModelObj.categoriesItemList.length,
                  itemBuilder: (context, index) {
                    CategoriesItemModel model =
                        provider.homeModelObj.categoriesItemList[index];
                    return CategoriesItemWidget(model, navigateToTopDoctor: () {
                      navigateToTopDoctor(context);
                    });
                  });
            })));
  }

  /// Section Widget
  Widget _buildUpcomingAppointmentTitle(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("msg_upcoming_apportionment".tr,
              style: CustomTextStyles.titleMedium16),
          Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text("lbl_see_all".tr, style: theme.textTheme.titleSmall))
        ]));
  }

  /// Section Widget
  Widget _buildUpcomingAppointmentList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Consumer<HomeProvider>(builder: (context, provider, child) {
          return ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 8.v);
              },
              itemCount: provider.homeModelObj.appointmentItemList.length,
              itemBuilder: (context, index) {
                AppointmentItemModel model =
                    provider.homeModelObj.appointmentItemList[index];
                return AppointmentItemWidget(model);
              });
        }));
  }

  /// Navigates to the topDoctorScreen when the action is triggered.
  navigateToTopDoctor(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.topDoctorScreen);
  }
}

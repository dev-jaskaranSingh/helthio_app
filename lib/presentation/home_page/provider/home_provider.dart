import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helthio/data/models/getDashboardList/get_get_dashboard_list_resp.dart';
import 'package:helthio/data/repository/repository.dart';
import 'package:helthio/presentation/home_page/models/home_model.dart';
import 'package:intl/intl.dart';

import '../models/appointment_item_model.dart';
import '../models/categories_item_model.dart';

/// A provider class for the HomePage.
///
/// This provider manages the state of the HomePage, including the
/// current homeModelObj

// ignore_for_file: must_be_immutable
class HomeProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  HomeModel homeModelObj = HomeModel();

  int sliderIndex = 0;

  final _repository = Repository();

  var getGetDashboardListResp = GetGetDashboardListResp();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  FutureOr<void> callGetDashboardList() async {
    await _repository.getDashboardList().then((value) async {
      getGetDashboardListResp = value;
      _onGetDashboardListSuccess(value);
    }).onError((error, stackTrace) {
      //implement error call
      _onGetDashboardListError();
    });
  }

  void _onGetDashboardListSuccess(GetGetDashboardListResp resp) {
    var gridhomeItemModelList = <CategoriesItemModel>[];
    for (var element in getGetDashboardListResp.data?.categories ?? []) {
      var gridhomeItemModel = CategoriesItemModel();
      gridhomeItemModel.orthopaedics1 = element.name ?? '';
      gridhomeItemModel.orthopaedics = element.image ?? '';
      gridhomeItemModelList.add(gridhomeItemModel);
    }
    homeModelObj.categoriesItemList = gridhomeItemModelList;
    var listhomeItemModelList = <AppointmentItemModel>[];
    for (var element in getGetDashboardListResp.data?.appointments ?? []) {
      var listhomeItemModel = AppointmentItemModel();
      listhomeItemModel.name = element.name ?? '';
      listhomeItemModel.speciality = element.department ?? '';
      final inputDate = DateTime.parse(element?.date ?? '');

      // Format the DateTime object into 'dd MM yyyy' format.
      final formattedDate = DateFormat('dd MMMM yyyy').format(inputDate);
      listhomeItemModel.date = formattedDate;
      listhomeItemModelList.add(listhomeItemModel);
    }
    homeModelObj.appointmentItemList = listhomeItemModelList;
  }

  void _onGetDashboardListError() {
    //implement error method body...
  }
}

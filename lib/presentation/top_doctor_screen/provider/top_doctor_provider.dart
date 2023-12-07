import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helthio/data/models/getDoctorList/post_get_doctor_list_req.dart';
import 'package:helthio/data/models/getDoctorList/post_get_doctor_list_resp.dart';
import 'package:helthio/data/repository/repository.dart';
import 'package:helthio/presentation/top_doctor_screen/models/top_doctor_model.dart';

import '../models/top_doctor_item_model.dart';

/// A provider class for the TopDoctorScreen.
///
/// This provider manages the state of the TopDoctorScreen, including the
/// current topDoctorModelObj

// ignore_for_file: must_be_immutable
class TopDoctorProvider extends ChangeNotifier {
  TopDoctorModel topDoctorModelObj = TopDoctorModel();

  final _repository = Repository();

  var postGetDoctorListResp = PostGetDoctorListResp();

  @override
  void dispose() {
    super.dispose();
  }

  FutureOr<void> callGetDoctorList() async {
    var postGetDoctorListReq = PostGetDoctorListReq();
    await _repository
        .getDoctorList(
      requestData: postGetDoctorListReq.toJson(),
    )
        .then((value) async {
      postGetDoctorListResp = value;
      print(postGetDoctorListResp);
      _onGetDoctorListSuccess(value);
    }).onError((error, stackTrace) {
      //implement error call
      _onGetDoctorListError();
    });
  }

  void _onGetDoctorListSuccess(PostGetDoctorListResp resp) {
    var topDoctorItemModelList = <TopDoctorItemModel>[];
    for (DataItem element in postGetDoctorListResp.data?.data ?? []) {
      var topDoctorItemModel = TopDoctorItemModel();
      topDoctorItemModel.name = element.name ?? '';
      topDoctorItemModel.speciality = element.speciality ?? '';
      topDoctorItemModel.distance = element.distance ?? '';
      topDoctorItemModel.rating = (element.rating ?? 0).toString();
      topDoctorItemModelList.add(topDoctorItemModel);
    }
    topDoctorModelObj.topDoctorItemList.clear();
    topDoctorModelObj.topDoctorItemList = topDoctorItemModelList;
    notifyListeners();
  }

  void _onGetDoctorListError() {
    //implement error method body...
  }
}

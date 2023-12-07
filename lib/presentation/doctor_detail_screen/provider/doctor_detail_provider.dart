import 'dart:async';

import 'package:flutter/material.dart';
import 'package:helthio/data/models/doctorsGet/get_doctors_get_resp.dart';
import 'package:helthio/data/repository/repository.dart';
import 'package:helthio/presentation/doctor_detail_screen/models/doctor_detail_model.dart';

/// A provider class for the DoctorDetailScreen.
///
/// This provider manages the state of the DoctorDetailScreen, including the
/// current doctorDetailModelObj

// ignore_for_file: must_be_immutable
class DoctorDetailProvider extends ChangeNotifier {
  DoctorDetailModel doctorDetailModelObj = DoctorDetailModel();

  final _repository = Repository();

  var getDoctorsGetResp = GetDoctorsGetResp();

  String _doctorId =
      ""; // Default value, you can set it to whatever is appropriate

  void setDoctorId(String id) {
    _doctorId = id;
    notifyListeners();
  }

  String get doctorId => _doctorId;

  @override
  void dispose() {
    super.dispose();
  }

  void onSelectedChipView(
    int index,
    bool value,
  ) {
    doctorDetailModelObj.doctorItemList.forEach((element) {
      element.isSelected = false;
    });
    doctorDetailModelObj.doctorItemList[index].isSelected = value;
    notifyListeners();
  }

  FutureOr<void> callDoctorsGet() async {
    print(doctorId);
    await _repository
        .doctorsGet(
      doctorId,
    )
        .then((value) async {
      getDoctorsGetResp = value;
      _onDoctorsGetSuccess(value);
    }).onError((error, stackTrace) {
      //implement error call
      _onDoctorsGetError();
    });
  }

  void _onDoctorsGetSuccess(GetDoctorsGetResp resp) {
    doctorDetailModelObj.name = getDoctorsGetResp.data!.name!.toString();
    doctorDetailModelObj.speciality =
        getDoctorsGetResp.data!.speciality!.toString();
    doctorDetailModelObj.distance =
        getDoctorsGetResp.data!.distance!.toString();
    doctorDetailModelObj.rating = getDoctorsGetResp.data!.rating!.toString();
    notifyListeners();
  }

  void _onDoctorsGetError() {
    //implement error method body...
  }
}

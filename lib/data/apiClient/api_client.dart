import 'package:dio/dio.dart';
import 'package:helthio/core/app_export.dart';
import 'package:helthio/core/utils/progress_dialog_utils.dart';
import 'package:helthio/data/models/doctorsGet/get_doctors_get_resp.dart';
import 'package:helthio/data/models/getDashboardList/get_get_dashboard_list_resp.dart';
import 'package:helthio/data/models/getDoctorList/post_get_doctor_list_resp.dart';
import 'package:helthio/data/models/loginPost/post_login_post_resp.dart';

import 'network_interceptor.dart';

class ApiClient {
  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  var url = "https://demoapiwisegpt.dhiwise.co";

  static final ApiClient _apiClient = ApiClient._internal();

  final _dio =
      Dio(BaseOptions(connectTimeout: const Duration(seconds: 60), headers: {
    "Authorization": "Bearer ${PrefUtils().getToken()}",
    "accept": "application/json",
    "Content-Type": "application/json"
  }))
        ..interceptors.add(NetworkInterceptor());

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    }
    return false;
  }

  /// Performs API call for https://demoapiwisegpt.dhiwise.co/device/api/v1/doctors/64e6f05e2c6d8293ee4bb5c6
  ///
  /// Sends a GET request to the server's 'https://demoapiwisegpt.dhiwise.co/device/api/v1/doctors/64e6f05e2c6d8293ee4bb5c6' endpoint
  /// with the provided headers and request data
  /// Returns a [GetDoctorsGetResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<GetDoctorsGetResp> doctorsGet(String id,
      {Map<String, String> headers = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/device/api/v1/doctors/$id',
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetDoctorsGetResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? GetDoctorsGetResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://demoapiwisegpt.dhiwise.co/device/api/v1/dashboard/list
  ///
  /// Sends a GET request to the server's 'https://demoapiwisegpt.dhiwise.co/device/api/v1/dashboard/list' endpoint
  /// with the provided headers and request data
  /// Returns a [GetGetDashboardListResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<GetGetDashboardListResp> getDashboardList(
      {Map<String, String> headers = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await _dio.get(
        '$url/device/api/v1/dashboard/list',
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return GetGetDashboardListResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? GetGetDashboardListResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://demoapiwisegpt.dhiwise.co/device/api/v1/doctors/list
  ///
  /// Sends a POST request to the server's 'https://demoapiwisegpt.dhiwise.co/device/api/v1/doctors/list' endpoint
  /// with the provided headers and request data
  /// Returns a [PostGetDoctorListResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostGetDoctorListResp> getDoctorList({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/device/api/v1/doctors/list',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostGetDoctorListResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostGetDoctorListResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://demoapiwisegpt.dhiwise.co/device/auth/login
  ///
  /// Sends a POST request to the server's 'https://demoapiwisegpt.dhiwise.co/device/auth/login' endpoint
  /// with the provided headers and request data
  /// Returns a [PostLoginPostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostLoginPostResp> loginPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/device/auth/login',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        PrefUtils().setToken(response.data['data']['token']);
        return PostLoginPostResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? PostLoginPostResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}

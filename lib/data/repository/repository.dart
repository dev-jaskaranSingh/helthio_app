import 'package:helthio/data/models/doctorsGet/get_doctors_get_resp.dart';
import 'package:helthio/data/models/getDashboardList/get_get_dashboard_list_resp.dart';
import 'package:helthio/data/models/getDoctorList/post_get_doctor_list_resp.dart';
import 'package:helthio/data/models/loginPost/post_login_post_resp.dart';

import '../../core/utils/pref_utils.dart';
import '../apiClient/api_client.dart';

/// Repository class for managing API requests.
///
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();
  var headers = {
    "Authorization": "Bearer ${PrefUtils().getToken()}",
  };

  Future<GetDoctorsGetResp> doctorsGet(String id) async {
    return await _apiClient.doctorsGet(
      id,
      headers: headers,
    );
  }

  Future<GetGetDashboardListResp> getDashboardList() async {
    return await _apiClient.getDashboardList(
      headers: headers,
    );
  }

  Future<PostGetDoctorListResp> getDoctorList({
    Map requestData = const {},
  }) async {
    return await _apiClient.getDoctorList(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<PostLoginPostResp> loginPost({
    Map requestData = const {},
  }) async {
    return await _apiClient.loginPost(
      headers: headers,
      requestData: requestData,
    );
  }
}

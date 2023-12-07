class PostLoginPostResp {
  String? status;
  String? message;
  Data? data;

  PostLoginPostResp({this.status, this.message, this.data});

  PostLoginPostResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  String? email;
  String? name;
  int? userType;
  bool? agreeTerms;
  String? mobileNo;
  int? loginRetryLimit;
  String? createdAt;
  String? updatedAt;
  bool? isDeleted;
  bool? isActive;
  String? id;
  String? token;

  Data(
      {this.username,
      this.email,
      this.name,
      this.userType,
      this.agreeTerms,
      this.mobileNo,
      this.loginRetryLimit,
      this.createdAt,
      this.updatedAt,
      this.isDeleted,
      this.isActive,
      this.id,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    name = json['name'];
    userType = json['userType'];
    agreeTerms = json['agreeTerms'];
    mobileNo = json['mobileNo'];
    loginRetryLimit = json['loginRetryLimit'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isDeleted = json['isDeleted'];
    isActive = json['isActive'];
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (username != null) {
      data['username'] = username;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (userType != null) {
      data['userType'] = userType;
    }
    if (agreeTerms != null) {
      data['agreeTerms'] = agreeTerms;
    }
    if (mobileNo != null) {
      data['mobileNo'] = mobileNo;
    }
    if (loginRetryLimit != null) {
      data['loginRetryLimit'] = loginRetryLimit;
    }
    if (createdAt != null) {
      data['createdAt'] = createdAt;
    }
    if (updatedAt != null) {
      data['updatedAt'] = updatedAt;
    }
    if (isDeleted != null) {
      data['isDeleted'] = isDeleted;
    }
    if (isActive != null) {
      data['isActive'] = isActive;
    }
    if (id != null) {
      data['id'] = id;
    }
    if (token != null) {
      data['token'] = token;
    }
    return data;
  }
}

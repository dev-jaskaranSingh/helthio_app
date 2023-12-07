class GetDoctorsGetResp {
  String? status;
  String? message;
  Data? data;

  GetDoctorsGetResp({this.status, this.message, this.data});

  GetDoctorsGetResp.fromJson(Map<String, dynamic> json) {
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
  Location? location;
  String? name;
  String? speciality;
  bool? available;
  String? distance;
  String? addedBy;
  int? rating;
  String? createdAt;
  String? updatedAt;
  bool? isDeleted;
  bool? isActive;
  String? id;

  Data(
      {this.location,
      this.name,
      this.speciality,
      this.available,
      this.distance,
      this.addedBy,
      this.rating,
      this.createdAt,
      this.updatedAt,
      this.isDeleted,
      this.isActive,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    name = json['name'];
    speciality = json['speciality'];
    available = json['available'];
    distance = json['distance'];
    addedBy = json['addedBy'];
    rating = json['rating'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isDeleted = json['isDeleted'];
    isActive = json['isActive'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location?.toJson();
    }
    if (name != null) {
      data['name'] = name;
    }
    if (speciality != null) {
      data['speciality'] = speciality;
    }
    if (available != null) {
      data['available'] = available;
    }
    if (distance != null) {
      data['distance'] = distance;
    }
    if (addedBy != null) {
      data['addedBy'] = addedBy;
    }
    if (rating != null) {
      data['rating'] = rating;
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
    return data;
  }
}

class Location {
  double? lattitude;
  double? longitude;

  Location({this.lattitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    lattitude = json['lattitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (lattitude != null) {
      data['lattitude'] = lattitude;
    }
    if (longitude != null) {
      data['longitude'] = longitude;
    }
    return data;
  }
}

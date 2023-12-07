class PostGetDoctorListResp {
  String? status;
  String? message;
  Data? data;

  PostGetDoctorListResp({this.status, this.message, this.data});

  PostGetDoctorListResp.fromJson(Map<String, dynamic> json) {
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
  List<DataItem>? data;
  Paginator? paginator;

  Data({this.data, this.paginator});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataItem>[];
      json['data'].forEach((v) {
        data?.add(DataItem.fromJson(v));
      });
    }
    paginator = json['paginator'] != null
        ? Paginator.fromJson(json['paginator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (paginator != null) {
      data['paginator'] = paginator?.toJson();
    }
    return data;
  }
}

class DataItem {
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

  DataItem(
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

  DataItem.fromJson(Map<String, dynamic> json) {
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

class Paginator {
  int? itemCount;
  int? offset;
  int? perPage;
  int? pageCount;
  int? currentPage;
  int? slNo;
  bool? hasPrevPage;
  bool? hasNextPage;
  dynamic prev;
  dynamic next;

  Paginator(
      {this.itemCount,
      this.offset,
      this.perPage,
      this.pageCount,
      this.currentPage,
      this.slNo,
      this.hasPrevPage,
      this.hasNextPage,
      this.prev,
      this.next});

  Paginator.fromJson(Map<String, dynamic> json) {
    itemCount = json['itemCount'];
    offset = json['offset'];
    perPage = json['perPage'];
    pageCount = json['pageCount'];
    currentPage = json['currentPage'];
    slNo = json['slNo'];
    hasPrevPage = json['hasPrevPage'];
    hasNextPage = json['hasNextPage'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (itemCount != null) {
      data['itemCount'] = itemCount;
    }
    if (offset != null) {
      data['offset'] = offset;
    }
    if (perPage != null) {
      data['perPage'] = perPage;
    }
    if (pageCount != null) {
      data['pageCount'] = pageCount;
    }
    if (currentPage != null) {
      data['currentPage'] = currentPage;
    }
    if (slNo != null) {
      data['slNo'] = slNo;
    }
    if (hasPrevPage != null) {
      data['hasPrevPage'] = hasPrevPage;
    }
    if (hasNextPage != null) {
      data['hasNextPage'] = hasNextPage;
    }
    if (prev != null) {
      data['prev'] = prev;
    }
    if (next != null) {
      data['next'] = next;
    }
    return data;
  }
}

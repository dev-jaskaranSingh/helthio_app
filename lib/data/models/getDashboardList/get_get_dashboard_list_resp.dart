class GetGetDashboardListResp {
  String? status;
  String? message;
  Data? data;

  GetGetDashboardListResp({this.status, this.message, this.data});

  GetGetDashboardListResp.fromJson(Map<String, dynamic> json) {
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
  List<Banners>? banners;
  List<Categories>? categories;
  List<Appointments>? appointments;

  Data({this.banners, this.categories, this.appointments});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners?.add(Banners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments?.add(Appointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (banners != null) {
      data['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (appointments != null) {
      data['appointments'] = appointments?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banners {
  int? id;
  String? banner;

  Banners({this.id, this.banner});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banner = json['banner'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    if (banner != null) {
      data['banner'] = banner;
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;

  Categories({this.id, this.name, this.image});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (image != null) {
      data['image'] = image;
    }
    return data;
  }
}

class Appointments {
  int? id;
  String? name;
  String? department;
  String? date;

  Appointments({this.id, this.name, this.department, this.date});

  Appointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    department = json['department'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (id != null) {
      data['id'] = id;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (department != null) {
      data['department'] = department;
    }
    if (date != null) {
      data['date'] = date;
    }
    return data;
  }
}

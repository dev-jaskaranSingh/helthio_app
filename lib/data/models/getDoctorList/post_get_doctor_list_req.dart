class PostGetDoctorListReq {
  Options? options;
  bool? isCountOnly;

  PostGetDoctorListReq({this.options, this.isCountOnly});

  PostGetDoctorListReq.fromJson(Map<String, dynamic> json) {
    options =
        json['options'] != null ? Options.fromJson(json['options']) : null;
    isCountOnly = json['isCountOnly'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (options != null) {
      data['options'] = options?.toJson();
    }
    if (isCountOnly != null) {
      data['isCountOnly'] = isCountOnly;
    }
    return data;
  }
}

class Options {
  int? offset;
  int? page;
  int? limit;
  bool? pagination;
  bool? forceCountFn;

  Options(
      {this.offset, this.page, this.limit, this.pagination, this.forceCountFn});

  Options.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    page = json['page'];
    limit = json['limit'];
    pagination = json['pagination'];
    forceCountFn = json['forceCountFn'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (offset != null) {
      data['offset'] = offset;
    }
    if (page != null) {
      data['page'] = page;
    }
    if (limit != null) {
      data['limit'] = limit;
    }
    if (pagination != null) {
      data['pagination'] = pagination;
    }
    if (forceCountFn != null) {
      data['forceCountFn'] = forceCountFn;
    }
    return data;
  }
}

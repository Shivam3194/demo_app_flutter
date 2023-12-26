// To parse this JSON data, do
//
//     final pageTitleOne = pageTitleOneFromJson(jsonString);

import 'dart:convert';

HomeModel pageTitleOneFromJson(String str) =>
    HomeModel.fromJson(json.decode(str));

String pageTitleOneToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<PersonDetails>? data;
  Support? support;

  HomeModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null
            ? []
            : List<PersonDetails>.from(
                json["data"]!.map((x) => PersonDetails.fromJson(x))),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "support": support?.toJson(),
      };
}

class PersonDetails {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  PersonDetails({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory PersonDetails.fromJson(Map<String, dynamic> json) => PersonDetails(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}

import 'dart:convert';

class UserDetail {
  final String? token;
  final Representative? representative;

  UserDetail({
    this.token,
    this.representative,
  });

  factory UserDetail.fromRawJson(String str) =>
      UserDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        token: json["token"],
        representative: json["representative"] == null
            ? null
            : Representative.fromJson(json["representative"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "representative": representative?.toJson(),
      };
}

class Representative {
  final int? id;
  final String? name;
  final dynamic email;
  final dynamic mobile;
  final String? orgType;
  final Rmg? ufpo;
  final Rmg? rmg;
  final String? avatar;
  final dynamic language;

  Representative({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.orgType,
    this.ufpo,
    this.rmg,
    this.avatar,
    this.language,
  });

  factory Representative.fromRawJson(String str) =>
      Representative.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Representative.fromJson(Map<String, dynamic> json) => Representative(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        orgType: json["org_type"],
        ufpo: json["ufpo"] == null ? null : Rmg.fromJson(json["ufpo"]),
        rmg: json["rmg"] == null ? null : Rmg.fromJson(json["rmg"]),
        avatar: json["avatar"],
        language: json["language"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "org_type": orgType,
        "ufpo": ufpo?.toJson(),
        "rmg": rmg?.toJson(),
        "avatar": avatar,
        "language": language,
      };
}

class Rmg {
  final int? id;
  final String? status;
  final String? name;
  final String? bnName;
  final dynamic email;
  final String? mobile;
  final String? hrContact;
  final int? zip;
  final dynamic area;
  final dynamic district;
  final dynamic division;
  final int? areaId;
  final int? districtId;
  final int? divisionId;
  final String? country;
  final String? addressLine;
  final int? totalWorker;
  final int? totalMale;
  final int? totalFemale;
  final int? ufpoId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? logo;
  final String? latitude;
  final String? longitude;
  final String? officerContact;

  Rmg({
    this.id,
    this.status,
    this.name,
    this.bnName,
    this.email,
    this.mobile,
    this.hrContact,
    this.zip,
    this.area,
    this.district,
    this.division,
    this.areaId,
    this.districtId,
    this.divisionId,
    this.country,
    this.addressLine,
    this.totalWorker,
    this.totalMale,
    this.totalFemale,
    this.ufpoId,
    this.createdAt,
    this.updatedAt,
    this.logo,
    this.latitude,
    this.longitude,
    this.officerContact,
  });

  factory Rmg.fromRawJson(String str) => Rmg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rmg.fromJson(Map<String, dynamic> json) => Rmg(
        id: json["id"],
        status: json["status"],
        name: json["name"],
        bnName: json["bn_name"],
        email: json["email"],
        mobile: json["mobile"],
        hrContact: json["hr_contact"],
        zip: json["zip"],
        area: json["area"],
        district: json["district"],
        division: json["division"],
        areaId: json["area_id"],
        districtId: json["district_id"],
        divisionId: json["division_id"],
        country: json["country"],
        addressLine: json["address_line"],
        totalWorker: json["total_worker"],
        totalMale: json["total_male"],
        totalFemale: json["total_female"],
        ufpoId: json["ufpo_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        logo: json["logo"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        officerContact: json["officer_contact"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "name": name,
        "bn_name": bnName,
        "email": email,
        "mobile": mobile,
        "hr_contact": hrContact,
        "zip": zip,
        "area": area,
        "district": district,
        "division": division,
        "area_id": areaId,
        "district_id": districtId,
        "division_id": divisionId,
        "country": country,
        "address_line": addressLine,
        "total_worker": totalWorker,
        "total_male": totalMale,
        "total_female": totalFemale,
        "ufpo_id": ufpoId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "logo": logo,
        "latitude": latitude,
        "longitude": longitude,
        "officer_contact": officerContact,
      };
}

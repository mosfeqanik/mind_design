import 'dart:convert';

class RmgResponseData {
  final String? status;
  final int? isRmg;
  final String? message;
  final Rmg? rmg;

  RmgResponseData({
    this.status,
    this.isRmg,
    this.message,
    this.rmg,
  });

  factory RmgResponseData.fromRawJson(String str) => RmgResponseData.fromJson(
        json.decode(str),
      );

  String toRawJson() => json.encode(toJson());

  factory RmgResponseData.fromJson(Map<String, dynamic> json) =>
      RmgResponseData(
        status: json["status"],
        isRmg: json["is_rmg"],
        message: json["message"],
        rmg: json["rmg"] == null ? null : Rmg.fromJson(json["rmg"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "is_rmg": isRmg,
        "message": message,
        "rmg": rmg?.toJson(),
      };
}

class Rmg {
  final int? id;
  final String? name;
  final String? bnName;
  final String? mobile;
  final dynamic email;
  final dynamic officerContact;
  final String? hrContact;
  final int? areaId;
  final dynamic area;
  final int? districtId;
  final dynamic district;
  final int? divisionId;
  final dynamic division;
  final String? country;
  final String? addressLine;
  final String? status;
  final String? logo;
  final int? zip;
  final String? latitude;
  final String? longitude;
  final int? totalWorker;
  final int? totalMale;
  final int? totalFemale;
  final int? ufpoId;
  final Ufpo? ufpo;
  final List<RmgProduct>? products;

  Rmg({
    this.id,
    this.name,
    this.bnName,
    this.mobile,
    this.email,
    this.officerContact,
    this.hrContact,
    this.areaId,
    this.area,
    this.districtId,
    this.district,
    this.divisionId,
    this.division,
    this.country,
    this.addressLine,
    this.status,
    this.logo,
    this.zip,
    this.latitude,
    this.longitude,
    this.totalWorker,
    this.totalMale,
    this.totalFemale,
    this.ufpoId,
    this.ufpo,
    this.products,
  });

  factory Rmg.fromRawJson(String str) => Rmg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rmg.fromJson(Map<String, dynamic> json) => Rmg(
        id: json["id"],
        name: json["name"],
        bnName: json["bn_name"],
        mobile: json["mobile"],
        email: json["email"],
        officerContact: json["officer_contact"],
        hrContact: json["hr_contact"],
        areaId: json["area_id"],
        area: json["area"],
        districtId: json["district_id"],
        district: json["district"],
        divisionId: json["division_id"],
        division: json["division"],
        country: json["country"],
        addressLine: json["address_line"],
        status: json["status"],
        logo: json["logo"],
        zip: json["zip"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        totalWorker: json["total_worker"],
        totalMale: json["total_male"],
        totalFemale: json["total_female"],
        ufpoId: json["ufpo_id"],
        ufpo: json["ufpo"] == null ? null : Ufpo.fromJson(json["ufpo"]),
        products: json["products"] == null
            ? []
            : List<RmgProduct>.from(
                json["products"]!.map((x) => RmgProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bn_name": bnName,
        "mobile": mobile,
        "email": email,
        "officer_contact": officerContact,
        "hr_contact": hrContact,
        "area_id": areaId,
        "area": area,
        "district_id": districtId,
        "district": district,
        "division_id": divisionId,
        "division": division,
        "country": country,
        "address_line": addressLine,
        "status": status,
        "logo": logo,
        "zip": zip,
        "latitude": latitude,
        "longitude": longitude,
        "total_worker": totalWorker,
        "total_male": totalMale,
        "total_female": totalFemale,
        "ufpo_id": ufpoId,
        "ufpo": ufpo?.toJson(),
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class RmgProduct {
  final int? id;
  final String? name;
  final String? bnName;
  final String? image;
  final String? takenQty;
  final DateTime? lastDistributionDate;
  final DateTime? nextRefillDate;

  RmgProduct(
      {this.id,
      this.name,
      this.bnName,
      this.image,
      this.takenQty,
      this.lastDistributionDate,
      this.nextRefillDate});

  factory RmgProduct.fromRawJson(String str) =>
      RmgProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RmgProduct.fromJson(Map<String, dynamic> json) => RmgProduct(
        id: json["id"],
        name: json["name"],
        bnName: json["bn_name"],
        image: json["image"],
        takenQty: json["taken_qty"],
        lastDistributionDate: json["last_distribution_date"] == null
            ? null
            : DateTime.parse(json["last_distribution_date"]),
        nextRefillDate: json["next_refill_date"] == null
            ? null
            : DateTime.parse(json["next_refill_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bn_name": bnName,
        "image": image,
        "taken_qty": takenQty,
        "last_distribution_date": lastDistributionDate?.toIso8601String(),
        "next_refill_date": nextRefillDate?.toIso8601String(),
      };
}

class Ufpo {
  final int? id;
  final String? name;
  final String? bnName;
  final dynamic zip;
  final int? areaId;
  final int? districtId;
  final int? divisionId;
  final String? country;
  final String? addressLine;
  final String? logo;
  final String? longitude;
  final String? latitude;

  Ufpo({
    this.id,
    this.name,
    this.bnName,
    this.zip,
    this.areaId,
    this.districtId,
    this.divisionId,
    this.country,
    this.addressLine,
    this.logo,
    this.longitude,
    this.latitude,
  });

  factory Ufpo.fromRawJson(String str) => Ufpo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ufpo.fromJson(Map<String, dynamic> json) => Ufpo(
        id: json["id"],
        name: json["name"],
        bnName: json["bn_name"],
        zip: json["zip"],
        areaId: json["area_id"],
        districtId: json["district_id"],
        divisionId: json["division_id"],
        country: json["country"],
        addressLine: json["address_line"],
        logo: json["logo"],
        longitude: json["longitude"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bn_name": bnName,
        "zip": zip,
        "area_id": areaId,
        "district_id": districtId,
        "division_id": divisionId,
        "country": country,
        "address_line": addressLine,
        "logo": logo,
        "longitude": longitude,
        "latitude": latitude,
      };
}

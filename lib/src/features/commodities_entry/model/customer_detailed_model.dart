import 'dart:convert';

class CustomerResponseData {
  final String? status;
  final int? isRmg;
  final String? message;
  final Customer? customer;

  CustomerResponseData({
    this.status,
    this.isRmg,
    this.message,
    this.customer,
  });

  factory CustomerResponseData.fromRawJson(String str) =>
      CustomerResponseData.fromJson(
        json.decode(str),
      );

  String toRawJson() => json.encode(toJson());

  factory CustomerResponseData.fromJson(Map<String, dynamic> json) =>
      CustomerResponseData(
        status: json["status"],
        isRmg: json["is_rmg"],
        message: json["message"],
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "is_rmg": isRmg,
        "message": message,
        "customer": customer?.toJson(),
      };
}

class Customer {
  final int? id;
  final String? name;
  final dynamic email;
  final String? mobile;
  final String? avatar;
  final String? employeeNo;
  final String? maritalStatus;
  final int? totalChildren;
  final dynamic bloodGroup;
  final dynamic profession;
  final dynamic position;
  final Rmg? rmg;
  final dynamic ufpo;
  final dynamic religion;
  final DateTime? createdAt;
  final List<CustomerProduct>? products;

  Customer({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.avatar,
    this.employeeNo,
    this.maritalStatus,
    this.totalChildren,
    this.bloodGroup,
    this.profession,
    this.position,
    this.rmg,
    this.ufpo,
    this.religion,
    this.createdAt,
    this.products,
  });

  factory Customer.fromRawJson(String str) =>
      Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        avatar: json["avatar"],
        employeeNo: json["employee_no"],
        maritalStatus: json["marital_status"],
        totalChildren: json["total_children"],
        bloodGroup: json["blood_group"],
        profession: json["profession"],
        position: json["position"],
        rmg: json["rmg"] == null ? null : Rmg.fromJson(json["rmg"]),
        ufpo: json["ufpo"],
        religion: json["religion"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        products: json["products"] == null
            ? []
            : List<CustomerProduct>.from(
                json["products"]!.map((x) => CustomerProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "avatar": avatar,
        "employee_no": employeeNo,
        "marital_status": maritalStatus,
        "total_children": totalChildren,
        "blood_group": bloodGroup,
        "profession": profession,
        "position": position,
        "rmg": rmg?.toJson(),
        "ufpo": ufpo,
        "religion": religion,
        "createdAt": createdAt?.toIso8601String(),
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class CustomerProduct {
  final int? id;
  final String? name;
  final String? bnName;
  final String? image;
  final String? takenQty;
  final DateTime? lastDistributionDate;
  final DateTime? nextRefillDate;

  CustomerProduct(
      {this.id,
      this.name,
      this.bnName,
      this.image,
      this.takenQty,
      this.lastDistributionDate,
      this.nextRefillDate});

  factory CustomerProduct.fromRawJson(String str) =>
      CustomerProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerProduct.fromJson(Map<String, dynamic> json) =>
      CustomerProduct(
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

class Rmg {
  final int? id;
  final String? name;
  final String? bnName;
  final String? hrContact;

  Rmg({
    this.id,
    this.name,
    this.bnName,
    this.hrContact,
  });

  factory Rmg.fromRawJson(String str) => Rmg.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rmg.fromJson(Map<String, dynamic> json) => Rmg(
        id: json["id"],
        name: json["name"],
        bnName: json["bn_name"],
        hrContact: json["hr_contact"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bn_name": bnName,
        "hr_contact": hrContact,
      };
}

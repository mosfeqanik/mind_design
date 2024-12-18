import 'dart:convert';

class GetAvailableQuantityModel {
  final List<RmgAvailableData>? data;

  GetAvailableQuantityModel({
    this.data,
  });

  factory GetAvailableQuantityModel.fromRawJson(String str) =>
      GetAvailableQuantityModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetAvailableQuantityModel.fromJson(Map<String, dynamic> json) =>
      GetAvailableQuantityModel(
        data: json["data"] == null
            ? []
            : List<RmgAvailableData>.from(
                json["data"]!.map((x) => RmgAvailableData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class RmgAvailableData {
  final int? id;
  final String? name;
  final String? bnName;
  final String? image;
  final String? availableQty;

  RmgAvailableData({
    this.id,
    this.name,
    this.bnName,
    this.image,
    this.availableQty,
  });

  factory RmgAvailableData.fromRawJson(String str) =>
      RmgAvailableData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RmgAvailableData.fromJson(Map<String, dynamic> json) =>
      RmgAvailableData(
        id: json["id"],
        name: json["name"],
        bnName: json["bn_name"],
        image: json["image"],
        availableQty: json["available_qty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bn_name": bnName,
        "image": image,
        "available_qty": availableQty,
      };
}

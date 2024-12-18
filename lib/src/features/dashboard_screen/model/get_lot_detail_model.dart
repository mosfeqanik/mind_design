import 'dart:convert';

class GetLotDetailedListData {
  final List<LotData>? data;

  GetLotDetailedListData({
    this.data,
  });

  factory GetLotDetailedListData.fromRawJson(String str) =>
      GetLotDetailedListData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetLotDetailedListData.fromJson(Map<String, dynamic> json) =>
      GetLotDetailedListData(
        data: json["data"] == null
            ? []
            : List<LotData>.from(json["data"]!.map((x) => LotData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class LotData {
  final int? id;
  final String? name;
  final String? bnName;
  final String? batchNo;
  final dynamic image;
  final String? availableQty;

  LotData({
    this.id,
    this.name,
    this.bnName,
    this.batchNo,
    this.image,
    this.availableQty,
  });

  factory LotData.fromRawJson(String str) => LotData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LotData.fromJson(Map<String, dynamic> json) => LotData(
        id: json["id"],
        name: json["name"],
        bnName: json["bn_name"],
        batchNo: json["batch_no"],
        image: json["image"],
        availableQty: json["available_qty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bn_name": bnName,
        "batch_no": batchNo,
        "image": image,
        "available_qty": availableQty,
      };
}

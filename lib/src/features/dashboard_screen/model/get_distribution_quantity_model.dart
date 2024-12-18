import 'dart:convert';

class GetDistributionQuantityModel {
    final List<RmgDistributionData>? data;

    GetDistributionQuantityModel({
        this.data,
    });

    factory GetDistributionQuantityModel.fromRawJson(String str) => GetDistributionQuantityModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetDistributionQuantityModel.fromJson(Map<String, dynamic> json) => GetDistributionQuantityModel(
        data: json["data"] == null ? [] : List<RmgDistributionData>.from(json["data"]!.map((x) => RmgDistributionData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class RmgDistributionData {
    final int? id;
    final String? name;
    final String? bnName;
    final String? image;
    final String? distributeQty;

    RmgDistributionData({
        this.id,
        this.name,
        this.bnName,
        this.image,
        this.distributeQty,
    });

    factory RmgDistributionData.fromRawJson(String str) => RmgDistributionData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RmgDistributionData.fromJson(Map<String, dynamic> json) => RmgDistributionData(
        id: json["id"],
        name: json["name"],
        bnName: json["bn_name"],
        image: json["image"],
        distributeQty: json["distribute_qty"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "bn_name": bnName,
        "image": image,
        "distribute_qty": distributeQty,
    };
}

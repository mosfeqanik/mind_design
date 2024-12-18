import 'dart:convert';

class DistributionInputDataRmgModel {
  final int? productId;
  final int? customerId;
  final int? itemLotId;
  final int? unitQty;
  final DateTime? refilAt;
  final String? note;

  DistributionInputDataRmgModel({
    this.productId,
    this.customerId,
    this.itemLotId,
    this.unitQty,
    this.refilAt,
    this.note,
  });

  factory DistributionInputDataRmgModel.fromRawJson(String str) =>
      DistributionInputDataRmgModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DistributionInputDataRmgModel.fromJson(Map<String, dynamic> json) =>
      DistributionInputDataRmgModel(
        productId: json["product_id"],
        customerId: json["customer_id"],
        itemLotId: json["item_lot_id"],
        unitQty: json["unit_qty"],
        refilAt: json["refill_date"] == null
            ? null
            : DateTime.parse(json["refill_date"]),
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "customer_id": customerId,
        "item_lot_id": itemLotId,
        "unit_qty": unitQty,
        "refill_date": refilAt?.toIso8601String(),
        "note": note,
      };
}

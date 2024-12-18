import 'dart:convert';

class DistributionInputDataUFPOModel {
  final int? productId;
  final int? customerId;
  final int? itemLotId;
  final int? unitQty;
  final DateTime? refilAt;
  final String? note;
  final int? isRmg;
  final DateTime? expiryAt;
  final DateTime? mfgAt;

  DistributionInputDataUFPOModel({
    this.productId,
    this.customerId,
    this.itemLotId,
    this.unitQty,
    this.refilAt,
    this.note,
    this.isRmg,
    this.expiryAt,
    this.mfgAt,
  });

  factory DistributionInputDataUFPOModel.fromRawJson(String str) =>
      DistributionInputDataUFPOModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DistributionInputDataUFPOModel.fromJson(Map<String, dynamic> json) =>
      DistributionInputDataUFPOModel(
        productId: json["product_id"],
        customerId: json["customer_id"],
        itemLotId: json["item_lot_id"],
        unitQty: json["unit_qty"],
        refilAt: json["refill_date"] == null
            ? null
            : DateTime.parse(json["refill_date"]),
        note: json["note"],
        isRmg: json["is_rmg"],
        expiryAt: json["expiry_at"] == null
            ? null
            : DateTime.parse(json["expiry_at"]),
        mfgAt: json["mfg_at"] == null ? null : DateTime.parse(json["mfg_at"]),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "customer_id": customerId,
        "item_lot_id": itemLotId,
        "unit_qty": unitQty,
        "refill_date": refilAt?.toIso8601String(),
        "note": note,
        "is_rmg": isRmg,
        "expiry_at":
            "${expiryAt!.year.toString().padLeft(4, '0')}-${expiryAt!.month.toString().padLeft(2, '0')}-${expiryAt!.day.toString().padLeft(2, '0')}",
        "mfg_at":
            "${mfgAt!.year.toString().padLeft(4, '0')}-${mfgAt!.month.toString().padLeft(2, '0')}-${mfgAt!.day.toString().padLeft(2, '0')}",
      };
}

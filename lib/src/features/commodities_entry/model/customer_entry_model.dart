class CustomerEntryModel {
  String? mobile;
  String? isRmg;

  CustomerEntryModel({
    this.mobile,
    this.isRmg,
  });

  CustomerEntryModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    isRmg = json['isRmg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = mobile;
    data['isRmg'] = isRmg;
    return data;
  }
}

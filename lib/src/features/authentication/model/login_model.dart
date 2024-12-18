class LoginModel {
  String? username;
  String? password;
  String? deviceName;

  LoginModel({this.username, this.password,this.deviceName});

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    deviceName = json['device_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['device_name'] = deviceName;
    return data;
  }
}

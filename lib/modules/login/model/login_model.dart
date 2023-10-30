class LoginModel {
  bool? result;
  String? token;

  LoginModel({this.result, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['token'] = token;
    return data;
  }
}

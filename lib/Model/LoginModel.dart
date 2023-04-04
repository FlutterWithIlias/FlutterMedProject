class LoginModel {
  int? code;
  String? email;
  int? password;

  LoginModel({this.code, this.email, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
class ResponseLogin {
  String? username;
  String? password;

  ResponseLogin({this.username, this.password});

  ResponseLogin.fromJson(dynamic json) {
    username = json["username"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = username;
    data["password"] = password;
    return data;
  }
}

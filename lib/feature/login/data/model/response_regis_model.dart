class ResponseRegis {
  String? nama;
  String? username;
  String? password;

  ResponseRegis({this.nama, this.username, this.password});

  ResponseRegis.fromJson(dynamic json) {
    nama = json["nama"];
    username = json["username"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["nama"] = nama;
    data["username"] = username;
    data["password"] = password;
    return data;
  }
}

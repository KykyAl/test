class ResponseLoginEntity {
  int? id;
  String? nama;
  String? username;
  String? password;

  ResponseLoginEntity(this.id, this.nama, this.username, this.password);

  ResponseLoginEntity.fromJson(dynamic json) {
    id = json["id"];
    nama = json["nama"];
    username = json["username"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["nama"] = nama;
    data["username"] = username;
    data["password"] = password;
    return data;
  }
}

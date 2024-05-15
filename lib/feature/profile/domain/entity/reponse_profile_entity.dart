class ResponseListEntity {
  String? NomerRegistrasi;
  String? NomerPolisi;
  String? NamaSuratJalan;
  String? NamaSupir;
  String? photoPath;
  String? bodyTemperature;

  ResponseListEntity(
      this.NomerRegistrasi,
      this.NomerPolisi,
      this.NamaSuratJalan,
      this.NamaSupir,
      this.photoPath,
      this.bodyTemperature);

  ResponseListEntity.fromJson(dynamic json) {
    NomerRegistrasi = json["NomerRegistrasi"];
    NomerPolisi = json["NomerPolisi"];
    NamaSuratJalan = json["NamaSuratJalan"];
    NamaSupir = json["NamaSupir"];
    photoPath = json["photo_path"];
    bodyTemperature = json["body_temperature"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["NomerRegistrasi"] = NomerRegistrasi;
    data["NomerPolisi"] = NomerPolisi;
    data["NamaSuratJalan"] = NamaSuratJalan;
    data["NamaSupir"] = NamaSupir;
    data["photo_path"] = photoPath;
    data["body_temperature"] = bodyTemperature;
    return data;
  }
}

class ResponseListEntity {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  ResponseListEntity(
      this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  ResponseListEntity.fromJson(dynamic json) {
    albumId = json["albumId"];
    id = json["id"];
    title = json["title"];
    url = json["url"];
    thumbnailUrl = json["thumbnailUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["albumId"] = albumId;
    data["id"] = id;
    data["title"] = title;
    data["url"] = url;
    data["thumbnailUrl"] = thumbnailUrl;
    return data;
  }
}

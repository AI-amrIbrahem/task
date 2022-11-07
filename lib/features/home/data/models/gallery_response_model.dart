import 'dart:convert';

GalleryResponseModel galleryResponseFromJson(String str) => GalleryResponseModel.fromJson(json.decode(str));

String galleryResponseToJson(GalleryResponseModel data) => json.encode(data.toJson());

class GalleryResponseModel {
  GalleryResponseModel({
    required this.data,
  });

  GalleryData data;

  factory GalleryResponseModel.fromJson(Map<String, dynamic> json) => GalleryResponseModel(
    data: GalleryData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class GalleryData {
  GalleryData({
    this.images = const[],
  });

  List<String> images = [];

  factory GalleryData.fromJson(Map<String, dynamic> json) => GalleryData(
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}

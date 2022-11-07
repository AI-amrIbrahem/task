import 'dart:io';

import 'package:task/features/home/data/models/gallery_response_model.dart';
import 'package:task/utils/errors/exceptions.dart';
import 'package:task/utils/log.dart';
import 'package:task/utils/network/common.dart';
import 'package:http/http.dart' as http;
import 'package:task/utils/network/services_urls.dart';

class GalleryDataSource {
  Future<GalleryResponseModel> getGallery({required String userToken}) async {
    late var reponse;
    try {
      reponse = await http.get(
          Uri.parse(ServicesURLs.development_environment + Common.myGallery),
          headers: {"Authorization": "Bearer $userToken"});
    } catch (error) {
      Log.e('getGallery error $error');
      throw ServerException();
    }
    Log.i('getGallery reponse $reponse');

    if (reponse['status'] == 'success') {
      return GalleryResponseModel.fromJson(reponse);
    } else {
      throw WrongDataException(reponse['error_message']);
    }
  }

  Future<bool> uploadImage(
      {required String userToken, required String filepath}) async {
    late var reponse;
    try {
      var request = http.MultipartRequest('POST',
          Uri.parse(ServicesURLs.development_environment + Common.uploadImage));
      request.headers.addAll({"Authorization": "Bearer $userToken"});
      request.files.add(http.MultipartFile('image',
          File(filepath).readAsBytes().asStream(), File(filepath).lengthSync(),
          filename: filepath.split("/").last));
      reponse = await request.send();
    } catch (error) {
      Log.e('uploadImage error $error');
      throw ServerException();
    }
    Log.i('uploadImage reponse $reponse');

    if (reponse['errors'] != null) {
      return true;
    } else {
      throw WrongDataException(reponse['error_message']);
    }
  }
}

import 'dart:convert';
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
      var res = await http.get(
        Uri.parse(ServicesURLs.development_environment + Common.myGallery),
          // headers: {"Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTE3MTBmNTA4MzFmY2NiNDYwNGExMzY0ODJmNDFiZjU5OTEzY2JkY2ZhZmU2ZDY1OWJmZmQ5OGVkODE1MDk5MTRmNTRmMjZmZDA2NGZjZDIiLCJpYXQiOjE2NjcyODk3ODUuMDMzMTk5LCJuYmYiOjE2NjcyODk3ODUuMDMzMjAzLCJleHAiOjE2OTg4MjU3ODUuMDI2MzI0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.bWImC0xkzNQe8iKxL1Scg0tGGZGUy3vWsiX1vBzj1gLvynIMJcOqVkEVZc2C3MgSaCHjyqGkN7zWyqYVqLasAaKKFmj9JiQgXozvPcHJPoJCGQQvogt-gnM0DPeFMF-g_CVJPNZ3nUkXpOLl3Os5DhvW53OVT1n5pisoNyvsrEJURWTXxt1EIxwnmoj0An8y9kq2WSX4Zn2RoVGKe3QnL-KOGKksfv2ahj7hG-ZNwVYazI6TXCIxZBCYGoZtfvq9CjTrVUcCBSiGgdyaJzAZi0lNR2c2zcZxWGbBQ_QvfTFDZmmPyogScE5cgy4MGsnYe4Sw7qLmHIrSsrMaJxRgQ_b7xobq9ob1vDhw9O-VcPpiCllEFyjMkdKOFC8UffoYZB3bafp9KZB6Dr3tS7fo6f4ojAKnj-b8g6AigjuFb4FAYlC0vxT76mtvvYFm8MjH1kH2QmJ0HzvhBxv45K9Cdtuvr3DdrwyDaoROR4eZ6S-Xp-LYuCkZ-e4UenLJC4mDUu8u6xoyLHKul3FhNlAUMj-oScKZgJxRUYhbVxzXruHwaycKdlX284-Y6cfSAf3AjIvfaXYeB1ajGuuCtYceBVGM5tDxY4i9I7kthk3DNRjaRQPIl5c8GQlYV3I3p-RItB33Y-ECNiG92U2fgB8fAVw5urOuFX7pIZZ0NEc6VAY"}
        headers: {"Authorization": "Bearer $userToken"}
      );
      reponse = jsonDecode(utf8.decode(res.bodyBytes));

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
      request.files.add(http.MultipartFile('img',
          File(filepath).readAsBytes().asStream(), File(filepath).lengthSync(),
          filename: filepath.split("/").last));
      var res = await request.send();
      reponse = jsonDecode(utf8.decode(await res.stream.toBytes()));

    } catch (error) {
      Log.e('uploadImage error $error');
      throw ServerException();
    }
    Log.i('uploadImage reponse $reponse');

    if (reponse['status'] == 'success') {
      return true;
    } else {
      throw WrongDataException(reponse['error_message']);
    }
  }
}

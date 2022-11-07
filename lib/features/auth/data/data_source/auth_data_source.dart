import 'dart:convert';

import 'package:task/features/auth/data/models/user_model.dart';
import 'package:task/utils/errors/exceptions.dart';
import 'package:task/utils/log.dart';
import 'package:task/utils/network/common.dart';
import 'package:http/http.dart' as http;
import 'package:task/utils/network/services_urls.dart';

class AuthDataSource {
  Future<UserLoginResponse> login(
      {required String email, required String password}) async {
    late var response;
    try {
      var res = await http.post(
          Uri.parse(ServicesURLs.development_environment + Common.login),
          body: {"email": email, "password": password});
      response = jsonDecode(utf8.decode(res.bodyBytes));
    } catch (error) {
      Log.e('login error $error');
      throw ServerException();
    }
    Log.i('login reponse ${response}');

    if (response['token'] != null && response['user'] != null) {
      return UserLoginResponse.fromJson(response);
    } else {
      throw WrongDataException(response['error_message']);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/features/auth/data/data_source/auth_data_source.dart';
import 'package:task/features/auth/data/models/user_model.dart';
import 'package:task/features/auth/data/repo/auth_repo_imp.dart';
import 'package:task/features/auth/domain/use_case/login_use_case.dart';
import 'package:task/utils/di/injection.dart';
import 'package:task/utils/errors/failures.dart';
import 'package:task/utils/network/network_info.dart';
import 'package:task/utils/resources/snackbar_widget.dart';


UserLoginResponse? userModel;

class LoginController extends GetxController{
  var userNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var passwordController = TextEditingController();


  login({required BuildContext context,required String email,required String password}) {
    showLoadingDialog(context, dismissible: false);
    LoginUseCase(
        authRepo: AuthRepoImp(
          networkInfo: instance<NetworkInfoImp>(),
          authDataSource: AuthDataSource(),
        )).call(email: email, password: password).then((value) {
      dismissLoadingDialog(context);
      value.fold((l) {
        if (l is OffLineFailure) {
          failSnackBar('لا يوجد اتصال بالانترنت', 'برجاء الاتصال اولا');
        } else if (l is WrongDataFailure) {
          failSnackBar(l.message.toString(), 'من فضلك ادخل بيانات صحيحة');
        } else if (l is ServerFailure) {
          failSnackBar(
              'هناك مشكلة في السيرفر ', 'برجاء التواصل مع خدمة العملاء');
        }
      }, (r) {
        userModel = r;
        // HiveHelper.setUserData(r);
        // Get.offAll(Home());
      });
    });
  }

}
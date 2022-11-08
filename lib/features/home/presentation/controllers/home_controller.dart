import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task/features/auth/presentation/controllers/login_controller.dart';
import 'package:task/features/home/data/data_source/gallery_data_source.dart';
import 'package:task/features/home/data/repo/auth_repo_imp.dart';
import 'package:task/features/home/domain/use_case/get_gallery.dart';
import 'package:task/features/home/domain/use_case/upload_image.dart';
import 'package:task/utils/di/injection.dart';
import 'package:task/utils/errors/failures.dart';
import 'package:task/utils/network/network_info.dart';
import 'package:task/utils/resources/snackbar_widget.dart';


class HomeController extends GetxController{

  List<String> images = [];
  bool isLoading = true;


  @override
  void onInit() {
    getGallery(userToken: userModel!.token);
  }

  getGallery({required String userToken}) {
    GetGalleryUseCase(
        galleryRepo: GalleryRepoImp(
          networkInfo: instance<NetworkInfoImp>(),
          galleryDataSource: GalleryDataSource(),
        )).call(userToken: userToken).then((value) {
      isLoading = false;
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
        images = r.data.images;
        update();
      });
    });
  }

  uploadImage({required BuildContext context,required String userToken, required String filepath}) {
    showLoadingDialog(context,dismissible: false);
    UploadImageUseCase(
        galleryRepo: GalleryRepoImp(
          networkInfo: instance<NetworkInfoImp>(),
          galleryDataSource: GalleryDataSource(),
        )).call(userToken: userToken, filepath: filepath).then((value) {
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
        getGallery(userToken: userToken);
        update();
      });
    });
  }



}



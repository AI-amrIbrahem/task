import 'package:dartz/dartz.dart';
import 'package:task/features/auth/data/data_source/auth_data_source.dart';
import 'package:task/features/auth/data/models/user_model.dart';
import 'package:task/features/auth/domain/repo/auth_repo.dart';
import 'package:task/features/home/data/data_source/gallery_data_source.dart';
import 'package:task/features/home/data/models/gallery_response_model.dart';
import 'package:task/features/home/domain/repo/gallery_repo.dart';
import 'package:task/utils/errors/failures.dart';
import '../../../../utils/errors/exceptions.dart';
import '../../../../utils/network/network_info.dart';

class GalleryRepoImp extends GalleryRepo {
  NetworkInfo networkInfo;
  GalleryDataSource galleryDataSource;

  GalleryRepoImp({required this.networkInfo, required this.galleryDataSource});

  @override
  Future<Either<Failure, GalleryResponseModel>> getGallery(
      {required String userToken}) async {
    if (await networkInfo.isConnected) {
      try {
        GalleryResponseModel galleryResponseModel =
            await galleryDataSource.getGallery(userToken: userToken);
        return right(galleryResponseModel);
      } on WrongDataException catch (message) {
        return left(WrongDataFailure(message: message.message));
      } on ServerException {
        return left(ServerFailure());
      } on UserNameException {
        return left(WrongUserNameFailure());
      }
    } else {
      return Left(OffLineFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> uploadImage({required String userToken, required String filepath}) async {
    if (await networkInfo.isConnected) {
      try {
        bool isUpload =
        await galleryDataSource.uploadImage(userToken: userToken, filepath: filepath);
        return right(isUpload);
      } on WrongDataException catch (message) {
        return left(WrongDataFailure(message: message.message));
      } on ServerException {
        return left(ServerFailure());
      } on UserNameException {
        return left(WrongUserNameFailure());
      }
    } else {
      return Left(OffLineFailure());
    }
  }

}

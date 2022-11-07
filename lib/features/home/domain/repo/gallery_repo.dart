import 'package:dartz/dartz.dart';
import 'package:task/features/home/data/models/gallery_response_model.dart';
import '../../../../utils/errors/failures.dart';

abstract class GalleryRepo {
  Future<Either<Failure, GalleryResponseModel>> getGallery({required String userToken});
  Future<Either<Failure, bool>> uploadImage({required String userToken, required String filepath});
}
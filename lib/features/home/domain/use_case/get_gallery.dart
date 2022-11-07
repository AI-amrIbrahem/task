import 'package:dartz/dartz.dart';
import 'package:task/features/auth/data/models/user_model.dart';
import 'package:task/features/auth/domain/repo/auth_repo.dart';
import 'package:task/features/home/data/models/gallery_response_model.dart';
import 'package:task/features/home/domain/repo/gallery_repo.dart';

import '../../../../../utils/errors/failures.dart';

class GetGalleryUseCase {
  final GalleryRepo galleryRepo;

  GetGalleryUseCase({required this.galleryRepo});

  Future<Either<Failure, GalleryResponseModel>> call(
      {required String userToken}) async {
    return await galleryRepo.getGallery(userToken: userToken);
  }
}

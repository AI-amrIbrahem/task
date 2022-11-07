import 'package:dartz/dartz.dart';
import 'package:task/features/auth/data/models/user_model.dart';
import 'package:task/features/auth/domain/repo/auth_repo.dart';
import 'package:task/features/home/data/models/gallery_response_model.dart';
import 'package:task/features/home/domain/repo/gallery_repo.dart';

import '../../../../../utils/errors/failures.dart';

class UploadImageUseCase {
  final GalleryRepo galleryRepo;

  UploadImageUseCase({required this.galleryRepo});

  Future<Either<Failure, bool>> call({required String userToken, required String filepath}) async {
    return await galleryRepo.uploadImage(userToken: userToken, filepath: filepath);
  }

}

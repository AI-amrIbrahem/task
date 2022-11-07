import 'package:dartz/dartz.dart';
import 'package:task/features/auth/data/models/user_model.dart';
import 'package:task/features/auth/domain/repo/auth_repo.dart';

import '../../../../../utils/errors/failures.dart';

class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<Either<Failure, UserLoginResponse>> call(
      {required String email, required String password}) async {
    return await authRepo.login(email: email, password: password);
  }
}

import 'package:dartz/dartz.dart';
import 'package:task/features/auth/data/models/user_model.dart';
import '../../../../utils/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserLoginResponse>> login({required String email, required String password});
}

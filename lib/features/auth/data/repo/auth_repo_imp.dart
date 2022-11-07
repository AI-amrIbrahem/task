import 'package:dartz/dartz.dart';
import 'package:task/features/auth/data/data_source/auth_data_source.dart';
import 'package:task/features/auth/data/models/user_model.dart';
import 'package:task/features/auth/domain/repo/auth_repo.dart';
import 'package:task/utils/errors/failures.dart';
import '../../../../utils/errors/exceptions.dart';
import '../../../../utils/network/network_info.dart';

class AuthRepoImp extends AuthRepo {
  NetworkInfo networkInfo;
  AuthDataSource authDataSource;

  AuthRepoImp({required this.networkInfo, required this.authDataSource});

  @override
  Future<Either<Failure, UserLoginResponse>> login(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        UserLoginResponse userLoginResponse =
            await authDataSource.login(email: email, password: password);
        return right(userLoginResponse);
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

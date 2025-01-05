import 'package:dartz/dartz.dart';

import '../../data/models/failure_response_model.dart';
import '../../data/models/login_response_model.dart';
import '../../data/models/logout_response_model.dart';
import '../../data/models/register_user_response_model.dart';
import '../../data/models/user_register_request_model.dart';
import '../../shared/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<FailureResponse, LoginResponse>> login(
      String email, String password);
  Future<Either<FailureResponse, LogoutResponse>> logout(String userId);
  Future<Either<FailureResponse, RegisterUserResponse>> register(
      UserRegisterRequestModel newUser);

  Future<Either<Failure, Map<String, dynamic>>> forgotPassword(String email);
  Future<Either<Failure, Map<String, dynamic>>> changePassword(
    int id,
    String newPassword,
    String oldPassword,
  );
}

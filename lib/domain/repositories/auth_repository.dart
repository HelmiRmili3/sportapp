import 'package:dartz/dartz.dart';
import 'package:sportapp/shared/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> login(
      String email, String password);
  Future<Either<Failure, Map<String, dynamic>>> logout(int userId);
  Future<Either<Failure, Map<String, dynamic>>> forgotPassword(String email);
  Future<Either<Failure, Map<String, dynamic>>> changePassword(
      int id, String newPassword, String oldPassword);
  // Future<Either<String, Map<String, dynamic>>> getUserProfile();
  // Future<Either<String, Map<String, dynamic>>> updateUserProfile(
  //     UpdateUserEntity updateUserEntity);
}

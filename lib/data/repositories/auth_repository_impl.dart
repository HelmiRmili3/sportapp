// import 'package:sportapp/domain/entites/update_user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:sportapp/data/models/login_response_model.dart';
import 'package:sportapp/data/models/logout_response_model.dart';
import 'package:sportapp/data/models/register_user_response_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../shared/errors/failure.dart';
import '../datasources/remote_data_source.dart';
import '../models/failure_response_model.dart';
import '../models/user_register_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Map<String, dynamic>>> changePassword(
    int id,
    String newPassword,
    String oldPassword,
  ) async {
    try {
      final result =
          await remoteDataSource.changePassword(id, oldPassword, newPassword);
      return Right(result as Map<String, dynamic>); // Successful response
    } catch (e) {
      return Left(Failure("Server error : ${e.toString()}")); // Error response
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> forgotPassword(
      String email) async {
    try {
      final result = await remoteDataSource.forgotPassword(email);
      return Right(result as Map<String, dynamic>); // Successful response
    } catch (e) {
      return Left(Failure("Server error : ${e.toString()}")); // Error response
    }
  }

  @override
  Future<Either<FailureResponse, LoginResponse>> login(
      String email, String password) async {
    final result = await remoteDataSource.login(email, password);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<FailureResponse, LogoutResponse>> logout(String userId) async {
    final result = await remoteDataSource.logout(userId);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<FailureResponse, RegisterUserResponse>> register(
      UserRegisterRequestModel newUser) async {
    final result = await remoteDataSource.register(newUser);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  // @override
  // Future<Either<String, Map<String, dynamic>>> updateUserProfile(
  //     UpdateUserEntity updateUserEntity) async {
  //   try {
  //     final result = await remoteDataSource.updateUserProfile(updateUserEntity);
  //     return Right(result); // Successful response
  //   } catch (e) {
  //     return Left(e.toString()); // Error response
  //   }
  // }

  // @override
  // Future<Either<String, Map<String, dynamic>>> getUserProfile() async {
  //   try {
  //     final result = await remoteDataSource.getUserProfile();
  //     return Right(result); // Successful response
  //   } catch (e) {
  //     return Left(e.toString()); // Error response
  //   }
  // }
}

import 'package:dartz/dartz.dart';
import 'package:sportapp/data/models/coaches_response_model.dart';

import 'package:sportapp/domain/entites/update_user_entity.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasources/remote_data_source.dart';
import '../models/failure_response_model.dart';
import '../models/profile_response_model.dart';
import '../models/update_user_response_model.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl(
    this.remoteDataSource,
  );

  @override
  Future<Either<FailureResponse, UserProfileResponse>> getUserProfile() async {
    final result = await remoteDataSource.getUserProfile();
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<FailureResponse, UpdateUserResponse>> updateUserProfile(
      UpdateUserEntity updateUserEntity) async {
    final result = await remoteDataSource.updateUserProfile(updateUserEntity);
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<FailureResponse, CoachesResponse>> getAllCoaches() async {
    final result = await remoteDataSource.getAllCoaches();
    return result.fold(
      (l) => Left(l),
      (r) => Right(r),
    );
  }
}

import 'package:dartz/dartz.dart';

import '../../data/models/coaches_response_model.dart';
import '../../data/models/failure_response_model.dart';
import '../../data/models/profile_response_model.dart';
import '../../data/models/update_user_response_model.dart';
import '../entites/update_user_entity.dart';

abstract class UserRepository {
  Future<Either<FailureResponse, UserProfileResponse>> getUserProfile();
  Future<Either<FailureResponse, UpdateUserResponse>> updateUserProfile(
      UpdateUserEntity updateUserEntity);
  Future<Either<FailureResponse, CoachesResponse>> getAllCoaches();
}

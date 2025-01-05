import 'package:dartz/dartz.dart';

import '../../data/models/failure_response_model.dart';
import '../../data/models/update_user_response_model.dart';
import '../entites/update_user_entity.dart';
import '../repositories/user_repository.dart';

class UpdateUserProfileUseCase {
  final UserRepository userRepository;
  UpdateUserProfileUseCase(this.userRepository);
  Future<Either<FailureResponse, UpdateUserResponse>> call(
      UpdateUserEntity updateUserEntity) async {
    return userRepository.updateUserProfile(updateUserEntity);
  }
}

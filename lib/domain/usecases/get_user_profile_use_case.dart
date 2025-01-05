import 'package:dartz/dartz.dart';
import 'package:sportapp/data/models/profile_response_model.dart';

import '../../data/models/failure_response_model.dart';
import '../repositories/user_repository.dart';

class GetUserProfileUseCase {
  final UserRepository userRepository;
  GetUserProfileUseCase(this.userRepository);
  Future<Either<FailureResponse, UserProfileResponse>> call() async {
    return userRepository.getUserProfile();
  }
}

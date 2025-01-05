import 'package:dartz/dartz.dart';
import 'package:sportapp/domain/repositories/auth_repository.dart';

import '../../data/models/failure_response_model.dart';
import '../../data/models/register_user_response_model.dart';
import '../../data/models/user_register_request_model.dart';

class RegisterUseCase {
  final AuthRepository authRepository;
  RegisterUseCase(this.authRepository);
  Future<Either<FailureResponse, RegisterUserResponse>> call(
      UserRegisterRequestModel newUser) async {
    return authRepository.register(newUser);
  }
}

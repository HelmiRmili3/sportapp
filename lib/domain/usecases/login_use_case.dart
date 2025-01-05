import 'package:dartz/dartz.dart';

import '../../data/models/failure_response_model.dart';
import '../../data/models/login_response_model.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);
  Future<Either<FailureResponse, LoginResponse>> call(
      String email, String password) async {
    return repository.login(email, password);
  }
}

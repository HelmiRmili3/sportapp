import 'package:dartz/dartz.dart';

import '../../data/models/failure_response_model.dart';
import '../../data/models/logout_response_model.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;
  LogoutUseCase(this.repository);
  Future<Either<FailureResponse, LogoutResponse>> call(
    String userId,
  ) async {
    return repository.logout(userId);
  }
}

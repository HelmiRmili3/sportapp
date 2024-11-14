import 'package:dartz/dartz.dart';
import 'package:sportapp/domain/repositories/auth_repository.dart';
import 'package:sportapp/shared/errors/failure.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> call(int userId) async {
    return repository.logout(userId);
  }
}

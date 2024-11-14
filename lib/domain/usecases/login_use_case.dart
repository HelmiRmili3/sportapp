import 'package:dartz/dartz.dart';
import 'package:sportapp/domain/repositories/auth_repository.dart';
import 'package:sportapp/shared/errors/failure.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> call(
      String email, String password) async {
    return repository.login(email, password);
  }
}

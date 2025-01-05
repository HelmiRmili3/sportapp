import 'package:dartz/dartz.dart';
import 'package:sportapp/data/models/coaches_response_model.dart';
import 'package:sportapp/domain/repositories/user_repository.dart';

import '../../data/models/failure_response_model.dart';

class GetAllCoachsUseCase {
  final UserRepository repository;

  GetAllCoachsUseCase(this.repository);
  Future<Either<FailureResponse, CoachesResponse>> call() async {
    return repository.getAllCoaches();
  }
}

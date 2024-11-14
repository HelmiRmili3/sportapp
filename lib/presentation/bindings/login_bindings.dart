import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sportapp/data/datasources/remote_data_source.dart';
import 'package:sportapp/data/repositories/auth_repository_impl.dart';
import 'package:sportapp/domain/usecases/login_use_case.dart';
import 'package:sportapp/presentation/controllers/login_contoller.dart';

import '../../domain/repositories/auth_repository.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    // Bind http.Client
    Get.lazyPut<http.Client>(() => http.Client());
    final client = Get.find<http.Client>();
    const jwtToken = 'your_token_here';

    // Bind RemoteDataSource
    Get.lazyPut<RemoteDataSource>(
        () => RemoteDataSourceImpl(client: client, jwtToken: jwtToken));

    // Bind AuthRepository
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(remoteDataSource: Get.find()));

    // Bind the LoginUseCase
    Get.lazyPut(() => LoginUseCase(Get.find()));

    // Bind the LoginController
    Get.lazyPut<LoginContoller>(
      () => LoginContoller(loginUseCase: Get.find()),
    );
  }
}

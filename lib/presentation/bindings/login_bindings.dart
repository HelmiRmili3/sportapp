// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:sportapp/data/datasources/remote_data_source.dart';
// import 'package:sportapp/data/repositories/auth_repository_impl.dart';
// import 'package:sportapp/domain/usecases/login_use_case.dart';
// import 'package:sportapp/presentation/controllers/login_controller.dart';

// import '../../domain/repositories/auth_repository.dart';
// import '../../domain/usecases/logout_use_case.dart';

// class LoginBindings extends Bindings {
//   @override
//   void dependencies() {
//     // Bind RemoteDataSource
//     Get.lazyPut<RemoteDataSource>(
//         () => RemoteDataSourceImpl(client: http.Client()));

//     // Bind AuthRepository
//     Get.lazyPut<AuthRepository>(
//         () => AuthRepositoryImpl(remoteDataSource: Get.find()));

//     // Bind the LoginUseCase
//     Get.lazyPut(() => LoginUseCase(Get.find()));
//     Get.lazyPut(() => LogoutUseCase(Get.find()));
//     // Bind the LoginController
//     Get.lazyPut<LoginController>(
//       () => LoginController(
//         loginUseCase: Get.find(),
//         logoutUseCase: Get.find(),
//       ),
//     );
//   }
// }

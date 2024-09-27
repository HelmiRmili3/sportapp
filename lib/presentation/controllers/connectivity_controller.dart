import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class ConnectivityController extends GetxController {
  RxBool isOffline = true.obs;
  bool get isOfflineValue => isOffline.value;
  @override
  void onInit() {
    super.onInit();
    _checkConnectivity();
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _setConnectionStatus(result);
    });
  }

  Future<void> _checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _setConnectionStatus(connectivityResult);
  }

  void _setConnectionStatus(List<ConnectivityResult> result) {
    if (result.first == ConnectivityResult.none) {
      isOffline.value = true;
    } else {
      isOffline.value = false;
    }
  }
}

import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs; // Observable index

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

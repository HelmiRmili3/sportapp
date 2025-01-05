import 'package:get/get.dart';
import '../../data/models/page_view_model.dart';
import '../../services/api_service.dart';

class HomeController extends GetxController {
  ApiService apiService = ApiService();

  RxBool isSliderone = false.obs;

  RxList<PageViewModel> pageViewModel = [
    PageViewModel(lat: "35.821430", long: "10.634422"), // SOUSE
    PageViewModel(lat: "35.1667", long: "8.83333"), //SFAX
    PageViewModel(lat: "36.7975", long: " 10.1658"), //TUNIS
    PageViewModel(lat: "33.8814", long: "10.0983"), // GABES
  ].obs;
  final RxDouble _lat = 35.821430.obs;
  final RxDouble _long = 10.634422.obs;

  double get lat => _lat.value;
  double get long => _long.value;

  RxInt currentIndex = 0.obs;
  RxBool showList = false.obs;

  // Methods to update values
  void updateSlider() {
    isSliderone.value = !isSliderone.value;
  }

  void setInitialPoint() {
    _lat.value = double.parse(pageViewModel[0].lat.toString());
    _long.value = double.parse(pageViewModel[0].long.toString());
  }

  void changeLatAdnLong({String? latitude, String? longitude}) {
    _lat.value = double.parse(latitude.toString());
    _long.value = double.parse(longitude.toString());
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void updateList() {
    showList.value = true;
  }
}

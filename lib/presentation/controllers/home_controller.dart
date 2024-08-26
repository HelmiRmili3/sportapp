import 'package:get/get.dart';
import '../../data/models/page_view_model.dart';
import '../../services/api_service.dart';

class HomeController extends GetxController {
  ApiService apiService = ApiService();

  // Observable variables
  RxBool isSliderone = false.obs;

  RxList<PageViewModel> pageViewModel = [
    PageViewModel(lat: "33.684422", long: "73.047882"),
    PageViewModel(lat: "33.694138", long: "73.071312"),
    PageViewModel(lat: "34.015137", long: "71.524918"),
    PageViewModel(lat: "31.520370", long: "74.358749"),
  ].obs;

  // Use RxDouble for reactive latitude and longitude
  RxDouble _lat = 31.520370.obs;
  RxDouble _long = 74.358749.obs;

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

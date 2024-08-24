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
  RxDouble lat = 31.520370.obs;
  RxDouble long = 74.358749.obs;

  RxInt currentIndex = 0.obs;
  RxBool showList = false.obs;

  // Methods to update values
  void updateSlider() {
    isSliderone.value = !isSliderone.value;
  }

  void setInitialPoint() {
    lat.value = double.parse(pageViewModel[0].lat.toString());
    long.value = double.parse(pageViewModel[0].long.toString());
  }

  void changeLatAdnLong({String? latitude, String? longitude}) {
    lat.value = double.parse(latitude.toString());
    long.value = double.parse(longitude.toString());
  }

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void updateList() {
    showList.value = true;
  }
}

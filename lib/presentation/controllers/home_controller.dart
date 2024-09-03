import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../data/models/page_view_model.dart';
import '../../data/models/room_molel.dart';
import '../../services/api_service.dart';

class HomeController extends GetxController {
  ApiService apiService = ApiService();
  // GoogleMapController? mapController;
  // String searchText = '';
  // String googleApikey = "YOUR_GOOGLE_API_KEY";

  // String startLocationDescription = "Destination Location";
  // List<String> allCities = [
  //   'Paris',
  //   'Marseille',
  //   'Lyon',
  //   'Toulouse',
  //   'Bordeaux',
  //   'Nice',
  //   // ... Add more cities
  // ];

  // List<String> get filteredCities => allCities
  //     .where((city) => city.toLowerCase().contains(searchText.toLowerCase()))
  //     .toList();

  // // Observable variables
  RxBool isSliderone = false.obs;

  RxList<PageViewModel> pageViewModel = [
    PageViewModel(lat: "35.821430", long: "10.634422"), // SOUSE
    PageViewModel(lat: "35.1667", long: "8.83333"), //SFAX
    PageViewModel(lat: "36.7975", long: " 10.1658"), //TUNIS
    PageViewModel(lat: "33.8814", long: "10.0983"), // GABES
  ].obs;

  // List<RoomModel> model = [
  //   RoomModel(image: 'assets/Images/pro.svg', name: 'Pro'),
  //   RoomModel(image: 'assets/Images/apptitide.svg', name: 'Aptitude'),
  //   RoomModel(image: 'assets/Images/cardio.svg', name: 'Cardio'),
  //   RoomModel(image: 'assets/Images/aerobique.svg', name: 'Aérobique'),
  // ];
  // Use RxDouble for reactive latitude and longitude
  RxDouble _lat = 35.821430.obs;
  RxDouble _long = 10.634422.obs;

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

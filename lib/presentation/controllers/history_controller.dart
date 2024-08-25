import 'package:get/state_manager.dart';

import '../../services/api_service.dart';

class HistoryController extends GetxController {
  ApiService apiService = ApiService();

  List<String> categoryList = [
    "Speech to text",
    "Text to translation",
    "Scan QR code",
    "Change image extension",
    "Change video extension",
    "PDF to word",
    "Word to PDF",
    "Image to PDF",
    "Image to text",
  ];
}

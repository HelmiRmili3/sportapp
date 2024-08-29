import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class BonusController extends GetxController {
  void inviteFriend() {
    Share.share('Download the app using this link: https://example.com');
  }
}

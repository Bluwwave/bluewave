import '../controller/match_profile_page_controller.dart';
import 'package:get/get.dart';

class MatchProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MatchProfilePageController());
  }
}

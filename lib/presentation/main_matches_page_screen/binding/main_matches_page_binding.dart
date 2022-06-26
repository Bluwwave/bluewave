import '../controller/main_matches_page_controller.dart';
import 'package:get/get.dart';

class MainMatchesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainMatchesPageController());
  }
}

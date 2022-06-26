import '../controller/profile_changing_page_controller.dart';
import 'package:get/get.dart';

class ProfileChangingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileChangingPageController());
  }
}

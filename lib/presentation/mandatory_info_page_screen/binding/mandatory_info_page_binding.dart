import '../controller/mandatory_info_page_controller.dart';
import 'package:get/get.dart';

class MandatoryInfoPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MandatoryInfoPageController());
  }
}

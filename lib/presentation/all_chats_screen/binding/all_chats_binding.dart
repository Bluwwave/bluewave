import '../controller/all_chats_controller.dart';
import 'package:get/get.dart';

class AllChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllChatsController());
  }
}

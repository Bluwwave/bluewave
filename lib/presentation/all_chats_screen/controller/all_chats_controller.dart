import '/core/app_export.dart';
import 'package:bluewave/presentation/all_chats_screen/models/all_chats_model.dart';

class AllChatsController extends GetxController with StateMixin<dynamic> {
  Rx<AllChatsModel> allChatsModelObj = AllChatsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

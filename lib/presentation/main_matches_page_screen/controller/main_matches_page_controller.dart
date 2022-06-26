import '/core/app_export.dart';
import 'package:bluewave/presentation/main_matches_page_screen/models/main_matches_page_model.dart';

class MainMatchesPageController extends GetxController
    with StateMixin<dynamic> {
  Rx<MainMatchesPageModel> mainMatchesPageModelObj = MainMatchesPageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

import '/core/app_export.dart';
import 'package:bluewave/presentation/match_profile_page_screen/models/match_profile_page_model.dart';

class MatchProfilePageController extends GetxController
    with StateMixin<dynamic> {
  Rx<MatchProfilePageModel> matchProfilePageModelObj =
      MatchProfilePageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

import '/core/app_export.dart';
import 'package:bluewave/presentation/mandatory_info_page_screen/models/mandatory_info_page_model.dart';
import 'package:flutter/material.dart';

class MandatoryInfoPageController extends GetxController
    with StateMixin<dynamic> {
  TextEditingController emailController = TextEditingController();

  Rx<MandatoryInfoPageModel> mandatoryInfoPageModelObj =
      MandatoryInfoPageModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}

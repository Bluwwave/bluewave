import '/core/app_export.dart';
import 'package:bluewave/presentation/chat_with_match_screen/models/chat_with_match_model.dart';
import 'package:flutter/material.dart';

class ChatWithMatchController extends GetxController with StateMixin<dynamic> {
  TextEditingController group15Controller = TextEditingController();

  Rx<ChatWithMatchModel> chatWithMatchModelObj = ChatWithMatchModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    group15Controller.dispose();
  }
}

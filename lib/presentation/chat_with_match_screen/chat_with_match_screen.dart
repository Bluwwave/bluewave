import 'controller/chat_with_match_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class ChatWithMatchScreen extends GetWidget<ChatWithMatchController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Container(
                        decoration:
                            BoxDecoration(color: ColorConstant.whiteA700),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: ColorConstant.deepOrange300),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        GestureDetector(
                                            onTap: () {
                                              onTapMyMatch4();
                                            },
                                            child: Container(
                                                height: getSize(35.00),
                                                width: getSize(35.00),
                                                margin: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                        13.00),
                                                    top: getVerticalSize(7.00),
                                                    bottom:
                                                        getVerticalSize(8.00)),
                                                decoration: BoxDecoration(
                                                    color: ColorConstant
                                                        .bluegray100,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                17.50))))),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtMatchsname();
                                            },
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                        13.00),
                                                    top: getVerticalSize(16.00),
                                                    right: getHorizontalSize(
                                                        199.00),
                                                    bottom:
                                                        getVerticalSize(16.00)),
                                                child: Text(
                                                    "lbl_match_s_name".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .textstyleinterregular15
                                                        .copyWith(
                                                            fontSize:
                                                                getFontSize(
                                                                    15)))))
                                      ])),
                              Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      top: getVerticalSize(700.00)),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.lightBlueA100),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: getHorizontalSize(10.00),
                                                top: getVerticalSize(5.00),
                                                right: getHorizontalSize(10.00),
                                                bottom: getVerticalSize(5.00)),
                                            child: Container(
                                                height: getVerticalSize(40.00),
                                                width:
                                                    getHorizontalSize(330.00),
                                                child: TextFormField(
                                                    focusNode: FocusNode(),
                                                    controller: controller
                                                        .group15Controller,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "lbl_message".tr,
                                                        hintStyle: AppStyle
                                                            .textstyleasapromanregular12
                                                            .copyWith(
                                                                fontSize:
                                                                    getFontSize(
                                                                        12.0),
                                                                color: ColorConstant
                                                                    .black90066),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(getHorizontalSize(10.00)),
                                                                borderSide: BorderSide(color: ColorConstant.black900, width: 1)),
                                                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(getHorizontalSize(10.00)), borderSide: BorderSide(color: ColorConstant.black900, width: 1)),
                                                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(getHorizontalSize(10.00)), borderSide: BorderSide(color: ColorConstant.black900, width: 1)),
                                                        filled: true,
                                                        fillColor: ColorConstant.whiteA700,
                                                        isDense: true,
                                                        contentPadding: EdgeInsets.only(left: getHorizontalSize(19.00), top: getVerticalSize(11.00), right: getHorizontalSize(30.00), bottom: getVerticalSize(11.00))),
                                                    style: TextStyle(color: ColorConstant.black90066, fontSize: getFontSize(12.0), fontFamily: 'Asap', fontWeight: FontWeight.w400))))
                                      ]))
                            ]))))));
  }

  onTapMyMatch4() {
    Get.toNamed(AppRoutes.matchProfilePageScreen);
  }

  onTapTxtMatchsname() {
    Get.toNamed(AppRoutes.matchProfilePageScreen);
  }
}

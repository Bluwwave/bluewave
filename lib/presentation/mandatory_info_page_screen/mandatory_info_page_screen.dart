import 'controller/mandatory_info_page_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class MandatoryInfoPageScreen extends GetWidget<MandatoryInfoPageController> {
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
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: ColorConstant.deepOrange300),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                        16.00),
                                                    top: getVerticalSize(13.00),
                                                    right: getHorizontalSize(
                                                        16.00),
                                                    bottom:
                                                        getVerticalSize(19.00)),
                                                child: Text("lbl_sign_up".tr,
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
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: getVerticalSize(71.00)),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left:
                                                              getHorizontalSize(
                                                                  16.00)),
                                                      child: Text(
                                                          "lbl_first_name".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .textstyleinterregular152
                                                              .copyWith(
                                                                  fontSize:
                                                                      getFontSize(
                                                                          15)))),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right:
                                                              getHorizontalSize(
                                                                  68.00)),
                                                      child: Text(
                                                          "lbl_last_name".tr,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.left,
                                                          style: AppStyle
                                                              .textstyleinterregular152
                                                              .copyWith(
                                                                  fontSize:
                                                                      getFontSize(
                                                                          15))))
                                                ])),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                      height: getVerticalSize(
                                                          28.00),
                                                      width: getHorizontalSize(
                                                          140.00),
                                                      margin: EdgeInsets.only(
                                                          left:
                                                              getHorizontalSize(
                                                                  16.00)),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .deepOrange50,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      2.00)),
                                                          border: Border.all(
                                                              color: ColorConstant
                                                                  .bluegray400,
                                                              width:
                                                                  getHorizontalSize(
                                                                      1.00)))),
                                                  Container(
                                                      height: getVerticalSize(
                                                          28.00),
                                                      width: getHorizontalSize(
                                                          140.00),
                                                      margin: EdgeInsets.only(
                                                          right:
                                                              getHorizontalSize(
                                                                  16.00)),
                                                      decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .deepOrange50,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  getHorizontalSize(
                                                                      2.00)),
                                                          border: Border.all(
                                                              color: ColorConstant
                                                                  .bluegray400,
                                                              width:
                                                                  getHorizontalSize(
                                                                      1.00))))
                                                ])),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                        16.00),
                                                    top: getVerticalSize(55.00),
                                                    right: getHorizontalSize(
                                                        16.00)),
                                                child: Text("lbl_email".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .textstyleinterregular152
                                                        .copyWith(
                                                            fontSize:
                                                                getFontSize(
                                                                    15))))),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: getHorizontalSize(10.00),
                                                top: getVerticalSize(2.00),
                                                right:
                                                    getHorizontalSize(10.00)),
                                            child: Container(
                                                height: getVerticalSize(28.00),
                                                width:
                                                    getHorizontalSize(328.00),
                                                child: TextFormField(
                                                    focusNode: FocusNode(),
                                                    controller: controller
                                                        .emailController,
                                                    decoration: InputDecoration(
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    getHorizontalSize(
                                                                        2.00)),
                                                            borderSide: BorderSide(
                                                                color: ColorConstant
                                                                    .bluegray400,
                                                                width: 1)),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(getHorizontalSize(2.00)),
                                                            borderSide: BorderSide(color: ColorConstant.bluegray400, width: 1)),
                                                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(getHorizontalSize(2.00)), borderSide: BorderSide(color: ColorConstant.bluegray400, width: 1)),
                                                        filled: true,
                                                        fillColor: ColorConstant.deepOrange50,
                                                        isDense: true)))),
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: GestureDetector(
                                                onTap: () {
                                                  onTapTxtNext();
                                                },
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: getHorizontalSize(
                                                            25.00),
                                                        top: getVerticalSize(
                                                            455.00),
                                                        right:
                                                            getHorizontalSize(
                                                                25.00)),
                                                    child: Text("lbl_next".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .textstyleinterregular20
                                                            .copyWith(
                                                                fontSize:
                                                                    getFontSize(
                                                                        20))))))
                                      ])),
                              Container(
                                  height: getVerticalSize(50.00),
                                  width: size.width,
                                  margin: EdgeInsets.only(
                                      top: getVerticalSize(1.00)),
                                  decoration: BoxDecoration(
                                      color: ColorConstant.lightBlueA100))
                            ]))))));
  }

  onTapTxtNext() {
    Get.toNamed(AppRoutes.profileChangingPageScreen);
  }
}

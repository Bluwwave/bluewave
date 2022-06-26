import 'controller/profile_changing_page_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfileChangingPageScreen
    extends GetWidget<ProfileChangingPageController> {
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
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
                                                            17.00),
                                                        top: getVerticalSize(
                                                            16.00),
                                                        right:
                                                            getHorizontalSize(
                                                                17.00),
                                                        bottom: getVerticalSize(
                                                            16.00)),
                                                    child: Text(
                                                        "lbl_my_profile".tr,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: AppStyle
                                                            .textstyleinterregular15
                                                            .copyWith(
                                                                fontSize:
                                                                    getFontSize(
                                                                        15)))))
                                          ]))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: getHorizontalSize(220.00),
                                      margin: EdgeInsets.only(
                                          left: getHorizontalSize(17.00),
                                          top: getVerticalSize(18.00),
                                          right: getHorizontalSize(17.00)),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.deepOrange50,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(2.00)),
                                          border: Border.all(
                                              color: ColorConstant.bluegray400,
                                              width: getHorizontalSize(1.00))),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                        10.00),
                                                    top: getVerticalSize(42.00),
                                                    right: getHorizontalSize(
                                                        10.00),
                                                    bottom:
                                                        getVerticalSize(90.00)),
                                                child: Text(
                                                    "lbl_profile_picture".tr,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle
                                                        .textstyleinterregular151
                                                        .copyWith(
                                                            fontSize:
                                                                getFontSize(
                                                                    15))))
                                          ]))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: getHorizontalSize(17.00),
                                          top: getVerticalSize(32.00),
                                          right: getHorizontalSize(17.00)),
                                      child: Text("lbl_hobbies".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstyleinterregular152
                                              .copyWith(
                                                  fontSize: getFontSize(15))))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      height: getVerticalSize(28.00),
                                      width: getHorizontalSize(327.00),
                                      margin: EdgeInsets.only(
                                          left: getHorizontalSize(17.00),
                                          right: getHorizontalSize(16.00)),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.deepOrange50,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(2.00)),
                                          border: Border.all(
                                              color: ColorConstant.bluegray400,
                                              width:
                                                  getHorizontalSize(1.00))))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: getHorizontalSize(17.00),
                                          top: getVerticalSize(32.00),
                                          right: getHorizontalSize(17.00)),
                                      child: Text("lbl_looking_for".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstyleinterregular152
                                              .copyWith(
                                                  fontSize: getFontSize(15))))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      height: getVerticalSize(28.00),
                                      width: getHorizontalSize(199.00),
                                      margin: EdgeInsets.only(
                                          left: getHorizontalSize(17.00),
                                          right: getHorizontalSize(17.00)),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.deepOrange50,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(2.00)),
                                          border: Border.all(
                                              color: ColorConstant.bluegray400,
                                              width:
                                                  getHorizontalSize(1.00))))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: getHorizontalSize(17.00),
                                          top: getVerticalSize(32.00),
                                          right: getHorizontalSize(17.00)),
                                      child: Text("lbl_about_you".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstyleinterregular152
                                              .copyWith(
                                                  fontSize: getFontSize(15))))),
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      height: getVerticalSize(80.00),
                                      width: getHorizontalSize(325.00),
                                      margin: EdgeInsets.only(
                                          left: getHorizontalSize(17.00),
                                          right: getHorizontalSize(17.00)),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.deepOrange50,
                                          borderRadius: BorderRadius.circular(
                                              getHorizontalSize(2.00)),
                                          border: Border.all(
                                              color: ColorConstant.bluegray400,
                                              width:
                                                  getHorizontalSize(1.00))))),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtSave();
                                      },
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              left: getHorizontalSize(28.00),
                                              top: getVerticalSize(221.00),
                                              right: getHorizontalSize(28.00)),
                                          child: Text("lbl_save".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .textstyleinterregular20
                                                  .copyWith(
                                                      fontSize:
                                                          getFontSize(20)))))),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      height: getVerticalSize(50.00),
                                      width: size.width,
                                      margin: EdgeInsets.only(
                                          top: getVerticalSize(1.00)),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.lightBlueA100)))
                            ]))))));
  }

  onTapTxtSave() {
    Get.toNamed(AppRoutes.mainMatchesPageScreen);
  }
}

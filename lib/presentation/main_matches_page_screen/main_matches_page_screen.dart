import 'controller/main_matches_page_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class MainMatchesPageScreen extends GetWidget<MainMatchesPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Column(children: [
              Expanded(
                  child: Container(
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
                                    Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .deepOrange300),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: getHorizontalSize(
                                                                        15.00),
                                                                    top: getVerticalSize(
                                                                        16.00),
                                                                    right: getHorizontalSize(
                                                                        15.00),
                                                                    bottom: getVerticalSize(
                                                                        16.00)),
                                                                child: Text(
                                                                    "lbl_matches"
                                                                        .tr,
                                                                    overflow: TextOverflow
                                                                        .ellipsis,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: AppStyle
                                                                        .textstyleinterregular15
                                                                        .copyWith(
                                                                            fontSize: getFontSize(15)))))
                                                      ]))),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left:
                                                      getHorizontalSize(10.00),
                                                  top: getVerticalSize(25.00),
                                                  right:
                                                      getHorizontalSize(10.00)),
                                              child: Text(
                                                  "lbl_today_s_match".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .textstyleinterregular201
                                                      .copyWith(
                                                          fontSize: getFontSize(
                                                              20)))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapEllipse1();
                                              },
                                              child: Container(
                                                  height: getSize(85.00),
                                                  width: getSize(85.00),
                                                  margin: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          10.00),
                                                      top: getVerticalSize(
                                                          15.00),
                                                      right: getHorizontalSize(
                                                          10.00)),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .bluegray100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  42.50))))),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left:
                                                      getHorizontalSize(10.00),
                                                  top: getVerticalSize(15.00),
                                                  right:
                                                      getHorizontalSize(10.00)),
                                              child: Text("lbl_name".tr,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .textstyleinterregular153
                                                      .copyWith(
                                                          fontSize: getFontSize(
                                                              15)))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          18.00),
                                                      top: getVerticalSize(
                                                          111.00),
                                                      right: getHorizontalSize(
                                                          18.00)),
                                                  child: Text(
                                                      "lbl_all_matches".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .textstyleinterregular154
                                                          .copyWith(
                                                              fontSize:
                                                                  getFontSize(
                                                                      15))))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapGroup10();
                                              },
                                              child: Container(
                                                  width: double.infinity,
                                                  margin: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          10.00),
                                                      top: getVerticalSize(
                                                          23.00),
                                                      right: getHorizontalSize(
                                                          10.00)),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  20.00)),
                                                      border: Border.all(
                                                          color: ColorConstant
                                                              .deepOrange300,
                                                          width:
                                                              getHorizontalSize(
                                                                  1.00))),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                                height: getSize(
                                                                    40.00),
                                                                width: getSize(
                                                                    40.00),
                                                                margin: EdgeInsets.only(
                                                                    left: getHorizontalSize(
                                                                        19.00),
                                                                    top: getVerticalSize(
                                                                        10.00),
                                                                    right: getHorizontalSize(
                                                                        19.00),
                                                                    bottom: getVerticalSize(
                                                                        10.00)),
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .bluegray100,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            getHorizontalSize(20.00)))))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapGroup9();
                                              },
                                              child: Container(
                                                  width: double.infinity,
                                                  margin: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          10.00),
                                                      top: getVerticalSize(
                                                          33.00),
                                                      right: getHorizontalSize(
                                                          10.00)),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  20.00)),
                                                      border: Border.all(
                                                          color: ColorConstant
                                                              .deepOrange300,
                                                          width: getHorizontalSize(
                                                              1.00))),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                                height: getSize(
                                                                    40.00),
                                                                width: getSize(
                                                                    40.00),
                                                                margin: EdgeInsets.only(
                                                                    left: getHorizontalSize(
                                                                        19.00),
                                                                    top: getVerticalSize(
                                                                        11.00),
                                                                    right: getHorizontalSize(
                                                                        19.00),
                                                                    bottom:
                                                                        getVerticalSize(
                                                                            9.00)),
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .bluegray100,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            getHorizontalSize(20.00)))))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapGroup8();
                                              },
                                              child: Container(
                                                  width: double.infinity,
                                                  margin: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          10.00),
                                                      top: getVerticalSize(
                                                          35.00),
                                                      right: getHorizontalSize(
                                                          10.00)),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .whiteA700,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  20.00)),
                                                      border: Border.all(
                                                          color: ColorConstant
                                                              .deepOrange300,
                                                          width:
                                                              getHorizontalSize(
                                                                  1.00))),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Container(
                                                                height: getSize(
                                                                    40.00),
                                                                width: getSize(
                                                                    40.00),
                                                                margin: EdgeInsets.only(
                                                                    left: getHorizontalSize(
                                                                        19.00),
                                                                    top: getVerticalSize(
                                                                        8.00),
                                                                    right: getHorizontalSize(
                                                                        19.00),
                                                                    bottom: getVerticalSize(
                                                                        12.00)),
                                                                decoration: BoxDecoration(
                                                                    color: ColorConstant
                                                                        .bluegray100,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            getHorizontalSize(20.00)))))
                                                      ])))
                                        ])
                                  ]))))),
              Container(
                  decoration: BoxDecoration(color: ColorConstant.lightBlueA100),
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: getVerticalSize(5.00),
                          bottom: getVerticalSize(5.00)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  onTapImgGroup1();
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top: getVerticalSize(1.00),
                                        bottom: getVerticalSize(2.00)),
                                    child: Image.asset(ImageConstant.imgGroup1,
                                        height: getVerticalSize(37.00),
                                        width: getHorizontalSize(36.00),
                                        fit: BoxFit.fill))),
                            Image.asset(ImageConstant.imgGroup6,
                                height: getVerticalSize(40.00),
                                width: getHorizontalSize(56.50),
                                fit: BoxFit.fill),
                            GestureDetector(
                                onTap: () {
                                  onTapImgImage6();
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(20.00)),
                                    child: Image.asset(ImageConstant.imgImage6,
                                        height: getSize(40.00),
                                        width: getSize(40.00),
                                        fit: BoxFit.fill)))
                          ])))
            ])));
  }

  onTapEllipse1() {
    Get.toNamed(AppRoutes.matchProfilePageScreen);
  }

  onTapGroup10() {
    Get.toNamed(AppRoutes.matchProfilePageScreen);
  }

  onTapGroup9() {
    Get.toNamed(AppRoutes.matchProfilePageScreen);
  }

  onTapGroup8() {
    Get.toNamed(AppRoutes.matchProfilePageScreen);
  }

  onTapImgGroup1() {
    Get.toNamed(AppRoutes.allChatsScreen);
  }

  onTapImgImage6() {
    Get.toNamed(AppRoutes.personalProfileScreen);
  }
}

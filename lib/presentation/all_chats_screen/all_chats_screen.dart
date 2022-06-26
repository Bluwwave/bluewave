import 'controller/all_chats_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class AllChatsScreen extends GetWidget<AllChatsController> {
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
                                                                    "lbl_chats"
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
                                          GestureDetector(
                                              onTap: () {
                                                onTapGroup20();
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
                                                onTapGroup19();
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
                                          Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(
                                                  left:
                                                      getHorizontalSize(10.00),
                                                  top: getVerticalSize(33.00),
                                                  right:
                                                      getHorizontalSize(10.00)),
                                              decoration: BoxDecoration(
                                                  color:
                                                      ColorConstant.whiteA700,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getHorizontalSize(
                                                              20.00)),
                                                  border:
                                                      Border.all(
                                                          color: ColorConstant
                                                              .deepOrange300,
                                                          width: getHorizontalSize(
                                                              1.00))),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Container(
                                                            height:
                                                                getSize(40.00),
                                                            width:
                                                                getSize(40.00),
                                                            margin: EdgeInsets.only(
                                                                left:
                                                                    getHorizontalSize(
                                                                        21.00),
                                                                top:
                                                                    getVerticalSize(
                                                                        10.00),
                                                                right:
                                                                    getHorizontalSize(
                                                                        21.00),
                                                                bottom:
                                                                    getVerticalSize(
                                                                        10.00)),
                                                            decoration: BoxDecoration(
                                                                color: ColorConstant
                                                                    .bluegray100,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            getHorizontalSize(20.00)))))
                                                  ]))
                                        ])
                                  ]))))),
              Container(
                  margin: EdgeInsets.only(right: getHorizontalSize(2.00)),
                  decoration: BoxDecoration(color: ColorConstant.lightBlueA100),
                  child: Container(
                      height: getVerticalSize(50.00),
                      width: getHorizontalSize(358.00),
                      child: Stack(alignment: Alignment.centerLeft, children: [
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: getVerticalSize(6.00),
                                    bottom: getVerticalSize(4.00)),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              bottom: getVerticalSize(3.00)),
                                          child: Image.asset(
                                              ImageConstant.imgGroup31,
                                              height: getVerticalSize(37.00),
                                              width: getHorizontalSize(36.00),
                                              fit: BoxFit.fill)),
                                      GestureDetector(
                                          onTap: () {
                                            onTapImgGroup4();
                                          },
                                          child: Image.asset(
                                              ImageConstant.imgGroup41,
                                              height: getVerticalSize(40.00),
                                              width: getHorizontalSize(56.50),
                                              fit: BoxFit.fill)),
                                      GestureDetector(
                                          onTap: () {
                                            onTapImgImage6();
                                          },
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(20.00)),
                                              child: Image.asset(
                                                  ImageConstant.imgImage62,
                                                  height: getSize(40.00),
                                                  width: getSize(40.00),
                                                  fit: BoxFit.fill)))
                                    ]))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                decoration: BoxDecoration(
                                    color: ColorConstant.lightBlueA100),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: getVerticalSize(6.00),
                                              bottom: getVerticalSize(7.00)),
                                          child: Image.asset(
                                              ImageConstant.imgGroup32,
                                              height: getVerticalSize(37.00),
                                              width: getHorizontalSize(36.00),
                                              fit: BoxFit.fill)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: getVerticalSize(6.00),
                                              bottom: getVerticalSize(4.00)),
                                          child: Image.asset(
                                              ImageConstant.imgGroup42,
                                              height: getVerticalSize(40.00),
                                              width: getHorizontalSize(56.50),
                                              fit: BoxFit.fill)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: getVerticalSize(6.00),
                                              bottom: getVerticalSize(4.00)),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      getHorizontalSize(20.00)),
                                              child: Image.asset(
                                                  ImageConstant.imgImage63,
                                                  height: getSize(40.00),
                                                  width: getSize(40.00),
                                                  fit: BoxFit.fill)))
                                    ])))
                      ])))
            ])));
  }

  onTapGroup20() {
    Get.toNamed(AppRoutes.chatWithMatchScreen);
  }

  onTapGroup19() {
    Get.toNamed(AppRoutes.chatWithMatchScreen);
  }

  onTapImgGroup4() {
    Get.toNamed(AppRoutes.mainMatchesPageScreen);
  }

  onTapImgImage6() {
    Get.toNamed(AppRoutes.personalProfileScreen);
  }
}

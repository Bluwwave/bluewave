import 'controller/match_profile_page_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class MatchProfilePageScreen extends GetWidget<MatchProfilePageController> {
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
                                                                    "msg_my_match_s_prof"
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
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          19.00),
                                                      top: getVerticalSize(
                                                          18.00),
                                                      right: getHorizontalSize(
                                                          19.00)),
                                                  child: Text("lbl_name".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .textstyleinterregular153
                                                          .copyWith(
                                                              fontSize:
                                                                  getFontSize(
                                                                      15))))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: getSize(140.00),
                                                  width: getSize(140.00),
                                                  margin: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          19.00),
                                                      top: getVerticalSize(
                                                          14.00),
                                                      right: getHorizontalSize(
                                                          19.00)),
                                                  decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .bluegray100,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getHorizontalSize(
                                                                  70.00))))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          19.00),
                                                      top: getVerticalSize(
                                                          37.00),
                                                      right: getHorizontalSize(
                                                          19.00)),
                                                  child: Text(
                                                      "lbl_about_match".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .textstyleinterregular153
                                                          .copyWith(
                                                              fontSize:
                                                                  getFontSize(
                                                                      15))))),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          19.00),
                                                      top: getVerticalSize(
                                                          37.00),
                                                      right: getHorizontalSize(
                                                          19.00)),
                                                  child: Text("lbl_hobbies".tr,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .textstyleinterregular153
                                                          .copyWith(
                                                              fontSize:
                                                                  getFontSize(
                                                                      15))))),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          19.00),
                                                      top: getVerticalSize(
                                                          334.00),
                                                      right: getHorizontalSize(
                                                          19.00)),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        onTapBtnChatwithname();
                                                      },
                                                      child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          height: getVerticalSize(
                                                              30.00),
                                                          width: getHorizontalSize(
                                                              162.00),
                                                          decoration: AppDecoration
                                                              .textstyleinterregular155,
                                                          child: Text(
                                                              "lbl_chat_with_name"
                                                                  .tr,
                                                              textAlign: TextAlign
                                                                  .center,
                                                              style: AppStyle
                                                                  .textstyleinterregular155
                                                                  .copyWith(
                                                                      fontSize:
                                                                          getFontSize(15)))))))
                                        ])
                                  ]))))),
              Container(
                  decoration: BoxDecoration(color: ColorConstant.lightBlueA100),
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: getVerticalSize(6.00),
                          bottom: getVerticalSize(4.00)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  onTapImgGroup3();
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: getVerticalSize(3.00)),
                                    child: Image.asset(ImageConstant.imgGroup3,
                                        height: getVerticalSize(37.00),
                                        width: getHorizontalSize(36.00),
                                        fit: BoxFit.fill))),
                            GestureDetector(
                                onTap: () {
                                  onTapImgGroup4();
                                },
                                child: Image.asset(ImageConstant.imgGroup4,
                                    height: getVerticalSize(40.00),
                                    width: getHorizontalSize(56.50),
                                    fit: BoxFit.fill)),
                            GestureDetector(
                                onTap: () {
                                  onTapImgImage6();
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(20.00)),
                                    child: Image.asset(ImageConstant.imgImage61,
                                        height: getSize(40.00),
                                        width: getSize(40.00),
                                        fit: BoxFit.fill)))
                          ])))
            ])));
  }

  onTapBtnChatwithname() {
    Get.toNamed(AppRoutes.chatWithMatchScreen);
  }

  onTapImgGroup3() {
    Get.toNamed(AppRoutes.allChatsScreen);
  }

  onTapImgGroup4() {
    Get.toNamed(AppRoutes.mainMatchesPageScreen);
  }

  onTapImgImage6() {
    Get.toNamed(AppRoutes.personalProfileScreen);
  }
}

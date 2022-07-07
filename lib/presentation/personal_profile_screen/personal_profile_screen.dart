import 'package:bluewave/presentation/login_page_screen/login_page_screen.dart';
import 'package:provider/provider.dart';

import '../login_page_screen/provider/google_provider.dart';
import 'controller/personal_profile_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class PersonalProfileScreen extends GetWidget<PersonalProfileController> {
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
                                                                .centerRight,
                                                            child:
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      onTapTxtEditprofile();
                                                                    },
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
                                                                            "lbl_edit_profile"
                                                                                .tr,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15))))))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          151.00),
                                                      top: getVerticalSize(
                                                          18.00),
                                                      right: getHorizontalSize(
                                                          151.00)),
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
                                              alignment: Alignment.centerRight,
                                              child: Container(
                                                  height: getSize(140.00),
                                                  width: getSize(140.00),
                                                  margin: EdgeInsets.only(
                                                      left: getHorizontalSize(
                                                          102.00),
                                                      top: getVerticalSize(
                                                          14.00),
                                                      right: getHorizontalSize(
                                                          102.00)),
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
                                                          15.00),
                                                      top: getVerticalSize(
                                                          37.00),
                                                      right: getHorizontalSize(
                                                          15.00)),
                                                  child: Text(
                                                      "msg_my_match_prefer".tr,
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
                                                          15.00),
                                                      top: getVerticalSize(
                                                          36.00),
                                                      right: getHorizontalSize(
                                                          15.00)),
                                                  child: Text(
                                                      "msg_my_personal_inf".tr,
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
                                              child: GestureDetector(
                                                  onTap: () {
                                                    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                                                    provider.logout().then((value){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));});
                                                  },
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: getHorizontalSize(
                                                              15.00),
                                                          top: getVerticalSize(
                                                              36.00),
                                                          right: getHorizontalSize(
                                                              15.00)),
                                                      child: Text(
                                                          "Log out".tr,
                                                          overflow:
                                                          TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: AppStyle
                                                              .textstyleinterregular153
                                                              .copyWith(
                                                              fontSize:
                                                              getFontSize(
                                                                  15)))))
                                          )
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
                                  onTapImgGroup2();
                                },
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        top: getVerticalSize(1.00),
                                        bottom: getVerticalSize(2.00)),
                                    child: Image.asset(ImageConstant.imgGroup2,
                                        height: getVerticalSize(37.00),
                                        width: getHorizontalSize(36.00),
                                        fit: BoxFit.fill))),
                            GestureDetector(
                                onTap: () {
                                  onTapImgGroup5();
                                },
                                child: Image.asset(ImageConstant.imgGroup5,
                                    height: getVerticalSize(40.00),
                                    width: getHorizontalSize(56.50),
                                    fit: BoxFit.fill)),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    getHorizontalSize(20.00)),
                                child: Image.asset(ImageConstant.imgImage64,
                                    height: getSize(40.00),
                                    width: getSize(40.00),
                                    fit: BoxFit.fill))
                          ])))
            ])));
  }

  header(){
    return Container(
      padding: EdgeInsets.only(
          left: getHorizontalSize(16.00),
          top: getVerticalSize(13.00),
          right: getHorizontalSize(16.00),
          bottom: getVerticalSize(19.00)),
      color: ColorConstant.deepOrange300,
      child: Text("Sign Up",
          overflow:
          TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15))
      ),
    );
  }

  onTapTxtEditprofile() {
    Get.toNamed(AppRoutes.profileChangingPageScreen);
  }

  onTapImgGroup2() {
    Get.toNamed(AppRoutes.allChatsScreen);
  }

  onTapImgGroup5() {
    Get.toNamed(AppRoutes.mainMatchesPageScreen);
  }
}

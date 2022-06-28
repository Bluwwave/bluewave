import 'package:bluewave/presentation/login_page_screen/models/login_page_model.dart';
import 'package:bluewave/presentation/login_page_screen/provider/google_provider.dart';
import 'package:bluewave/presentation/main_matches_page_screen/main_matches_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bluewave/data/api/api_client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // late LoginRequestModel requestModel;
  //
  // @override
  // void initState(){
  //   super.initState();
  //   requestModel = new LoginRequestModel();
  // }
  // @override
  // Widget build(BuildContext context){
  //   return buildLoginPage();
  // }

  late Future<LoginResponseModel> profile_page;

  Widget build(BuildContext context) => Scaffold(

    // body: StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
    //     //maybe create a response model and using it to check here?
    //     if (snapshot.connectionState == ConnectionState.waiting){
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasData){
    //       return MainMatchesPageScreen();
    //     } else if (snapshot.hasError){
    //       return Center(child: Text('Something Went Wrong!'));
    //     } else {
    //       return buildLoginPage();
    //     }
    //   },
    // )
    //
    // if (request)
  );

  buildLoginPage(){
    return  Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
            width: size.width,
            child: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                        color: ColorConstant.whiteA700,
                        border: Border.all(
                            color: ColorConstant.black900,
                            width: getHorizontalSize(1.00)),
                        boxShadow: [
                          BoxShadow(
                              color: ColorConstant.black9003f,
                              spreadRadius: getHorizontalSize(2.00),
                              blurRadius: getHorizontalSize(2.00),
                              offset: Offset(0, 4))
                        ]),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: getVerticalSize(300.00),
                              width: size.width,
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                            height: getVerticalSize(300.00),
                                            width:
                                            getHorizontalSize(360.00),
                                            child: SvgPicture.asset(
                                                ImageConstant.imgRectangle2,
                                                fit: BoxFit.fill))),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                            height: getVerticalSize(75.00),
                                            width:
                                            getHorizontalSize(128.00),
                                            margin: EdgeInsets.only(
                                                left: getHorizontalSize(
                                                    54.00),
                                                top: getVerticalSize(87.00),
                                                right: getHorizontalSize(
                                                    54.00),
                                                bottom:
                                                getVerticalSize(87.00)),
                                            child: Stack(
                                                alignment:
                                                Alignment.centerLeft,
                                                children: [
                                                  Align(
                                                      alignment:
                                                      Alignment.center,
                                                      child: Container(
                                                          height: getSize(
                                                              75.00),
                                                          width: getSize(
                                                              75.00),
                                                          margin: EdgeInsets.only(
                                                              left:
                                                              getHorizontalSize(
                                                                  27.00),
                                                              right:
                                                              getHorizontalSize(
                                                                  26.00)),
                                                          decoration: BoxDecoration(
                                                              color: ColorConstant
                                                                  .amber300,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  getHorizontalSize(37.50))))),
                                                  Align(
                                                      alignment: Alignment
                                                          .centerLeft,
                                                      child: Padding(
                                                          padding: EdgeInsets.only(
                                                              top: getVerticalSize(
                                                                  20.00),
                                                              bottom:
                                                              getVerticalSize(
                                                                  20.00)),
                                                          child: Text(
                                                              "lbl_bluewave"
                                                                  .tr,
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              textAlign:
                                                              TextAlign
                                                                  .left,
                                                              style: AppStyle
                                                                  .textstyleinterregular28
                                                                  .copyWith(
                                                                  fontSize:
                                                                  getFontSize(28)))))
                                                ])))
                                  ])),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: getVerticalSize(39.65),
                                  width: getHorizontalSize(273.40),
                                  margin: EdgeInsets.only(
                                      left: getHorizontalSize(43.00),
                                      top: getVerticalSize(14.00),
                                      right: getHorizontalSize(43.00)),
                                  child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      margin: EdgeInsets.all(0),
                                      color: ColorConstant.red600,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              getHorizontalSize(5.00))),
                                      child: Stack(
                                          alignment: Alignment.centerRight,
                                          children: [
                                            Align(
                                                alignment:
                                                Alignment.center,
                                                child: GestureDetector(
                                                    onTap: (){
                                                      onTapTxtLoginwithgoog();
                                                    },
                                                    child: Padding(
                                                        padding: EdgeInsets.only(
                                                            left: getHorizontalSize(
                                                                42.40),
                                                            top: getVerticalSize(
                                                                11.00),
                                                            right:
                                                            getHorizontalSize(
                                                                42.40),
                                                            bottom:
                                                            getVerticalSize(
                                                                11.00)),
                                                        child: Text("log in with google",
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            style: AppStyle
                                                                .textstyleinterregular15
                                                                .copyWith(
                                                                fontSize:
                                                                getFontSize(15)))))),
                                            Align(
                                                alignment:
                                                Alignment.centerLeft,
                                                child: Container(
                                                    height: getSize(32.00),
                                                    width: getSize(32.00),
                                                    margin: EdgeInsets.only(
                                                        left:
                                                        getHorizontalSize(
                                                            26.40),
                                                        top:
                                                        getVerticalSize(
                                                            4.00),
                                                        right:
                                                        getHorizontalSize(
                                                            26.40),
                                                        bottom:
                                                        getVerticalSize(
                                                            3.65)),
                                                    child: Card(
                                                        clipBehavior:
                                                        Clip.antiAlias,
                                                        elevation: 0,
                                                        margin: EdgeInsets
                                                            .all(0),
                                                        color: ColorConstant
                                                            .whiteA700,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(
                                                                getHorizontalSize(
                                                                    16.00))),
                                                        child: Stack(
                                                            children: [
                                                              Align(
                                                                  alignment:
                                                                  Alignment
                                                                      .center,
                                                                  child: Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left: getHorizontalSize(
                                                                              3.00),
                                                                          top: getVerticalSize(
                                                                              3.00),
                                                                          right: getHorizontalSize(
                                                                              3.00),
                                                                          bottom: getVerticalSize(
                                                                              2.00)),
                                                                      child: Image.asset(
                                                                          ImageConstant.googleIcon,
                                                                          height: getVerticalSize(27.00),
                                                                          width: getHorizontalSize(26.00),
                                                                          fit: BoxFit.fill)))
                                                            ]))))
                                          ])))),
                          Container(
                              height: getVerticalSize(371.00),
                              width: size.width,
                              margin: EdgeInsets.only(
                                  top: getVerticalSize(75.35)),
                              child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                top:
                                                getVerticalSize(10.00)),
                                            child: Image.asset(
                                                ImageConstant.imgVector1,
                                                height:
                                                getVerticalSize(226.00),
                                                width: getHorizontalSize(
                                                    360.00),
                                                fit: BoxFit.fill))),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Image.asset(
                                            ImageConstant.imgVector2,
                                            height: getVerticalSize(371.00),
                                            width:
                                            getHorizontalSize(360.00),
                                            fit: BoxFit.fill))
                                  ]))
                        ])))));
  }

  onTapTxtLoginwithgoog() {
     // Get.toNamed(AppRoutes.mandatoryInfoPageScreen);
    // controller.login();
    // requestModel.email =
    //requestModel.email = provider.user.email;
    // print(login(requestModel));
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.login();
    profile_page = APIService().login(UserModel(email: provider.user.email));
  }
}



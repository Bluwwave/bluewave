
import 'package:bluewave/presentation/match_profile_page_screen/match_profile_page_screen.dart';

import 'controller/main_matches_page_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class MainMatchesPageScreen extends StatefulWidget {
  String email;
  MainMatchesPageScreen(this.email);

  @override
  _MainMatchesPageState createState() => _MainMatchesPageState();
}

class _MainMatchesPageState extends State<MainMatchesPageScreen>{

  @override
  void initState(){
    super.initState();
    print(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return buildMainMatchesPage();
  }

  buildMainMatchesPage(){
    return Scaffold(
      backgroundColor: ColorConstant.deepOrange50,
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        todaysMatchText(),

                        matchProfilePic(),

                        matchName(),

                        allMatchesText(),

                        allMatchesDisplay(),
                      ],
                    ),
                  ),
                ]
            )
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: myNavBar(),
      ),
    );
  }

  appBar(){
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstant.deepOrange300,
      title: Text("My Profile",style: AppStyle.textstyleinterregular15.copyWith(
          fontSize: getFontSize(15))),
    );
  }

  Container myNavBar() {
    return Container(
      height: 50,
      color: ColorConstant.lightBlueA100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // All Chats icon
          FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.allChatsScreen, arguments: widget.email);
            },
            child: Icon(
              Icons.sms_outlined, color: ColorConstant.whiteA700, size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
          // Match Page icon
          FloatingActionButton(
            onPressed: () {
              Get.toNamed(
                  AppRoutes.mainMatchesPageScreen, arguments: widget.email);
            },
            child: Icon(
              Icons.home_outlined, color: ColorConstant.whiteA700, size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
          // Profile page icon
          FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.personalProfileScreen, arguments: widget.email);
            },
            child: Icon(
              Icons.person_outline, color: ColorConstant.whiteA700, size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
        ],
      ),
    );
  }

  todaysMatchText(){
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 15),
      child: Text(
        "Today's Match",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppStyle
              .textstyleinterregular153
              .copyWith(
              fontSize:
              getFontSize(25))
      )
    );
  }

  matchProfilePic(){
    return GestureDetector(
      onTap:(){
        Get.toNamed(AppRoutes.matchProfilePageScreen, arguments: widget.email);
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            CircleAvatar(
              radius: 50,
              // backgroundImage:
              // profilePic != null ? profilePic!.image : null,
              // backgroundColor: profilePic == null ? ColorConstant.deepOrange300 : null,
              backgroundColor: ColorConstant.deepOrange300,
            ),
          ]
      )
    );
  }

  matchName(){
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
          "Match Name",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppStyle
              .textstyleinterregular153
              .copyWith(
              fontSize:
              getFontSize(15))
      ),
    );
  }

  allMatchesText() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
          "All Matches",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle
              .textstyleinterregular153
              .copyWith(
              fontSize:
              getFontSize(15))
      ),
    );
  }

  allMatchesDisplay() {
    return GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.matchProfilePageScreen, arguments: widget.email);
        },
        child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                left: 10, top: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: ColorConstant.deepOrange300, width: 1)),
            child: Column(
                mainAxisSize:
                    MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
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
                ])));
  }
}
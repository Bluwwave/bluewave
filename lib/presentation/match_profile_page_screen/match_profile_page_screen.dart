import 'dart:convert';

import 'package:bluewave/presentation/personal_profile_screen/models/personal_profile_model.dart';
import 'package:flutter_tags/flutter_tags.dart';

import '../../data/api/api_client.dart';
import 'controller/match_profile_page_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class MatchProfilePageScreen extends StatelessWidget {
  final String email; //user email
  final String matchEmail; //match's email
  MatchProfilePageScreen(this.email, this.matchEmail);

  late PersonalProfileModel match;
  Image? matchProfilePic;
  late List<String> hobbies;


  Future<PersonalProfileModel> getMatchProfile() async{
    return await APIService().getUserProfile(matchEmail);
  }

  getHobbies(PersonalProfileModel user){
    hobbies = [];
    List<String> hobbiesChoices = user.hobbiesChoices;
    List<int>? chosenHobbies = user.chosenHobbies;
    if (chosenHobbies != null){
      print("chosenHobbies: " + chosenHobbies.toString());
      print("hobbiesChoices: " + hobbiesChoices.toString());
      for (int index in chosenHobbies){
        print(index);
        hobbies.add(hobbiesChoices[index]);
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: FutureBuilder(
          future: getMatchProfile(),
          builder: (BuildContext context, AsyncSnapshot<PersonalProfileModel> snapshot){
            print("hello from match profile page");
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }  else if (snapshot.hasError) {
              print("profile page something went wrong");
              return Center(child: Text('Something Went Wrong!'));
            } else if (snapshot.hasData){
              match = snapshot.data!;
              print("match Profile " + match.toString());
              match.profilePic != null ? matchProfilePic = imageDecode(match.profilePic!) : null;
              getHobbies(match);
              return buildProfilePage();
            }
            print("ERROR: No data for choices in profileChangingPage");
            return MatchProfilePageScreen(email, matchEmail);
          },
        )
    );
  }


  buildProfilePage() {
    return Scaffold(
      backgroundColor: ColorConstant.backGroundColor,
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
                        // userName(),

                        profilePic(),

                        userName(),

                        aboutYouText(),

                        hobbyTags(),
                      ],
                    ),
                  ),

                  // logOutButton(),
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
      title: Text("Match Profile",style: AppStyle.textstyleinterregular15.copyWith(
          fontSize: getFontSize(15))),
    );
  }


  Widget userName(){
    return Container(
      // margin:EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Text(
          match.name,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppStyle
              .textstyleinterregular153
              .copyWith(
              fontSize:
              getFontSize(20))
      ),
    );
  }

  Widget profilePic() {
    return
      Container(
          margin:EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                  matchProfilePic != null ? matchProfilePic!.image : null,
                  backgroundColor: matchProfilePic == null ? ColorConstant.deepOrange300 : null,
                ),
              ]
          )
      );
  }

  Widget aboutYouText(){
    if (match.aboutYou == null){
      return new Container(width: 0, height: 0);
    }
    return Container(
      alignment: Alignment.center,
      margin:EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Text(
        match.aboutYou!,
        style: AppStyle.textstyleinterregular15.copyWith(
            fontSize: getFontSize(15), color: ColorConstant.deepOrange300),
      ),
    );
  }


  Widget hobbyTags(){
    if (hobbies.length == 0){
      return new Container(width: 0, height: 0);
    }
    return Tags(
      itemCount: hobbies.length,
      itemBuilder: (index){
        final item = hobbies[index];
        return ItemTags(
          key: Key(index.toString()),
          index: index,
          title: item,
          activeColor: ColorConstant.deepOrange300,
          pressEnabled: false,
        );
      },
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
            onPressed: (){
              Get.toNamed(AppRoutes.allChatsScreen);
            },
            child: Icon(Icons.sms_outlined,color: ColorConstant.whiteA700,size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
          // Match Page icon
          FloatingActionButton(
            onPressed: (){
              Get.toNamed(AppRoutes.mainMatchesPageScreen, arguments: email);
            },
            child: Icon(Icons.home_outlined,color: ColorConstant.whiteA700,size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
          // Profile page icon
          FloatingActionButton(
            onPressed: (){
              Get.toNamed(AppRoutes.personalProfileScreen, arguments: email);
            },
            child: Icon(Icons.person_outline,color: ColorConstant.whiteA700,size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
        ],
      ),
    );
  }

  //convert image source(which is a String) to an Image.
  imageDecode(String imageSource){
    final decodeBytes = base64Decode(imageSource);
    return Image.memory(decodeBytes);
  }


  //
  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //       child: Scaffold(
  //           backgroundColor: ColorConstant.whiteA700,
  //           body: Column(children: [
  //             Expanded(
  //                 child: Container(
  //                     width: size.width,
  //                     child: SingleChildScrollView(
  //                         child: Container(
  //                             decoration:
  //                                 BoxDecoration(color: ColorConstant.whiteA700),
  //                             child: Column(
  //                                 mainAxisSize: MainAxisSize.min,
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 mainAxisAlignment: MainAxisAlignment.start,
  //                                 children: [
  //                                   Column(
  //                                       mainAxisSize: MainAxisSize.min,
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.start,
  //                                       children: [
  //                                         Align(
  //                                             alignment: Alignment.centerLeft,
  //                                             child: Container(
  //                                                 width: double.infinity,
  //                                                 decoration: BoxDecoration(
  //                                                     color: ColorConstant
  //                                                         .deepOrange300),
  //                                                 child: Column(
  //                                                     mainAxisSize:
  //                                                         MainAxisSize.min,
  //                                                     crossAxisAlignment:
  //                                                         CrossAxisAlignment
  //                                                             .center,
  //                                                     mainAxisAlignment:
  //                                                         MainAxisAlignment
  //                                                             .start,
  //                                                     children: [
  //                                                       Align(
  //                                                           alignment: Alignment
  //                                                               .centerLeft,
  //                                                           child: Padding(
  //                                                               padding: EdgeInsets.only(
  //                                                                   left: getHorizontalSize(
  //                                                                       15.00),
  //                                                                   top: getVerticalSize(
  //                                                                       16.00),
  //                                                                   right: getHorizontalSize(
  //                                                                       15.00),
  //                                                                   bottom: getVerticalSize(
  //                                                                       16.00)),
  //                                                               child: Text(
  //                                                                   "msg_my_match_s_prof"
  //                                                                       .tr,
  //                                                                   overflow: TextOverflow
  //                                                                       .ellipsis,
  //                                                                   textAlign:
  //                                                                       TextAlign
  //                                                                           .left,
  //                                                                   style: AppStyle
  //                                                                       .textstyleinterregular15
  //                                                                       .copyWith(
  //                                                                           fontSize: getFontSize(15)))))
  //                                                     ]))),
  //                                         Align(
  //                                             alignment: Alignment.center,
  //                                             child: Padding(
  //                                                 padding: EdgeInsets.only(
  //                                                     left: getHorizontalSize(
  //                                                         19.00),
  //                                                     top: getVerticalSize(
  //                                                         18.00),
  //                                                     right: getHorizontalSize(
  //                                                         19.00)),
  //                                                 child: Text("lbl_name".tr,
  //                                                     overflow:
  //                                                         TextOverflow.ellipsis,
  //                                                     textAlign: TextAlign.left,
  //                                                     style: AppStyle
  //                                                         .textstyleinterregular153
  //                                                         .copyWith(
  //                                                             fontSize:
  //                                                                 getFontSize(
  //                                                                     15))))),
  //                                         Align(
  //                                             alignment: Alignment.center,
  //                                             child: Container(
  //                                                 height: getSize(140.00),
  //                                                 width: getSize(140.00),
  //                                                 margin: EdgeInsets.only(
  //                                                     left: getHorizontalSize(
  //                                                         19.00),
  //                                                     top: getVerticalSize(
  //                                                         14.00),
  //                                                     right: getHorizontalSize(
  //                                                         19.00)),
  //                                                 decoration: BoxDecoration(
  //                                                     color: ColorConstant
  //                                                         .bluegray100,
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             getHorizontalSize(
  //                                                                 70.00))))),
  //                                         Align(
  //                                             alignment: Alignment.centerLeft,
  //                                             child: Padding(
  //                                                 padding: EdgeInsets.only(
  //                                                     left: getHorizontalSize(
  //                                                         19.00),
  //                                                     top: getVerticalSize(
  //                                                         37.00),
  //                                                     right: getHorizontalSize(
  //                                                         19.00)),
  //                                                 child: Text(
  //                                                     "lbl_about_match".tr,
  //                                                     overflow:
  //                                                         TextOverflow.ellipsis,
  //                                                     textAlign: TextAlign.left,
  //                                                     style: AppStyle
  //                                                         .textstyleinterregular153
  //                                                         .copyWith(
  //                                                             fontSize:
  //                                                                 getFontSize(
  //                                                                     15))))),
  //                                         Align(
  //                                             alignment: Alignment.centerLeft,
  //                                             child: Padding(
  //                                                 padding: EdgeInsets.only(
  //                                                     left: getHorizontalSize(
  //                                                         19.00),
  //                                                     top: getVerticalSize(
  //                                                         37.00),
  //                                                     right: getHorizontalSize(
  //                                                         19.00)),
  //                                                 child: Text("lbl_hobbies".tr,
  //                                                     overflow:
  //                                                         TextOverflow.ellipsis,
  //                                                     textAlign: TextAlign.left,
  //                                                     style: AppStyle
  //                                                         .textstyleinterregular153
  //                                                         .copyWith(
  //                                                             fontSize:
  //                                                                 getFontSize(
  //                                                                     15))))),
  //                                         Align(
  //                                             alignment: Alignment.center,
  //                                             child: Padding(
  //                                                 padding: EdgeInsets.only(
  //                                                     left: getHorizontalSize(
  //                                                         19.00),
  //                                                     top: getVerticalSize(
  //                                                         334.00),
  //                                                     right: getHorizontalSize(
  //                                                         19.00)),
  //                                                 child: GestureDetector(
  //                                                     onTap: () {
  //                                                       onTapBtnChatwithname();
  //                                                     },
  //                                                     child: Container(
  //                                                         alignment:
  //                                                             Alignment.center,
  //                                                         height: getVerticalSize(
  //                                                             30.00),
  //                                                         width: getHorizontalSize(
  //                                                             162.00),
  //                                                         decoration: AppDecoration
  //                                                             .textstyleinterregular155,
  //                                                         child: Text(
  //                                                             "lbl_chat_with_name"
  //                                                                 .tr,
  //                                                             textAlign: TextAlign
  //                                                                 .center,
  //                                                             style: AppStyle
  //                                                                 .textstyleinterregular155
  //                                                                 .copyWith(
  //                                                                     fontSize:
  //                                                                         getFontSize(15)))))))
  //                                       ])
  //                                 ]))))),
  //             Container(
  //                 decoration: BoxDecoration(color: ColorConstant.lightBlueA100),
  //                 child: Padding(
  //                     padding: EdgeInsets.only(
  //                         top: getVerticalSize(6.00),
  //                         bottom: getVerticalSize(4.00)),
  //                     child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         mainAxisSize: MainAxisSize.max,
  //                         children: [
  //                           GestureDetector(
  //                               onTap: () {
  //                                 onTapImgGroup3();
  //                               },
  //                               child: Padding(
  //                                   padding: EdgeInsets.only(
  //                                       bottom: getVerticalSize(3.00)),
  //                                   child: Image.asset(ImageConstant.imgGroup3,
  //                                       height: getVerticalSize(37.00),
  //                                       width: getHorizontalSize(36.00),
  //                                       fit: BoxFit.fill))),
  //                           GestureDetector(
  //                               onTap: () {
  //                                 onTapImgGroup4();
  //                               },
  //                               child: Image.asset(ImageConstant.imgGroup4,
  //                                   height: getVerticalSize(40.00),
  //                                   width: getHorizontalSize(56.50),
  //                                   fit: BoxFit.fill)),
  //                           GestureDetector(
  //                               onTap: () {
  //                                 onTapImgImage6();
  //                               },
  //                               child: ClipRRect(
  //                                   borderRadius: BorderRadius.circular(
  //                                       getHorizontalSize(20.00)),
  //                                   child: Image.asset(ImageConstant.imgImage61,
  //                                       height: getSize(40.00),
  //                                       width: getSize(40.00),
  //                                       fit: BoxFit.fill)))
  //                         ])))
  //           ])));
  // }
  //
  // onTapBtnChatwithname() {
  //   Get.toNamed(AppRoutes.chatWithMatchScreen, arguments: email);
  // }
  //
  // onTapImgGroup3() {
  //   Get.toNamed(AppRoutes.allChatsScreen, arguments: email);
  // }
  //
  // onTapImgGroup4() {
  //   Get.toNamed(AppRoutes.mainMatchesPageScreen, arguments: email);
  // }
  //
  // onTapImgImage6() {
  //   Get.toNamed(AppRoutes.personalProfileScreen, arguments: email);
  // }
}

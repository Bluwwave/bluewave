
import 'dart:convert';

import 'package:bluewave/data/api/api_client.dart';
import 'package:bluewave/presentation/match_profile_page_screen/match_profile_page_screen.dart';

import 'controller/main_matches_page_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

import 'models/main_matches_page_model.dart';

class MainMatchesPageScreen extends StatefulWidget {
  String email;
  MainMatchesPageScreen(this.email);

  @override
  _MainMatchesPageState createState() => _MainMatchesPageState();
}

class _MainMatchesPageState extends State<MainMatchesPageScreen>{

  late Future<MainMatchPageModel> matchesInfo;

  late bool hasMatchForToday;
  List<MatchModel>? matches; //past matches
  MatchModel? match; //today's match
  Image? matchProfilePic; //today's match's profile pic




  @override
  void initState(){
    super.initState();
    print(widget.email);
    matchesInfo = getMatchesInfo();
  }

  Future<MainMatchPageModel> getMatchesInfo() async{
    MainMatchPageModel matchesInfoData =  await APIService().getMatches(widget.email);
    print(matchesInfoData);
    return matchesInfoData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: matchesInfo,
        builder: (BuildContext context, AsyncSnapshot<MainMatchPageModel> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }  else if (snapshot.hasError) {
            print("MainMatchPage something went wrong");
            return Center(child: Text('Something Went Wrong!'));
          } else if (snapshot.hasData){
            hasMatchForToday = snapshot.data!.hasMatchForToday;
            if (hasMatchForToday == true){
              match = snapshot.data!.matchForToday;
              match!.profilePic != null ? matchProfilePic = imageDecode(match!.profilePic!): null;
            }
            matches = snapshot.data!.pastMatches;
            return buildMainMatchesPage();
          }
          print("ERROR: No data for choices in profileChangingPage");
          return MainMatchesPageScreen(widget.email);
        },
      ),
    );


    return buildMainMatchesPage();
  }

  buildMainMatchesPage(){
    return Scaffold(
      backgroundColor: ColorConstant.backGroundColor,
      appBar: appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                    todaysMatchDisplay(),
                  // todaysMatchText(),
                  //
                  // matchProfile(),
                  //
                  // matchName(),

                  PastMatchesText(),

                  matches != null ?
                  Flexible(child: PastMatches(matches: matches!, email: widget.email)):
                  new Container(height: 0, width: 0),
                  // Expanded(child: PastMatches(matches)),
                  // allMatchesDisplay(),

                  SizedBox(height: 15),


                ],
              ),
            ),
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
              // Get.toNamed(
              //     AppRoutes.mainMatchesPageScreen, arguments: widget.email);
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

  todaysMatchDisplay(){

    if (hasMatchForToday){
      return Column(
        children: [
          todaysMatchText(),

          matchProfile(),

          matchName(),
        ],
      );
    } else {
      return noMatchText();
    }
  }

  noMatchText(){
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
          "Unfortunately, there isn't any available match at the moment:(, please check back later",
          softWrap: true,
          // overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppStyle
              .textstyleinterregular153
              .copyWith(
              fontSize:
              getFontSize(15))
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

  matchProfile(){
    return GestureDetector(
      onTap:(){
        Get.toNamed(AppRoutes.matchProfilePageScreen, parameters: {
          'email': widget.email,
          'matchEmail': match!.email
        });
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            CircleAvatar(
              radius: 50,
              backgroundImage: matchProfilePic != null ? matchProfilePic!.image : null,
              backgroundColor: matchProfilePic == null ? ColorConstant.deepOrange300 : null,
              child: matchProfilePic == null ?
                Text(match!.firstName[0].toUpperCase(),
                  style: AppStyle
                    .textstyleinterregular153
                    .copyWith(
                    fontSize:
                    getFontSize(15)),
                ): null
            ),
          ]
      )
    );
  }

  matchName(){
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
          match!.firstName + " " + match!.lastName,
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

  PastMatchesText() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
          "Past Matches",
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle
              .textstyleinterregular153
              .copyWith(
              fontSize:
              getFontSize(25))
      ),
    );
  }

  //convert image source(which is a String) to an Image.
  imageDecode(String imageSource){
    final decodeBytes = base64Decode(imageSource);
    return Image.memory(decodeBytes);
  }
}


class PastMatches extends StatelessWidget {
  final List<MatchModel> matches;
  final String email;
  PastMatches({required this.matches, required this.email});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      itemBuilder: buildMatches,
      itemCount: matches.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
    );
  }

  Widget buildMatches(BuildContext context, int index){
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: ColorConstant.deepOrange300, width: 1)),
        child: ListTile(
          onTap:(){
            Get.toNamed(AppRoutes.matchProfilePageScreen, parameters: {
              'email': email,
              'matchEmail': matches[index].email
            });
          },
          leading: CircleAvatar(
            backgroundImage:
            matches[index].profilePic != null ? imageDecode(matches[index].profilePic!)!.image : null,
            backgroundColor: matches[index].profilePic == null ? ColorConstant.deepOrange300 : null,
            child: matches[index].profilePic == null ?
              Text(matches[index].firstName[0].toUpperCase(),
                style: AppStyle
                    .textstyleinterregular153
                    .copyWith(
                    fontSize:
                    getFontSize(25), color: ColorConstant.whiteA700),
              ): null,
          ),
          title: Text(
            matches[index].firstName + " " + matches[index].lastName,
            style: AppStyle.textstyleinterregular153.copyWith(fontSize:getFontSize(15))),
        ));
    // return GestureDetector(
    //     onTap: () {
    //       Get.toNamed(AppRoutes.matchProfilePageScreen, parameters: {'email': email, 'matchEmail': matches[index].email});
    //     },
    //     child: Container(
    //         width: double.infinity,
    //         margin: EdgeInsets.only(top: 10),
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20),
    //             border: Border.all(color: ColorConstant.deepOrange300, width: 1)),
    //         child: Row(
    //
    //         )
            // child: Column(
            //     mainAxisSize:
            //     MainAxisSize.min,
            //     crossAxisAlignment:
            //     CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Align(
            //           alignment: Alignment.centerLeft,
            //           child: Container(
            //               height: getSize(
            //                   40.00),
            //               width: getSize(
            //                   40.00),
            //               margin: EdgeInsets.only(
            //                   left: getHorizontalSize(
            //                       19.00),
            //                   top: getVerticalSize(
            //                       11.00),
            //                   right: getHorizontalSize(
            //                       19.00),
            //                   bottom:
            //                   getVerticalSize(
            //                       9.00)),
            //               decoration: BoxDecoration(
            //                   color: ColorConstant
            //                       .bluegray100,
            //                   borderRadius:
            //                   BorderRadius.circular(
            //                       getHorizontalSize(20.00)))))
            //     ])
    // ));
  }

  imageDecode(String imageSource){
    final decodeBytes = base64Decode(imageSource);
    return Image.memory(decodeBytes);
  }
}
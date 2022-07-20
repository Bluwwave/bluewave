import 'dart:convert';

import 'package:bluewave/data/api/api_client.dart';
import 'package:bluewave/presentation/login_page_screen/login_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../login_page_screen/provider/google_provider.dart';
import 'controller/personal_profile_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

import 'models/personal_profile_model.dart';



class PersonalProfileScreen extends StatefulWidget {
  String email;
  PersonalProfileScreen(this.email);

  @override
  _PersonalProfilePageState createState() => _PersonalProfilePageState();
}


class _PersonalProfilePageState extends State<PersonalProfileScreen>{

  Future<PersonalProfileModel>? profile;

  late String name;
  String? aboutYou;
  Image? profilePicture;



  @override
  void initState(){
    super.initState();
    print("get personal Profile page");
    print(widget.email);
    profile = getProfile();
  }

  Future<PersonalProfileModel> getProfile() async{
    PersonalProfileModel userProfile = await APIService().getUserProfile(widget.email);
    print("personal profile screen userProfile: " + userProfile.toString());
    return userProfile;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: FutureBuilder(
        future: profile,
        builder: (BuildContext context, AsyncSnapshot<PersonalProfileModel> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }  else if (snapshot.hasError) {
            print("profile page something went wrong");
            return Center(child: Text('Something Went Wrong!'));
          } else if (snapshot.hasData){
            name = snapshot.data!.name;
            aboutYou = snapshot.data!.aboutYou;
            snapshot.data!.profilePic != null ? profilePicture = imageDecode(snapshot.data!.profilePic!): null;
            return buildProfilePage();
          }
          print("ERROR: No data for choices in profileChangingPage");
          return PersonalProfileScreen(widget.email);
        },
        )
    );
  }

  // @override
  // Widget build(BuildContext context){
  //   return buildProfilePage();
  // }

  buildProfilePage() {
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
                        // userName(),

                        profilePic(),

                        userName(),

                        aboutYouText(),
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
      title: Text("My Profile",style: AppStyle.textstyleinterregular15.copyWith(
          fontSize: getFontSize(15))),
      actions: [
        PopupMenuButton(itemBuilder: (context) =>[
          PopupMenuItem(
              child: Text("Edit Profile"),
              value: 1,
          ),
          PopupMenuItem(
            child: Text("Log Out"),
            value: 2,
          ),
        ],
        onSelected: (int value){
          if (value == 1){
            Get.toNamed(AppRoutes.profileChangingPageScreen, arguments: widget.email);
          } else if (value == 2){
            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout().then((value){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));});
          }
        },
        ),
      ],
    );
  }


  Widget userName(){
    return Container(
      // margin:EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Text(
        name,
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
                  profilePicture != null ? profilePicture!.image : null,
                  backgroundColor: profilePicture == null ? ColorConstant.deepOrange300 : null,
                ),
              ]
          )
      );
  }

  Widget aboutYouText(){
    if (aboutYou == null){
      return new Container(width: 0, height: 0);
    }
    return Container(
      alignment: Alignment.center,
      margin:EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Text(
        aboutYou!,
        style: AppStyle.textstyleinterregular15.copyWith(
            fontSize: getFontSize(15), color: ColorConstant.deepOrange300),
      ),
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
              Get.toNamed(AppRoutes.mainMatchesPageScreen, arguments: widget.email);
            },
            child: Icon(Icons.home_outlined,color: ColorConstant.whiteA700,size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
          // Profile page icon
          FloatingActionButton(
            onPressed: (){},
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
}

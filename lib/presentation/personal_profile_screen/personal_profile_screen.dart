import 'package:bluewave/presentation/login_page_screen/login_page_screen.dart';
import 'package:provider/provider.dart';

import '../login_page_screen/provider/google_provider.dart';
import 'controller/personal_profile_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class PersonalProfileScreen extends StatefulWidget {
  String email;
  PersonalProfileScreen(this.email);

  @override
  _PersonalProfilePageState createState() => _PersonalProfilePageState();
}


class _PersonalProfilePageState extends State<PersonalProfileScreen>{

  @override
  void initState(){
    super.initState();
  }

  // @override
  // Widget build(BuildContext context){
  //   return Scaffold(
  //       body: FutureBuilder(
  //       future: choices,
  //       builder: (BuildContext context, AsyncSnapshot<InitialProfileModel> snapshot){
  //         if (snapshot.connectionState == ConnectionState.waiting){
  //           return Center(child: CircularProgressIndicator());
  //         }  else if (snapshot.hasError) {
  //           print("profile changing page something went wrong");
  //           return Center(child: Text('Something Went Wrong!'));
  //         } else if (snapshot.hasData){
  //           return buildProfilePage();
  //         }
  //         print("ERROR: No data for choices in profileChangingPage");
  //         return PersonalProfileScreen(widget.email);
  //       },
  //       )
  //   );
  // }

  @override
  Widget build(BuildContext context){
    return buildProfilePage();
  }

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
                        userName(),

                        profilePic(),

                        editProfile(),

                        logOut(),
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


  Widget userName(){
    return Container(
      child: Text(
        "UserName",
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
          margin:EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
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

  Widget editProfile(){
    return GestureDetector(
      onTap:(){
        Get.toNamed(AppRoutes.profileChangingPageScreen, arguments: widget.email);
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Text(
            "Edit Profile",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle
                .textstyleinterregular153
                .copyWith(
                fontSize:
                getFontSize(15))
        ),
      ),
    );
  }

  Widget logOut(){
    return GestureDetector(
      onTap:(){
        final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
        provider.logout().then((value){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));});
      },
    child: Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        "Log Out",
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: AppStyle
            .textstyleinterregular153
            .copyWith(
            fontSize:
            getFontSize(15))
    ),
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
}

import 'dart:io';
import 'package:bluewave/data/api/api_client.dart';
import 'package:getwidget/getwidget.dart';
// import 'package:image_picker/image_picker.dart';
import '../main_matches_page_screen/main_matches_page_screen.dart';
import 'controller/profile_changing_page_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

import 'models/profile_changing_page_model.dart';


class ProfileChangingPage extends StatefulWidget{
  final String email;
  ProfileChangingPage(this.email);

  @override
  _ProfileChangingPageState createState() => _ProfileChangingPageState();
}

//What to show if the user has already some profile set up previously and they
//want to edit based on their previous profile
class _ProfileChangingPageState extends State<ProfileChangingPage> {

  Future<InitialProfileModel>? choices;
  late List<String> hobbies;
  late List<String> lookingFor;
  List<int>? initialHobbies;
  List<int>? initialLookingFor;
  List<int>? chosenHobbies;
  List<int>? chosenLookingFor;
  var aboutYou;
  var profilePic;
  var hobbiesEmpty;
  var lookingForEmpty;
  final aboutYouController = TextEditingController();
  // final imagePicker = ImagePicker();



  @override
  void initState(){
    super.initState();
    choices = getChoices();
  }

  Future<InitialProfileModel> getChoices() async{
    InitialProfileModel initialProfile = await APIService().getChoices(widget.email);
    print(initialProfile.toString());
    return initialProfile;

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: FutureBuilder(
        future: choices,
        builder: (BuildContext context, AsyncSnapshot<InitialProfileModel> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }  else if (snapshot.hasError) {
            print("profile changing page something went wrong");
            return Center(child: Text('Something Went Wrong!'));
          } else if (snapshot.hasData){
              hobbies = snapshot.data!.hobbies!;
              lookingFor = snapshot.data!.lookingFor!;
              initialHobbies = snapshot.data!.chosenHobbies;
              initialLookingFor = snapshot.data!.chosenLookingFor;
              aboutYou = snapshot.data!.aboutYou;
              // chosenHobbies == null ? hobbiesEmpty = true : hobbiesEmpty = false;
              // chosenLookingFor == null ? lookingForEmpty = true : lookingForEmpty = false;
              hobbiesEmpty = false;
              lookingForEmpty = false;
              profilePic = "nothing";
              // profilePic = snapshot.data!.profilePic;
            return buildProfileChangingPage();
          }
          print("ERROR: No data for choices in profileChangingPage");
          return ProfileChangingPage(widget.email);
        },
      )
    );
  }




  buildProfileChangingPage() {
    return Scaffold(
      backgroundColor: ColorConstant.deepOrange50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstant.deepOrange300,
        title: Text("Edit Profile",style: AppStyle.textstyleinterregular15.copyWith(
                  fontSize: getFontSize(15))),
      ),
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
                        buildProfilePic(),

                        selectHobbies(),

                        selectLookingFor(),

                        aboutYouText(),

                      ],
                    ),
                  ),

                  nextButton(),
                ]
            )

        ),

      ),
    );
  }


  Widget buildProfilePic() {
    return
      Container(
      margin:EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: GestureDetector(
        onTap: (){
          showPickOptions(context);
        },
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(ImageConstant.defaultProfilePic),
            // backgroundColor: ColorConstant.deepOrange300,
          ),
      )
    );
  }

  // loadPicker(ImageSource source) async{
  //   final XFile? picked = await imagePicker.pickImage(source: source);
  //   if (picked != null){
  //     setState(()=> profilePic = picked);
  //   }
  // }
  //
  void showPickOptions(BuildContext context){
    showDialog(context: context,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children:<Widget>[
              ListTile(
                title: Text("Pick From Gallery"),
                onTap: (){
                  // loadPicker(ImageSource.gallery);
                }
              ),
              ListTile(
                  title: Text("Take A Picture"),
                  onTap: (){
                    // loadPicker(ImageSource.camera);
                  }
              ),
            ]
          )

        )
    );
  }

  Widget selectHobbies(){
    return Container(
      child: GFMultiSelect(
        initialSelectedItemsIndex: initialHobbies != null ? initialHobbies : null,

        // should we get items from backend
        items: hobbies,
        onSelect: (value){
          setState(()=> chosenHobbies = value.cast<int>());
          print('select $value');
        },


        //dropdown Title
        dropdownTitleTileHintText: 'Select Your Hobbies',
        dropdownTitleTileHintTextStyle: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15), color: ColorConstant.deepOrange300),
        dropdownTitleTileColor: ColorConstant.deepOrange50,
        dropdownTitleTileMargin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        dropdownTitleTilePadding: EdgeInsets.all(10),
        dropdownTitleTileText: hobbiesEmpty ? "Hobbies Cannot Be Empty(need to change color)" : "",
        dropdownTitleTileTextStyle: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15), color: ColorConstant.deepOrange300),



        //expanded/collapsed Icon
        expandedIcon: Icon(
          Icons.keyboard_arrow_down,
          color: ColorConstant.deepOrange300,
        ),
        collapsedIcon: Icon(
          Icons.keyboard_arrow_up,
          color: ColorConstant.deepOrange300,
        ),

        //Button
        submitButton: Text('OK', style: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15), color: ColorConstant.deepOrange300),),
        cancelButton: Text('Cancel',style: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15), color: ColorConstant.deepOrange300),),
        buttonColor: ColorConstant.deepOrange50,

        //dropdown menus, checkbox and checkbox icon
        listItemTextColor: ColorConstant.deepOrange300,
        type: GFCheckboxType.circle,
        size: 15,
        activeIcon: Icon(Icons.check, size: 15, color: ColorConstant.deepOrange300),
        dropdownBgColor: ColorConstant.deepOrange50,
        inactiveBorderColor: ColorConstant.whiteA700,
      ),
    );
  }

  Widget selectLookingFor(){
    return Container(
      child: GFMultiSelect(
        initialSelectedItemsIndex: initialLookingFor,

        // should we get items from backend
        items: lookingFor,
        onSelect: (value){
          setState(()=> chosenLookingFor = value.cast<int>());
          print('select $value');
        },

        //dropdown Title
        dropdownTitleTileHintText: 'Looking For',
        dropdownTitleTileHintTextStyle: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15), color: ColorConstant.deepOrange300),
        dropdownTitleTileColor: ColorConstant.deepOrange50,
        dropdownTitleTileMargin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        dropdownTitleTilePadding: EdgeInsets.all(10),
        dropdownTitleTileText: lookingForEmpty ? "LookingFor Cannot Be Empty" : "",
        dropdownTitleTileTextStyle: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15), color: ColorConstant.deepOrange300),
        // hideDropdownUnderline: true,

        //expanded/collapsed Icon
        expandedIcon: Icon(
          Icons.keyboard_arrow_down,
          color: ColorConstant.deepOrange300,
        ),
        collapsedIcon: Icon(
          Icons.keyboard_arrow_up,
          color: ColorConstant.deepOrange300,
        ),

        //Button
        submitButton: Text('OK', style: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15), color: ColorConstant.deepOrange300),),
        cancelButton: Text('Cancel',style: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15), color: ColorConstant.deepOrange300),),
        buttonColor: ColorConstant.deepOrange50,

        //dropdown menus, checkbox and checkbox icon
        listItemTextColor: ColorConstant.deepOrange300,
        type: GFCheckboxType.circle,
        size: 15,
        activeIcon: Icon(Icons.check, size: 15, color: ColorConstant.deepOrange300),
        dropdownBgColor: ColorConstant.deepOrange50,
        inactiveBorderColor: ColorConstant.whiteA700,
      ),
    );
  }

  Widget nextButton(){
    return Align(
      alignment: Alignment.bottomRight,
        child: GestureDetector(
            onTap: () {
              onTapTxtNext();
            },
            child: Padding(
                padding: EdgeInsets.only(
                    left: getHorizontalSize(25.00),
                    bottom: getHorizontalSize(10.00),
                    right:getHorizontalSize(25.00)),
                child: Text("lbl_next".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle
                      .textstyleinterregular20
                      .copyWith(fontSize:getFontSize(20), color: ColorConstant.lightBlueA100),

                )
            )
        )
    );
  }

  Widget aboutYouText(){
    return Container(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        children:[
          Align(
            alignment: Alignment.centerLeft,
            child: Text("About You", style: AppStyle
                .textstyleinterregular20
                .copyWith(fontSize:getFontSize(15), color: ColorConstant.deepOrange300),textAlign: TextAlign.left),
          ),
          // Text("About You", style: AppStyle
          //     .textstyleinterregular20
          //     .copyWith(fontSize:getFontSize(15), color: ColorConstant.deepOrange300),textAlign: TextAlign.left),
          TextField(
          controller: aboutYouController,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(
            suffixIconColor: ColorConstant.deepOrange300,
            fillColor: ColorConstant.whiteA700,
            filled: true,
            contentPadding: EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConstant.whiteA700),
            ),
          ),
          )
    ]));
  }

  //Need to be connected with backend
  onTapTxtNext() async{
    if (chosenHobbies == null  || chosenLookingFor == null){
      setState((){
        chosenHobbies == null ? hobbiesEmpty = true : hobbiesEmpty = false;
        chosenLookingFor == null ? lookingForEmpty = true : lookingForEmpty = false;
      });
      buildProfileChangingPage();
    } else {
      final aboutYou = aboutYouController.text;
      final newProfile = UpdatedProfileModel(email: widget.email,
          chosenHobbies: chosenHobbies!, chosenLookingFor: chosenLookingFor!,
          aboutYou: aboutYou, profilePic: profilePic);
      await APIService().updateProfileInfo(newProfile);
      // Get.toNamed(AppRoutes.mainMatchesPageScreen, arguments: widget.email);

      Navigator.push(context, MaterialPageRoute(builder: (context) => MainMatchesPageScreen(widget.email)));
    }
  }
}
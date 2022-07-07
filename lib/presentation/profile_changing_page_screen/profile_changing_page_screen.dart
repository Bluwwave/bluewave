import 'package:getwidget/getwidget.dart';
import 'controller/profile_changing_page_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfileChangingPageScreen extends GetWidget<ProfileChangingPageController> {

  var profileHeight = 300;
  final aboutYouController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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

                        aboutYou(),

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
    return Container(
      margin:EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: CircleAvatar(
        radius: 50,
        // backgroundImage: AssetImage(ImageConstant.defaultProfilePic),
        backgroundColor: ColorConstant.deepOrange300,
      ),
    );
  }

  Widget selectHobbies(){
    return Container(
      child: GFMultiSelect(
        // should we get items from backend
        items: ['Hiking', 'Sports', 'Study','...'],
        onSelect: (value){
          print('select $value');
        },

        //dropdown Title
        dropdownTitleTileHintText: 'Select Your Hobbies',
        dropdownTitleTileHintTextStyle: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15), color: ColorConstant.deepOrange300),
        dropdownTitleTileColor: ColorConstant.deepOrange50,
        dropdownTitleTileMargin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        dropdownTitleTilePadding: EdgeInsets.all(10),
        dropdownTitleTileText: "",
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
        // should we get items from backend
        items: ['Study Partner', 'Friends', '...'],
        onSelect: (value){
          print('select $value');
        },

        //dropdown Title
        dropdownTitleTileHintText: 'Looking For',
        dropdownTitleTileHintTextStyle: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15), color: ColorConstant.deepOrange300),
        dropdownTitleTileColor: ColorConstant.deepOrange50,
        dropdownTitleTileMargin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        dropdownTitleTilePadding: EdgeInsets.all(10),
        dropdownTitleTileText: "",
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

  Widget aboutYou(){
    return Container(
      margin: EdgeInsets.only(top: 30, left: 10, right: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        children:[
          Text("About You", style: AppStyle
              .textstyleinterregular20
              .copyWith(fontSize:getFontSize(15), color: ColorConstant.deepOrange300),),
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
  onTapTxtNext(){
    Get.toNamed(AppRoutes.mainMatchesPageScreen);
  }
}




    // return SafeArea(
    //     child: Scaffold(
    //         backgroundColor: ColorConstant.deepOrange50,
    //         body: Container(
    //             width: size.width,
    //             child: SingleChildScrollView(
    //                 child: Container(
    //                     child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // children: <Widget>[
                            //   // header
                            //   Container(
                            //     padding: EdgeInsets.all(8.0),
                            //     color: ColorConstant.deepOrange300,
                            //     child: Text("Edit Profile",
                            //         overflow:
                            //         TextOverflow.ellipsis,
                            //         textAlign: TextAlign.left,
                            //         style: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15))
                            //     ),
                            //   ),




                              //
                              // Align(
                              //     alignment: Alignment.center,
                              //     child: Container(
                              //         width: getHorizontalSize(220.00),
                              //         margin: EdgeInsets.only(
                              //             left: getHorizontalSize(17.00),
                              //             top: getVerticalSize(18.00),
                              //             right: getHorizontalSize(17.00)),
                              //         decoration: BoxDecoration(
                              //             color: ColorConstant.deepOrange50,
                              //             borderRadius: BorderRadius.circular(
                              //                 getHorizontalSize(2.00)),
                              //             border: Border.all(
                              //                 color: ColorConstant.bluegray400,
                              //                 width: getHorizontalSize(1.00))),
                              //         child: Column(
                              //             mainAxisSize: MainAxisSize.min,
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.center,
                              //             mainAxisAlignment:
                              //                 MainAxisAlignment.start,
                              //             children: [
                              //               Padding(
                              //                   padding: EdgeInsets.only(
                              //                       left: getHorizontalSize(
                              //                           10.00),
                              //                       top: getVerticalSize(42.00),
                              //                       right: getHorizontalSize(
                              //                           10.00),
                              //                       bottom:
                              //                           getVerticalSize(90.00)),
                              //                   child: Text(
                              //                       "lbl_profile_picture".tr,
                              //                       overflow:
                              //                           TextOverflow.ellipsis,
                              //                       textAlign: TextAlign.left,
                              //                       style: AppStyle
                              //                           .textstyleinterregular151
                              //                           .copyWith(
                              //                               fontSize:
                              //                                   getFontSize(
                              //                                       15))))
                              //             ]))),
                              // Align(
                              //     alignment: Alignment.centerLeft,
                              //     child: Padding(
                              //         padding: EdgeInsets.only(
                              //             left: getHorizontalSize(17.00),
                              //             top: getVerticalSize(32.00),
                              //             right: getHorizontalSize(17.00)),
                              //         child: Text("lbl_hobbies".tr,
                              //             overflow: TextOverflow.ellipsis,
                              //             textAlign: TextAlign.left,
                              //             style: AppStyle
                              //                 .textstyleinterregular152
                              //                 .copyWith(
                              //                     fontSize: getFontSize(15))))),
                              // Align(
                              //     alignment: Alignment.center,
                              //     child: Container(
                              //         height: getVerticalSize(28.00),
                              //         width: getHorizontalSize(327.00),
                              //         margin: EdgeInsets.only(
                              //             left: getHorizontalSize(17.00),
                              //             right: getHorizontalSize(16.00)),
                              //         decoration: BoxDecoration(
                              //             color: ColorConstant.deepOrange50,
                              //             borderRadius: BorderRadius.circular(
                              //                 getHorizontalSize(2.00)),
                              //             border: Border.all(
                              //                 color: ColorConstant.bluegray400,
                              //                 width:
                              //                     getHorizontalSize(1.00))))),
                              // Align(
                              //     alignment: Alignment.centerLeft,
                              //     child: Padding(
                              //         padding: EdgeInsets.only(
                              //             left: getHorizontalSize(17.00),
                              //             top: getVerticalSize(32.00),
                              //             right: getHorizontalSize(17.00)),
                              //         child: Text("lbl_looking_for".tr,
                              //             overflow: TextOverflow.ellipsis,
                              //             textAlign: TextAlign.left,
                              //             style: AppStyle
                              //                 .textstyleinterregular152
                              //                 .copyWith(
                              //                     fontSize: getFontSize(15))))),
                              // Align(
                              //     alignment: Alignment.centerLeft,
                              //     child: Container(
                              //         height: getVerticalSize(28.00),
                              //         width: getHorizontalSize(199.00),
                              //         margin: EdgeInsets.only(
                              //             left: getHorizontalSize(17.00),
                              //             right: getHorizontalSize(17.00)),
                              //         decoration: BoxDecoration(
                              //             color: ColorConstant.deepOrange50,
                              //             borderRadius: BorderRadius.circular(
                              //                 getHorizontalSize(2.00)),
                              //             border: Border.all(
                              //                 color: ColorConstant.bluegray400,
                              //                 width:
                              //                     getHorizontalSize(1.00))))),
                              // Align(
                              //     alignment: Alignment.centerLeft,
                              //     child: Padding(
                              //         padding: EdgeInsets.only(
                              //             left: getHorizontalSize(17.00),
                              //             top: getVerticalSize(32.00),
                              //             right: getHorizontalSize(17.00)),
                              //         child: Text("lbl_about_you".tr,
                              //             overflow: TextOverflow.ellipsis,
                              //             textAlign: TextAlign.left,
                              //             style: AppStyle
                              //                 .textstyleinterregular152
                              //                 .copyWith(
                              //                     fontSize: getFontSize(15))))),
                              // Align(
                              //     alignment: Alignment.center,
                              //     child: Container(
                              //         height: getVerticalSize(80.00),
                              //         width: getHorizontalSize(325.00),
                              //         margin: EdgeInsets.only(
                              //             left: getHorizontalSize(17.00),
                              //             right: getHorizontalSize(17.00)),
                              //         decoration: BoxDecoration(
                              //             color: ColorConstant.deepOrange50,
                              //             borderRadius: BorderRadius.circular(
                              //                 getHorizontalSize(2.00)),
                              //             border: Border.all(
                              //                 color: ColorConstant.bluegray400,
                              //                 width:
                              //                     getHorizontalSize(1.00))))),
                              // Align(
                              //     alignment: Alignment.centerRight,
                              //     child: GestureDetector(
                              //         onTap: () {
                              //           onTapTxtSave();
                              //         },
                              //         child: Padding(
                              //             padding: EdgeInsets.only(
                              //                 left: getHorizontalSize(28.00),
                              //                 top: getVerticalSize(221.00),
                              //                 right: getHorizontalSize(28.00)),
                              //             child: Text("lbl_save".tr,
                              //                 overflow: TextOverflow.ellipsis,
                              //                 textAlign: TextAlign.left,
                              //                 style: AppStyle
                              //                     .textstyleinterregular20
                              //                     .copyWith(
                              //                         fontSize:
                              //                             getFontSize(20)))))),
                              // Align(
                              //     alignment: Alignment.centerLeft,
                              //     child: Container(
                              //         height: getVerticalSize(50.00),
                              //         width: size.width,
                              //         margin: EdgeInsets.only(
                              //             top: getVerticalSize(1.00)),
                              //         decoration: BoxDecoration(
                              //             color: ColorConstant.lightBlueA100)))
                            // ]))))));
  // }
//
//   onTapTxtSave() {
//     Get.toNamed(AppRoutes.mainMatchesPageScreen);
//   }
// }

import 'package:bluewave/data/api/api_client.dart';
import 'package:bluewave/presentation/mandatory_info_page_screen/models/mandatory_info_page_model.dart';
import 'package:bluewave/presentation/profile_changing_page_screen/profile_changing_page_screen.dart';

import 'controller/mandatory_info_page_controller.dart';
import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bluewave/data/api/api_client.dart';



class MandatoryInfoPage extends StatefulWidget {
  final String email;
  MandatoryInfoPage(this.email);

  @override
  State<StatefulWidget> createState() {
    return MandatoryInfoPageState();
  }
}

class MandatoryInfoPageState extends State<MandatoryInfoPage>{

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  bool fNameEmpty = false;
  bool lNameEmpty = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: ColorConstant.deepOrange50,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //Header Container
              Container(
                padding: EdgeInsets.only(
                  left: getHorizontalSize(16.00),
                  top: getVerticalSize(13.00),
                  right: getHorizontalSize(16.00),
                  bottom: getVerticalSize(19.00)),
                color: ColorConstant.deepOrange300,
                child: Text("Mandatory Info",
                    overflow:
                      TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.textstyleinterregular15.copyWith(fontSize: getFontSize(15))
                ),
              ),

              //Body Container
              Expanded(
                child: SingleChildScrollView(
                    child: Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                      child: Column(
                      children: [
                        TextField(
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: "First Name*",
                            errorText: fNameEmpty ? 'First Name Can\'t Be Empty' : null,
                            fillColor: ColorConstant.whiteA700,
                            filled: true,
                            contentPadding: EdgeInsets.all(20),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: ColorConstant.whiteA700),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        TextField(
                            controller: lastNameController,
                            keyboardType: TextInputType.name,
                            autofocus: true,
                            decoration: InputDecoration(
                                labelText: "Last Name*",
                                errorText: lNameEmpty ? 'Last Name Can\'t Be Empty' : null,
                                fillColor: ColorConstant.whiteA700,
                                filled: true,
                                contentPadding: EdgeInsets.all(20),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: ColorConstant.whiteA700),
                                ),
                            ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align (
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              onTapTxtNext();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getHorizontalSize(25.00),
                                // top: getVerticalSize(455.00),
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
                        ),
                      ]
                    )
                  )
                ),
              ),],),),);
  }

  Future onTapTxtNext() async{
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    if (firstName.isNotEmpty && lastName.isNotEmpty){
      final user = MandatoryInfoModel(email: widget.email, firstName: firstName, lastName: lastName);
      await APIService().storeMandatoryInfo(user);
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileChangingPage(user.email!)));
      // Get.toNamed(AppRoutes.profileChangingPageScreen, arguments:widget.email);
    } else {
      setState(() {
        firstName.isEmpty ? fNameEmpty = true : fNameEmpty = false;
        lastName.isEmpty ? lNameEmpty = true : lNameEmpty = false;
      });

    }
  }

}
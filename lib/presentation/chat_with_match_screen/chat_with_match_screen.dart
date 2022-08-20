

import 'package:bluewave/data/api/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/math_utils.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_style.dart';
import 'models/chat_with_match_model.dart';

class ChatWithMatchScreen extends StatefulWidget{
  String currEmail;
  String otherEmail;
  String otherName;
  ChatWithMatchScreen(this.currEmail, this.otherEmail, this.otherName);

  @override
  _ChatWithMatchState createState() => _ChatWithMatchState();
}

class _ChatWithMatchState extends State<ChatWithMatchScreen>{

  late Map<String, dynamic> userInfo;
  late List<Message> pastChats;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context){
    print(widget.otherEmail);
    print(widget.otherName);

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      // Top bar
      appBar: AppBar(
        backgroundColor: ColorConstant.deepOrange300,
        title: Text(widget.otherName,style: AppStyle.textstyleinterregular15.copyWith(
            fontSize: getFontSize(15))),
      ),
      body: StreamBuilder(
        stream: APIService().getPastChats(widget.currEmail, widget.otherEmail),
        builder: (context, AsyncSnapshot<ChatWithMatchModel> snapshot){
          if (snapshot.hasError) {
            print("ChatWithMatchPage something went wrong");
            print(snapshot.error?.toString());
            return Center(child: Text('Something Went Wrong!'));
          } else if (snapshot.hasData) {
            userInfo = snapshot.data!.userInfo;
            pastChats = snapshot.data!.pastChats;
            return buildPastChats();


            return SizedBox(height: 10,);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),

    );
  }

  Widget buildPastChats(){
    for (int i = 0; i < pastChats.length; i++){
      print("chats: " + pastChats[i].emailFrom);
    }
    print(pastChats.length);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(20),
            child: ListView.separated(
              itemBuilder: (context, index) =>
              pastChats[index].emailFrom == widget.currEmail ?
              _buildMyMessage(pastChats[index]):
              _buildOtherMessage(pastChats[index]),
              separatorBuilder: (_, index) => SizedBox(height: 20,),
              itemCount: pastChats.length,
            ),
          ),
      ]
    );
  }

  Widget _buildMyMessage(Message message){
    print("myMessage" + message.emailFrom);
    return Row(
      children: [
        Text(
          message.timestamp,
          style: AppStyle.textstyleinterregular15.copyWith(
              color: ColorConstant.grey,fontSize: getFontSize(15)),
        ),
      ],
    );
  }

  Widget _buildOtherMessage(Message message){
    print("otherMessage");
    return Row(
      children: [
        Text(
          message.timestamp,
          style: AppStyle.textstyleinterregular15.copyWith(
              color: ColorConstant.grey,fontSize: getFontSize(15)),
        ),
      ],
    );
  }

}







// import 'controller/chat_with_match_controller.dart';
// import 'package:bluewave/core/app_export.dart';
// import 'package:flutter/material.dart';
//
// class ChatWithMatchScreen extends GetWidget<ChatWithMatchController> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: ColorConstant.whiteA700,
//             body: Container(
//                 width: size.width,
//                 child: SingleChildScrollView(
//                     child: Container(
//                         decoration:
//                             BoxDecoration(color: ColorConstant.whiteA700),
//                         child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                   decoration: BoxDecoration(
//                                       color: ColorConstant.deepOrange300),
//                                   child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         GestureDetector(
//                                             onTap: () {
//                                               onTapMyMatch4();
//                                             },
//                                             child: Container(
//                                                 height: getSize(35.00),
//                                                 width: getSize(35.00),
//                                                 margin: EdgeInsets.only(
//                                                     left: getHorizontalSize(
//                                                         13.00),
//                                                     top: getVerticalSize(7.00),
//                                                     bottom:
//                                                         getVerticalSize(8.00)),
//                                                 decoration: BoxDecoration(
//                                                     color: ColorConstant
//                                                         .bluegray100,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             getHorizontalSize(
//                                                                 17.50))))),
//                                         GestureDetector(
//                                             onTap: () {
//                                               onTapTxtMatchsname();
//                                             },
//                                             child: Padding(
//                                                 padding: EdgeInsets.only(
//                                                     left: getHorizontalSize(
//                                                         13.00),
//                                                     top: getVerticalSize(16.00),
//                                                     right: getHorizontalSize(
//                                                         199.00),
//                                                     bottom:
//                                                         getVerticalSize(16.00)),
//                                                 child: Text(
//                                                     "lbl_match_s_name".tr,
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     textAlign: TextAlign.left,
//                                                     style: AppStyle
//                                                         .textstyleinterregular15
//                                                         .copyWith(
//                                                             fontSize:
//                                                                 getFontSize(
//                                                                     15)))))
//                                       ])),
//                               Container(
//                                   width: double.infinity,
//                                   margin: EdgeInsets.only(
//                                       top: getVerticalSize(700.00)),
//                                   decoration: BoxDecoration(
//                                       color: ColorConstant.lightBlueA100),
//                                   child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Padding(
//                                             padding: EdgeInsets.only(
//                                                 left: getHorizontalSize(10.00),
//                                                 top: getVerticalSize(5.00),
//                                                 right: getHorizontalSize(10.00),
//                                                 bottom: getVerticalSize(5.00)),
//                                             child: Container(
//                                                 height: getVerticalSize(40.00),
//                                                 width:
//                                                     getHorizontalSize(330.00),
//                                                 child: TextFormField(
//                                                     focusNode: FocusNode(),
//                                                     controller: controller
//                                                         .group15Controller,
//                                                     decoration: InputDecoration(
//                                                         hintText:
//                                                             "lbl_message".tr,
//                                                         hintStyle: AppStyle
//                                                             .textstyleasapromanregular12
//                                                             .copyWith(
//                                                                 fontSize:
//                                                                     getFontSize(
//                                                                         12.0),
//                                                                 color: ColorConstant
//                                                                     .black90066),
//                                                         enabledBorder:
//                                                             OutlineInputBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius.circular(getHorizontalSize(10.00)),
//                                                                 borderSide: BorderSide(color: ColorConstant.black900, width: 1)),
//                                                         focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(getHorizontalSize(10.00)), borderSide: BorderSide(color: ColorConstant.black900, width: 1)),
//                                                         disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(getHorizontalSize(10.00)), borderSide: BorderSide(color: ColorConstant.black900, width: 1)),
//                                                         filled: true,
//                                                         fillColor: ColorConstant.whiteA700,
//                                                         isDense: true,
//                                                         contentPadding: EdgeInsets.only(left: getHorizontalSize(19.00), top: getVerticalSize(11.00), right: getHorizontalSize(30.00), bottom: getVerticalSize(11.00))),
//                                                     style: TextStyle(color: ColorConstant.black90066, fontSize: getFontSize(12.0), fontFamily: 'Asap', fontWeight: FontWeight.w400))))
//                                       ]))
//                             ]))))));
//   }
//
//   onTapMyMatch4() {
//     Get.toNamed(AppRoutes.matchProfilePageScreen);
//   }
//
//   onTapTxtMatchsname() {
//     Get.toNamed(AppRoutes.matchProfilePageScreen);
//   }
// }

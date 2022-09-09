

import 'dart:convert';

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
  late List<Message> reversedMessages;
  final newMessageController = TextEditingController();

  late Stream<ChatWithMatchModel> chatsModel;

  @override
  void initState() {
    super.initState();
    chatsModel = APIService().getPastChats(widget.currEmail, widget.otherEmail);
  }

  @override
  Widget build(BuildContext context){
    print('chat with match page reload');

    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      // Top bar
      appBar: AppBar(
        backgroundColor: ColorConstant.deepOrange300,
        title: Text(widget.otherName,style: AppStyle.textstyleinterregular15.copyWith(
            fontSize: getFontSize(15))),
      ),
      body: StreamBuilder(
        stream: chatsModel,
        builder: (context, AsyncSnapshot<ChatWithMatchModel> snapshot){
          if (snapshot.hasError) {
            print("ChatWithMatchPage something went wrong");
            print(snapshot.error?.toString());
            return Center(child: Text('Something Went Wrong!'));
          } else if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            // if (pastChats != snapshot.data!.pastChats){
            //   setState((){
                pastChats = snapshot.data!.pastChats;
                reversedMessages = List.from(pastChats.reversed);
              // });
            // }


            // pastChats = snapshot.data!.pastChats;
            // reversedMessages = List.from(pastChats.reversed);
            return buildPastChats();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),

    );
  }

  Widget buildPastChats(){
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.fromLTRB(25,20,25,80),
            child: ListView.separated(
              reverse: true,
              // controller: _scrollController,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) =>
              reversedMessages[index].emailFrom == widget.currEmail ?
              _buildMyMessage(reversedMessages[index]):
              _buildOtherMessage(reversedMessages[index]),
              separatorBuilder: (_, index) => SizedBox(height: 20,),
              itemCount: reversedMessages.length,
            ),
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 50,
            // width: 400,
            child: Stack(
              children: [
                TextField(
                  controller: newMessageController,
                  decoration: InputDecoration(
                    // fillColor: ColorConstant.deepOrange50,
                    // filled: true,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: ColorConstant.borderGrey),
                    ),
                    hintText: 'Type your message...',
                    hintStyle: TextStyle(
                      // color: ColorConstant.whiteA700,
                      fontSize: 15,
                    )
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: GestureDetector(
                    onTap: (){
                      sendChat();
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorConstant.sendBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.send,
                        color: ColorConstant.whiteA700,
                        size: 20,
                      ),

                    ),
                  ),
                ),
              ],
            )
          )
        )
      ]
    );
  }

  Widget _buildMyMessage(Message message){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //time
        Text(
          message.timestamp,
          style: AppStyle.textstyleinterregular15.copyWith(
              color: ColorConstant.grey,fontSize: getFontSize(13)),
        ),
        //message
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                // color: ColorConstant.grey,
                width: 1,
                color: ColorConstant.borderGrey,
              ),
            color: ColorConstant.deepOrange50,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),

            )
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 180),
            child: Text(message.content,
              style: TextStyle(
                height: 1.5,
                // color:
              ),

            ),
          )
        ),
      ],
    );
  }

  Widget _buildOtherMessage(Message message){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      //profilePic and message
      children: [
        Row(
          children: [
            //message
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  // color: ColorConstant.grey,
                  color: ColorConstant.borderGrey,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )
              ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 180),
                  child: Text(message.content,
                    style: TextStyle(
                      height: 1.5,
                      // color:
                    ),

                  ),
                )
            )

          ],
        ),

        //time
        Text(
          message.timestamp,
          style: AppStyle.textstyleinterregular15.copyWith(
              color: ColorConstant.grey,fontSize: getFontSize(13)),
        ),
      ],
    );
  }

  imageDecode(String imageSource){
    final decodeBytes = base64Decode(imageSource);
    return Image.memory(decodeBytes);
  }

  sendChat() async{
    if (newMessageController.text != ''){
      NewMessage newMessage = new NewMessage(
          emailFrom: widget.currEmail,
          emailTo: widget.otherEmail,
          content: newMessageController.text
      );
      await APIService().sendChat(newMessage);
      newMessageController.text = '';
    }
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

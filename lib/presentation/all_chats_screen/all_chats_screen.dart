import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:bluewave/data/api/api_client.dart';
import 'models/all_chats_model.dart';
import 'dart:convert';


class AllChatsScreen extends StatefulWidget {
  final String email;

  AllChatsScreen(this.email);

  @override
  AllChatsScreenState createState() => AllChatsScreenState();
}

class AllChatsScreenState extends State<AllChatsScreen> {

  List<ChatUser> chatUsers = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.whiteA700,
      // Top bar
      appBar: AppBar(
        backgroundColor: ColorConstant.deepOrange300,
        title: Text("Chats",style: AppStyle.textstyleinterregular15.copyWith(
            fontSize: getFontSize(15))),
      ),
      body: StreamBuilder(
            stream: APIService().getChatUsers(widget.email),
            builder: (context, AsyncSnapshot<AllChatsModel> snapshot){
              if (snapshot.hasError) {
                print("MainMatchPage something went wrong");
                print(snapshot.error?.toString());
                return Center(child: Text('Something Went Wrong!'));
              } else if (snapshot.hasData) {
                chatUsers = snapshot.data!.matches;
                return SingleChildScrollView(
                    physics: ScrollPhysics(),
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      searchArea(),
                      Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                itemCount: chatUsers.length,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final ChatUser user = chatUsers[index];
                                  return Container(
                                    margin: EdgeInsets.only(
                                        top: 5, bottom: 5, right: 10),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: GestureDetector(
                                      onTap: (){
                                        Get.toNamed(AppRoutes.chatWithMatchScreen, parameters: {
                                          'currEmail': widget.email,
                                          'otherEmail': user.email,
                                          'otherName': user.name,
                                        });
                                      },
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: <Widget>[
                                            Row(
                                                children: <Widget>[
                                                  CircleAvatar(
                                                    radius: 25.0,
                                                    backgroundImage: user
                                                        .profilePic != null
                                                        ? imageDecode(
                                                        user.profilePic!)
                                                        : null,
                                                    backgroundColor: ColorConstant
                                                        .deepOrange300,
                                                    child: user.profilePic == null ?
                                                    Text(user.name[0].toUpperCase(),
                                                      style: AppStyle
                                                          .textstyleinterregular153
                                                          .copyWith(
                                                          fontSize:
                                                          getFontSize(25), color: ColorConstant.whiteA700),
                                                    ): null,
                                                  ),
                                                  SizedBox(width: 5),
                                                  Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Text(
                                                          user.name,
                                                          style: AppStyle
                                                              .textstyleinterregular15
                                                              .copyWith(
                                                              fontSize: getFontSize(
                                                                  15),
                                                              color: ColorConstant
                                                                  .black900),
                                                        ),
                                                        SizedBox(height: 5.0,),
                                                        Container(
                                                          width: MediaQuery.of(context).size.width * 0.5,
                                                          child: Text(
                                                            user.content,
                                                            style: TextStyle(
                                                              color: user
                                                                  .isMessageRead
                                                                  ? ColorConstant
                                                                  .grey
                                                                  : ColorConstant
                                                                  .black900,
                                                              fontWeight: user
                                                                  .isMessageRead
                                                                  ? null
                                                                  : FontWeight.bold,

                                                            ),
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                          ),
                                                        ),
                                                      ]
                                                  ),
                                                ]
                                            ),
                                            Column(
                                                children: <Widget>[
                                                  Text(user.time),

                                                ]
                                            )
                                          ]
                                      ),
                                    )
                                  );
                                }
                            ),
                          )
                      ),
                    ]
                ),
                );
              }
              return Center(child: CircularProgressIndicator());
              },
      ),
      // The bottom navigation bar
      bottomNavigationBar: myNavBar(),
    );
  }

  Widget searchArea(){
    return TextField(
      decoration: InputDecoration(
          hintText: "email",   //"Search...",
          hintStyle: TextStyle(color: ColorConstant.bluegray100),
          prefixIcon: Icon(Icons.search,color: ColorConstant.bluegray100, size: 20,),
          contentPadding: EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          )
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
            onPressed: (){
              Get.toNamed(AppRoutes.personalProfileScreen, arguments: widget.email);
            },
            child: Icon(Icons.person_outline,color: ColorConstant.whiteA700,size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
        ],
      ),
    );
  }

  imageDecode(String imageSource){
    final decodeBytes = base64Decode(imageSource);
    return Image.memory(decodeBytes);
  }

}
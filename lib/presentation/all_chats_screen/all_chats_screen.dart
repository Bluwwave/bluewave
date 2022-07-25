import 'package:bluewave/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:bluewave/data/api/api_client.dart';
import 'models/all_chats_model.dart';


class AllChatsScreen extends StatelessWidget{
  final String email;
  AllChatsScreen(this.email);

  Future<AllChatsModel> getRecentChats() async{
    print("getRecentChats");
    AllChatsModel getRecentChats = await APIService().getRecentChats(widget.email);
    print("getRecentChats finished");
    return getRecentChats;
  }

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
      body: SingleChildScrollView(
        //physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                    hintText: email,   //"Search...",
                    hintStyle: TextStyle(color: ColorConstant.bluegray100),
                    prefixIcon: Icon(Icons.search,color: ColorConstant.bluegray100, size: 20,),
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              //ConversationList(email),
              // call stateful widget - pass email
              //ListView.builder(
              /*
              itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return ConversationList(
                    name: chatUsers[index].name,
                    messageText: chatUsers[index].messageText,
                    imageUrl: chatUsers[index].imageURL,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3)?true:false,
                  );
                },
                */
              //),
            ]
        ),
      ),
      // The bottom navigation bar
      bottomNavigationBar: myNavBar(),
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
            onPressed: (){},
            child: Icon(Icons.sms_outlined,color: ColorConstant.whiteA700,size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
          // Match Page icon
          FloatingActionButton(
            onPressed: (){
              Get.toNamed(AppRoutes.mainMatchesPageScreen);
            },
            child: Icon(Icons.home_outlined,color: ColorConstant.whiteA700,size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
          // Profile page icon
          FloatingActionButton(
            onPressed: (){
              Get.toNamed(AppRoutes.personalProfileScreen);
            },
            child: Icon(Icons.person_outline,color: ColorConstant.whiteA700,size: 30,),
            backgroundColor: ColorConstant.lightBlueA100,
            elevation: 0,
          ),
        ],
      ),
    );
  }
}


ListView middle(chatUsers) {
  return ListView.builder(
      itemCount: chatUsers.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 15),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ConversationList(
          nameFrom: chatUsers[index].nameFrom,
          content: chatUsers[index].content,
          imageUrl: chatUsers[index].imageURL,
          timestamp: chatUsers[index].timestamp,
          //isMessageRead: (index == 0 || index == 3)?true:false,
        );
      }
  );
}


// Class for inner converstations which should be updated everytime
// the user recieves messages
class ConversationList extends StatefulWidget{
  final String email;
  //String nameFrom;
  //String nameTo;
  //String imageUrl;
  //String timestamp;
  //String content;
  //bool isMessageRead;
  ConversationList(this.email);

  /*
  ConversationList({
    //required this.email,
    //required this.nameFrom,
    //required this.nameTo,
    //required this.imageUrl,
    //required this.timestamp,
    //required this.content,
    //required this.isMessageRead
  });
  */

  @override
  _ConversationListState createState() => _ConversationListState();
}


class _ConversationListState extends State<ConversationList> {

  Future<AllChatsModel>? chatUsers;
  AllChatsModel? currUsers;

  @override
  void initState(){
    super.initState();
    print("initial state");
    chatUsers  = getRecentChats();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: chatUsers,
            builder: (BuildContext context, AsyncSnapshot<AllChatsModel> snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print("Chats page something went wrong :(");
                return Center(child: Text('Something Went Wrong!'));
              } else if (snapshot.hasData) {
                // can do things with snapshot here
                currUsers = snapshot.data;
                return buildbubbles();
              } else {
                print("Error: No data for users in all chats page");
                return ConversationList(widget.email);
              }
            }
        )
    );
  }


  buildbubbles() {
    return GestureDetector(
      onTap: (){
      },
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    // backgroundImage: NetworkImage(widget.imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.nameFrom, style: TextStyle(fontSize: 15),),
                          SizedBox(height: 6,),
                          Text(widget.content,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(widget.timestamp,style: TextStyle(fontSize: 13,fontWeight: widget.isMessageRead?FontWeight.bold:FontWeight.normal),),
          ],
        ),
      ),
    );
  }
}
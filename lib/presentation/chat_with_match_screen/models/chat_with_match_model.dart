import 'dart:convert';

class Message{
  String emailFrom;
  String timestamp;
  String content;

  Message({
    required this.emailFrom,
    required this.timestamp,
    required this.content,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    emailFrom: json['emailFrom'],
    timestamp: json['timestamp'],
    content: json['content'],
  );


}
//
// class UserInfo{
//   String name;
//   String profilePic;
//
//   UserInfo({
//     required this.name,
//     required this.profilePic,
//   });
//
//   factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
//     name: json['name'],
//     profilePic: json['profilePic'],
//
//   );
//
// }
//
//

class ChatWithMatchModel{
  Map<String, dynamic> userInfo;
  List<Message> pastChats;
  // List<Message> messages;

  ChatWithMatchModel({
    required this.userInfo,
    required this.pastChats,
  });

  factory ChatWithMatchModel.fromJson(Map<String, dynamic> json){
    //convert userInfo into a map
    var map = json['userInfo'] as Map<String, dynamic>;
    map.forEach((key, value) {
      value = Map<String, dynamic>.from(map);
    });

    //convert pastChats into a list of Message
    var list = json['pastChats'] as List;
    List<Message>? messages = list.map((i) => Message.fromJson(i)).toList();

    return ChatWithMatchModel(userInfo: map, pastChats: messages);
  }



}

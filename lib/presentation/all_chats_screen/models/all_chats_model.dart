
// Version with firebase backend
class ChatUser {
  final String email;
  final String name;
  final bool isMessageRead;
  final String time;
  final String content;
  final String? profilePic;


  const ChatUser({
    required this.email,
    required this.name,
    required this.isMessageRead,
    required this.time,
    required this.content,
    this.profilePic,
  });

  // factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
  //   name: json['name'],
  //   isMessageRead: json['isMessageRead'],
  //   time: json['time'],
  //   content: json['content'],
  //   imageUrl: json['imageUrl'],
  // );

  factory ChatUser.fromJson(Map<String, dynamic> json){
    ChatUser result = ChatUser(
      email: json['email'],
      name: json['name'],
      isMessageRead: json['isMessageRead'],
      time: json['time'],
      content: json['content'],
      profilePic: json['imageUrl'],
    );
    return result;
  }




}

class AllChatsModel{
  List<ChatUser> matches;

  AllChatsModel({
    required this.matches,
  });

  factory AllChatsModel.fromJson(Map<String, dynamic> json) {
    print("hi");
    var list = json['chatUsers'] as List;
    List<ChatUser>? chatUsers = list.map((i) => ChatUser.fromJson(i)).toList();
    print("HI");
    return AllChatsModel(
        matches: chatUsers
    );
  }

}
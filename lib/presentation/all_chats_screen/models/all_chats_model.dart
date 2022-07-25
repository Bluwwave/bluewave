
// Version with firebase backend
class ChatUser {
  final String name;
  final String imageUrl;
  final String content;
  final String time;

  const ChatUser(
      {required this.name,
        required this.imageUrl,
        required this.content,
        required this.time});
}

class AllChatsModel{
  String nameFrom;
  String nameTo;
  String imageUrl;
  String timestamp;
  String content;
  bool isMessageRead;

  AllChatsModel({
    required this.nameFrom,
    required this.nameTo,
    required this.imageUrl,
    required this.timestamp,
    required this.content,
    required this.isMessageRead
  });

  factory AllChatsModel.fromJson(Map<String, dynamic> json) => AllChatsModel(
    nameFrom: json["nameFrom"],
    nameTo: json["nameTo"],
    imageUrl: json["profile_pic_user"],
    timestamp: json["time"],
    content: json["content"],
    isMessageRead: json["readFlag"],
  );

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      'nameFrom': nameFrom,
      'nameTo': nameTo,
      'imageUrl': imageUrl,
      'timestamp': timestamp,
      'content': content,
      'isMessageRead': isMessageRead
    };
    return map;
  }
}
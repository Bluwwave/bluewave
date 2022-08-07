//
// // Version with firebase backend
// class ChatUser {
//   final String name;
//   final String imageUrl;
//   final String content;
//   final String time;
//   final bool isMessageRead;
//
//   const ChatUser(
//       {required this.name,
//         required this.imageUrl,
//         required this.content,
//         required this.time,
//         required this.isMessageRead,
//       });
// }
//
// class AllChatsModel{
//   List<ChatUser> matches;
//
//   AllChatsModel({
//     required this.matches,
//   });
//
//   factory AllChatsModel.fromJson(Map<String, dynamic> json) => AllChatsModel(
//     matches: json[""], //get a list of ChatUsers
//   );
//
//   Map<String, dynamic> toJson(){
//     Map<String, dynamic> map = {
//       'nameFrom': nameFrom,
//       'nameTo': nameTo,
//       'imageUrl': imageUrl,
//       'timestamp': timestamp,
//       'content': content,
//       'isMessageRead': isMessageRead
//     };
//     return map;
//   }
// }
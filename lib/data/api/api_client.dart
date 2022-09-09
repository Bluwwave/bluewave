import 'package:bluewave/core/app_export.dart';
import 'package:bluewave/presentation/main_matches_page_screen/models/main_matches_page_model.dart';
import 'package:bluewave/presentation/profile_changing_page_screen/models/profile_changing_page_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../presentation/all_chats_screen/models/all_chats_model.dart';
import '../../presentation/chat_with_match_screen/models/chat_with_match_model.dart';
import '../../presentation/login_page_screen/models/login_page_model.dart';
import '../../presentation/mandatory_info_page_screen/models/mandatory_info_page_model.dart';
import '../../presentation/personal_profile_screen/models/personal_profile_model.dart';

class APIService {
  final url = "https://bluewave.mlbrains.com";
  final bool running = true;

  Future<LoginResponseModel> login(UserModel user) async{
    String loginUrl = url + "/login";

    // print("useremail: " + user.email.toString());
    final response = await http.post(Uri.parse(loginUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': user.email}));
    // print("api login response body: " + response.body);
    final message = json.decode(response.body);
    // print("api login print: " + message.toString());
    if (response.statusCode == 200 || response.statusCode == 400){
      // print(LoginResponseModel.fromJson(message));
      return LoginResponseModel.fromJson(message);
    } else if (response.statusCode == 500){
      throw Exception('Failed to load data');
    } else {
      throw Exception('Unknown error');
    }
    // return LoginResponseModel.fromJson(json.decode(response.body));
  }

  Future<void> storeMandatoryInfo(MandatoryInfoModel user) async{
    String infoUrl = url + "/mandatory_signup";
    await http.post(Uri.parse(infoUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': user.email, 'first_name': user.firstName, 'last_name': user.lastName }));
  }

  Future<InitialProfileModel> getChoices(String? email) async{
    String getProfileUrl = url + "/get_profile";
    final response = await http.post(Uri.parse(getProfileUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': email}));
    final message = json.decode(response.body);
    print(InitialProfileModel.fromJson(message));
    InitialProfileModel initialProfile = InitialProfileModel.fromJson(message);
    return InitialProfileModel.fromJson(message);
  }

  Future<void> updateProfileInfo(UpdatedProfileModel updatedProfile) async{
    String updateProfileUrl = url + "/optional_signup";
    await http.post(Uri.parse(updateProfileUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode(updatedProfile));
  }

  Future<PersonalProfileModel> getUserProfile(String? email) async{
    String getProfileUrl = url + "/get_profile";
    final response = await http.post(Uri.parse(getProfileUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': email}));
    final message = json.decode(response.body);
    return PersonalProfileModel.fromJson(message);
  }

  Future<MainMatchPageModel> getMatches(String email) async{
    String getMatchesUrl = url + "/get_matches";
    final response = await http.post(Uri.parse(getMatchesUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': email}));
    final message = jsonDecode(response.body);
    return MainMatchPageModel.fromJson(message, response.statusCode);
  }


  Stream<AllChatsModel> getChatUsers(String email) async*{
    String getChatUsersUrl = url + "/get_recent_chats";
    while (running){
      await Future.delayed(Duration(seconds: 10));
      var response = await http.post(Uri.parse(getChatUsersUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': email}));
      var message = jsonDecode(response.body);
      print(message);
      AllChatsModel result = AllChatsModel.fromJson(message);
      yield result;
    }
    // yield AllChatsModel.fromJson(message);

  }

  Stream<ChatWithMatchModel> getPastChats(String currEmail, String otherEmail) async*{
    String getPastChatsUrl = url + "/get_past_chats";
    while (running){
      await Future.delayed(Duration(seconds: 5));
      var response = await http.post(Uri.parse(getPastChatsUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'emailCurr': currEmail, 'emailOther': otherEmail}));
      var message = jsonDecode(response.body);
      print(message);
      ChatWithMatchModel result = ChatWithMatchModel.fromJson(message);
      yield result;
    }
  }

  Future<void> sendChat(NewMessage newMessage) async{
    String sendChatUrl = url + "/send_chat";
    await http.post(Uri.parse(sendChatUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: json.encode(newMessage));
  }



  // Get list of users that current user can chat with from backend
  // the response should contain names of user, imageUrl, timestamp, content of most recent message, isMessageRead
  // Future<AllChatsModel> getRecentChats(MandatoryInfoModel user) async{
  //   String infoUrl = url + "/get_recent_chats";
  //   final response = await http.post(Uri.parse(infoUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': user.email}));
  //   return AllChatsModel.fromJson(json.decode(response.body));
  // }

/*
  // Get list of all chats from current user with person user is chatting with now
  // response contains name of user sending message, message content, image url, timestamp, is MessageRead (always true)
  // This tap should change isMessageRead to True
  Future<AllChatsModel> getPastChats(MandatoryInfoModel user) async{
    String infoUrl = url + "/get_past_chats";
    final response = await http.post(Uri.parse(infoUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': user.email}));
    return AllChatsModel.fromJson(json.decode(response.body));
  }

  // On send - when user is chatting with match
  // send user email of user, message content, timestamp
  // do not need to catch response
  Future<void> storeChats(MandatoryInfoModel user) async{
    String infoUrl = url + "/store_chats";
    await http.post(Uri.parse(infoUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': user.email}));
  }
*/
}

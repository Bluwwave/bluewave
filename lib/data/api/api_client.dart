import 'package:bluewave/core/app_export.dart';
import 'package:bluewave/presentation/main_matches_page_screen/models/main_matches_page_model.dart';
import 'package:bluewave/presentation/profile_changing_page_screen/models/profile_changing_page_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../presentation/all_chats_screen/models/all_chats_model.dart';
import '../../presentation/login_page_screen/models/login_page_model.dart';
import '../../presentation/mandatory_info_page_screen/models/mandatory_info_page_model.dart';
import '../../presentation/personal_profile_screen/models/personal_profile_model.dart';

class APIService {
  final url = "https://bluewave.mlbrains.com";

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
    print("get choices api calling");
    final response = await http.post(Uri.parse(getProfileUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': email}));
    final message = json.decode(response.body);
    print("get choices response: " + message.toString());
    print("hello");
    print(InitialProfileModel.fromJson(message));
    InitialProfileModel initialProfile = InitialProfileModel.fromJson(message);
    print("after");
    print(initialProfile.toString());
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
    print(PersonalProfileModel.fromJson(message));
    return PersonalProfileModel.fromJson(message);
  }

  Future<MainMatchPageModel> getMatches(String email) async{
    String getMatchesUrl = url + "/get_matches";
    final response = await http.post(Uri.parse(getMatchesUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': email}));
    final message = jsonDecode(response.body);
    print("get matches api");
    return MainMatchPageModel.fromJson(message, response.statusCode);
  }


  // Get list of users that current user can chat with from backend
  // the response should contain names of user, imageUrl, timestamp, content of most recent message, isMessageRead
  Future<AllChatsModel> getRecentChats(MandatoryInfoModel user) async{
    String infoUrl = url + "/get_recent_chats";
    final response = await http.post(Uri.parse(infoUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': user.email}));
    return AllChatsModel.fromJson(json.decode(response.body));
  }

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

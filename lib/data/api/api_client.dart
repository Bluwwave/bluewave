import 'package:bluewave/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../presentation/login_page_screen/models/login_page_model.dart';
import '../../presentation/mandatory_info_page_screen/models/mandatory_info_page_model.dart';

class APIService {
  final url = "https://bluewave.mlbrains.com";

  Future<LoginResponseModel> login(UserModel user) async{
    String loginUrl = url + "/login";

    print("useremail: " + user.email.toString());
    final response = await http.post(Uri.parse(loginUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': user.email}));
    print("response body: " + response.body);
    final message = json.decode(response.body);
    print("api print: " + message.toString());
    if (response.statusCode == 200 || response.statusCode == 400){
      print(LoginResponseModel.fromJson(message));
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
    print(user.firstName);
    print(user.lastName);
    print(user.email);
    http.put(Uri.parse(infoUrl), headers:{'content-type': 'application/json; charset=UTF-8'}, body: jsonEncode({'email': user.email, 'first_name': user.firstName, 'last_name': user.lastName }));
  }
}

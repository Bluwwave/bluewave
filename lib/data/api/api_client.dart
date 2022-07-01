import 'package:bluewave/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../presentation/login_page_screen/models/login_page_model.dart';

class APIService {
  final url = "https://bluewave.mlbrains.com";

  Future<LoginResponseModel> login(UserModel user) async{
    String loginUrl = url + "/login";

    final response = await http.post(Uri.parse(loginUrl), body: jsonEncode(user));
    // if (response.statusCode == 200 || response.statusCode == 400){
    //   return LoginResponseModel.fromJson(json.decode(response.body));
    // } else {
    //   throw Exception('Failed to load data');
    // }
    return LoginResponseModel.fromJson(json.decode(response.body));
  }
}

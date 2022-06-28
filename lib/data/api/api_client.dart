import 'package:bluewave/core/app_export.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../presentation/login_page_screen/models/login_page_model.dart';

class APIService {
  Future<LoginResponseModel> login(UserModel user) async{
    String url = "http://127.0.0.1:8000/login";

    final response = await http.post(Uri.parse(url), body: jsonEncode(user);
        if (response.statusCode == 200 || response.statusCode == 400){
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
    throw Exception('Failed to load data');
    }
  }
}

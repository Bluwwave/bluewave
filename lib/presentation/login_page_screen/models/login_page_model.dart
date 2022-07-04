import 'dart:convert';

class LoginResponseModel{
  final String? pageToGo;
  final int? statuscode;

  LoginResponseModel({this.pageToGo, this.statuscode});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    pageToGo: json["profile_status"],
    statuscode: json["statuscode"], //this will be the status from api, name might be different
  );



  // final String? token;
  // final String? error;
  //
  // LoginResponseModel({this.token, this.error});
  //
  // factory LoginResponseModel.fromJson(Map<String, dynamic> json){
  //   return LoginResponseModel(token: json["token"] != null ? json["token"]:"", error: json["error"] != null ? json["error"]: "",);
  // }
}

class UserModel{
  String? email;

  UserModel({
    required this.email,
  });

  // factory UserModel.fromJson(Map<String, dynamic> json){
  //   return UserModel(email: json['email'] ?? "");
  // }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      'email': email?.trim(),
    };
    return map;
  }

}

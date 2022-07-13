import 'dart:io';
import 'dart:convert';

class InitialProfileModel{
  // final List<String> hobbies;
  // final List<String> lookingFor;
  // final List<String>? chosenHobbies;
  // final List<String>? chosenLookingFor;
  // final String? aboutYou;
  // final File? profilePic;
  //
  // InitialProfileModel({required this.hobbies, required this.lookingFor,
  //   this.chosenHobbies, this.chosenLookingFor, this.aboutYou, this.profilePic});
  //
  // factory InitialProfileModel.fromJson(Map<String, dynamic> json) => InitialProfileModel(
  //   hobbies: json['hobbies_choices'],
  //   lookingFor: json['looking_for_choices'],
  //   chosenHobbies: json['hobbies'],
  //   chosenLookingFor: json['looking_for'],
  //   aboutYou: json['about_you'],
  //   profilePic: json['profile_pic'],
  // );

  final List<String>? hobbies;
  final List<String>? lookingFor;
  final List<int>? chosenHobbies;
  final List<int>? chosenLookingFor;
  final String? aboutYou;

  InitialProfileModel({required this.hobbies, required this.lookingFor,
    this.chosenHobbies, this.chosenLookingFor, this.aboutYou});

  factory InitialProfileModel.fromJson(Map<String, dynamic> json) => InitialProfileModel(
      hobbies: json['hobbies_choices'] != null ? List.from(json['hobbies_choices']) : null,
      lookingFor: json['looking_for_choices'] != null ? List.from(json['looking_for_choices']) : null,
      chosenHobbies: json['hobbies'] != null ? List.from(json['hobbies']) : null,
      chosenLookingFor: json['looking_for'] != null ? List.from(json['looking_for']) : null,
      aboutYou: json['about_you'],
    );
}

class UpdatedProfileModel{
  final String email;
  final List<int> chosenHobbies;
  final List<int> chosenLookingFor;
  final String aboutYou;
  final String? profilePic;

  UpdatedProfileModel({required this.email, required this.chosenHobbies,
    required this.chosenLookingFor, required this.aboutYou, required this.profilePic});

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      'email': email,
      'chosenHobbies': chosenHobbies,
      'chosenLookingFor': chosenLookingFor,
      'aboutYou': aboutYou,
      'profilePic': profilePic,
    };
    return map;
  }




}

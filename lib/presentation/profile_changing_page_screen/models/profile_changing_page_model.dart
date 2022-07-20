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
  final String? profilePic;

  InitialProfileModel({
    required this.hobbies,
    required this.lookingFor,
    this.chosenHobbies,
    this.chosenLookingFor,
    this.aboutYou,
    this.profilePic
  });

  // factory InitialProfileModel.fromJson(Map<String, dynamic> json) => InitialProfileModel(
  //     hobbies: json['hobbies_choices'] != null ? List<String>.from(json['hobbies_choices']) : [],
  //     lookingFor: json['looking_for_choices'] != null ? List<String>.from(json['looking_for_choices']) : [],
  //     chosenHobbies: json['hobbies'] != null ? List<int>.from(json['hobbies']) : [],
  //     chosenLookingFor: json['looking_for'] != null ? List<int>.from(json['looking_for']) : [],
  //     aboutYou: json['about_you'],
  //     profilePic: json['profile_pic']
  //   );


  factory InitialProfileModel.fromJson(Map<String, dynamic> json) {
    print("json" + json.toString());
    List<String> testingHobbies;
    json['hobbies_choices'] != null ? testingHobbies = List<String>.from(
        json['hobbies_choices']) : testingHobbies = [];
    print("testingHobbies" + testingHobbies.toString());
    List<String> testingChosenHobbies;
    print(json['hobbies']);
    String testing = json['hobbies'];
    print(testing);
    print(List.from(json['hobbies']));
    json['hobbies'] != null ? testingChosenHobbies = List<String>.from(json['hobbies']) : testingChosenHobbies = [];
    print("testingChosenHobbies" + testingChosenHobbies.toString());

    return InitialProfileModel(
        hobbies: json['hobbies_choices'] != null ? List<String>.from(json['hobbies_choices']) : [],
        lookingFor: json['looking_for_choices'] != null ? List<String>.from(json['looking_for_choices']) : [],
        chosenHobbies: json['hobbies'] != null ? List<int>.from(json['hobbies']) : [],
        chosenLookingFor: json['looking_for'] != null ? List<int>.from(json['looking_for']) : [],
        aboutYou: json['about_you'],
        profilePic: json['profile_pic']
    );

  }

  }


class UpdatedProfileModel{
  final String email;
  final List<int>? chosenHobbies;
  final List<int>? chosenLookingFor;
  final String? aboutYou;
  final String? profilePic;

  UpdatedProfileModel({
    required this.email,
    required this.chosenHobbies,
    required this.chosenLookingFor,
    required this.aboutYou,
    required this.profilePic
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      'email': email,
      'hobbies': chosenHobbies,
      'looking_for': chosenLookingFor,
      'about_you': aboutYou,
      'profile_pic': profilePic,
    };
    return map;
  }
}

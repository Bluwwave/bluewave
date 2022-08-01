class PersonalProfileModel {

  final String name;
  // final List<String>? hobbies;
  final String? aboutYou;
  final String? profilePic;
  final List<String> hobbiesChoices;
  final List<int>? chosenHobbies;


  PersonalProfileModel({
    required this.name,
    this.aboutYou,
    this.profilePic,
    required this.hobbiesChoices,
    required this.chosenHobbies,
  });

  factory PersonalProfileModel.fromJson(Map<String, dynamic> json) => PersonalProfileModel(
    name: json['name'],
    // hobbies: json['hobbies'] != null ? List<String>.from(json['hobbies_choices']) : [],
    aboutYou: json['about_you'],
    profilePic: json['profile_pic'],
    hobbiesChoices: json['hobbies_choices'] != null ? List<String>.from(json['hobbies_choices']) : [],
    chosenHobbies: json['hobbies'] != null ? List<int>.from(json['hobbies']) : [],
  );

}

class PersonalProfileModel {

  final String name;
  // final List<String>? hobbies;
  final String? aboutYou;
  final String? profilePic;

  PersonalProfileModel({
    required this.name,
    // required this.hobbies,
    this.aboutYou,
    this.profilePic
  });

factory PersonalProfileModel.fromJson(Map<String, dynamic> json) => PersonalProfileModel(
    name: json['name'],
    // hobbies: json['hobbies'] != null ? List<String>.from(json['hobbies_choices']) : [],
    aboutYou: json['about_you'],
    profilePic: json['profile_pic']
  );

}

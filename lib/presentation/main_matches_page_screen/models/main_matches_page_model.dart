class MatchModel {
  String name;
  String? profilePic;
  String email;

  MatchModel({
    required this.name,
    this.profilePic,
    required this.email});

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
    name: json['name'],
    profilePic: json['profile_pic'],
    email: json['email']
  );
}

class MainMatchPageModel {
  List<MatchModel>? matches;

  MainMatchPageModel({ this.matches});

  factory MainMatchPageModel.fromJson(Map<String, dynamic> json) => MainMatchPageModel(
    matches: json['matches'] != null ? List<MatchModel>.from(json['hobbies_choices']) : [],
  );
}

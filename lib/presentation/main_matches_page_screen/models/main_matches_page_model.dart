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
  MatchModel matchForToday;
  List<MatchModel>? matches;

  MainMatchPageModel({required this.matchForToday, this.matches});

  factory MainMatchPageModel.fromJson(Map<String, dynamic> json) => MainMatchPageModel(
    matchForToday: MatchModel.fromJson(json['match']),
    matches: json['matches'] != null ? List<MatchModel>.from(json['hobbies_choices']) : [],
  );
}

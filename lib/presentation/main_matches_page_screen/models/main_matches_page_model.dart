class MatchModel {
  String firstName;
  String lastName;
  String? profilePic;
  String email;

  MatchModel({
    required this.firstName,
    required this.lastName,
    this.profilePic,
    required this.email
  });

  // factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
  //   firstName: json['first_name'],
  //   lastName: json['last_name'],
  //   profilePic: json['profile_pic'],
  //   email: json['email']
  // );

  factory MatchModel.fromJson(Map<String, dynamic> json){
    return MatchModel(
        firstName: json['first_name'],
        lastName: json['last_name'],
        profilePic: json['profile_pic'],
        email: json['email']
    );

  }
}

class MainMatchPageModel {

  bool hasMatchForToday;
  MatchModel? matchForToday;
  List<MatchModel>? pastMatches;

  MainMatchPageModel({required this.hasMatchForToday, this.matchForToday, this.pastMatches});

  // factory MainMatchPageModel.fromJson(Map<String, dynamic> json) => MainMatchPageModel(
  //   matches: json['matches'] != null ? List<MatchModel>.from(json['matches']) : [],
  // );

  factory MainMatchPageModel.fromJson(Map<String, dynamic> json, int statusCode){
    var hasMatch = false;
    if (statusCode == 200){
      hasMatch = true;
    }
    var list = json['matches'] as List;
    List<MatchModel>? matches = list.map((i) => MatchModel.fromJson(i)).toList();
    return MainMatchPageModel(
        hasMatchForToday: hasMatch,
        matchForToday: hasMatch ? matches[0] : null,
        pastMatches: hasMatch ? matches.sublist(1) : matches
    );
  }
}

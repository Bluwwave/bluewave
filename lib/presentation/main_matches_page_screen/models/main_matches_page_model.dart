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
  List<MatchModel>? matches;

  MainMatchPageModel({this.matches});

  // factory MainMatchPageModel.fromJson(Map<String, dynamic> json) => MainMatchPageModel(
  //   matches: json['matches'] != null ? List<MatchModel>.from(json['matches']) : [],
  // );

  factory MainMatchPageModel.fromJson(Map<String, dynamic> json){
    print("model:" + json.toString());
    var list = json['matches'] as List;
    print("list: " + list.toString());
    List<MatchModel>? pastMatches = list.map((i) => MatchModel.fromJson(i)).toList();
    print("pastMatches");
    return MainMatchPageModel(matches: pastMatches);
    // List<MatchModel>? pastMatches = List<MatchModel>.from(json['matches']);
    // print(pastMatches);
    // return MainMatchPageModel(matches: pastMatches);
  }
}

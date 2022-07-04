class MandatoryInfoModel{
  String? email;
  String? firstName;
  String? lastName;

  MandatoryInfoModel({
    required this.email,
    required this.firstName,
    required this.lastName
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      'email': email?.trim(),
      'first_name': firstName,
      'last_name': lastName,
    };
    return map;
  }
}
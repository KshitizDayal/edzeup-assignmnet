class UserData {
  String? name;
  String? email;
  String? phoneNumber;
  int? role;
  int? location;
  int? assessment;

  UserData(
      {this.name,
      this.email,
      this.phoneNumber,
      this.role,
      this.location,
      this.assessment});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    role = json['role'];
    location = json['location'];
    assessment = json['assessment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['role'] = role;
    data['location'] = location;
    data['assessment'] = assessment;
    return data;
  }
}

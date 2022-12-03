class UserDetail {
  final String userName;
  final String email;

  UserDetail({required this.email, required this.userName});

  factory UserDetail.fromJson(dynamic json) {
    return UserDetail(
        userName: json["username"] as String,
        email: json["email"] as String);
  }
}

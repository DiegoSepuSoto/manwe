class User {
  User({
    required this.fullName,
    required this.email,
    required this.career,
    required this.token,
    required this.refreshToken,
  });

  String fullName;
  String email;
  String career;
  String token;
  String refreshToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
    fullName: json["full_name"],
    email: json["email"],
    career: json["career"],
    token: json["token"],
    refreshToken: json["refresh_token"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "email": email,
    "career": career,
    "token": token,
    "refresh_token": refreshToken,
  };
}

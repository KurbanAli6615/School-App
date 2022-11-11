class UserCreateModel {
  UserCreateModel({
    required this.name,
    required this.email,
    required this.fcm,
    required this.mobile,
    required this.userId,
    required this.userType,
  });

  String name;
  String email;
  String fcm;
  String mobile;
  String userId;
  String userType;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'userId': userId,
      'fcm': fcm,
      'mobile': mobile,
      'createdAt': DateTime.now().toIso8601String(),
      'userType': userType,
    };
  }
}

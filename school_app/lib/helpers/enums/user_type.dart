enum UserType { student, teacher, unknown }

class UserTypeHelper {
  static String getValue(UserType userType) {
    switch (userType) {
      case UserType.student:
        return "STUDENT";
      case UserType.teacher:
        return "TEACHER";
      case UserType.unknown:
        return "UNKNOWN";
      default:
        return 'UNKNOWN';
    }
  }

  static UserType getEnum(String userType) {
    if (userType == getValue(UserType.student)) {
      return UserType.student;
    } else if (userType == getValue(UserType.teacher)) {
      return UserType.teacher;
    } else {
      return UserType.unknown;
    }
  }
}

class UserModel {
  final String userName;
  final String surName;

  UserModel(this.userName, this.surName);

  String get shortName => "${userName[0]}${surName[0]}";
  String get fullName => "${userName} ${surName}";

  factory UserModel.fake() {
    return UserModel("Burak", "Yavas");
  }
}

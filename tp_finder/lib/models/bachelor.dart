import 'e_gender.dart';

class Bachelor {
  late String firstName;
  late String lastName;
  late Gender gender;
  late String avatar;
  late List<Gender> lookingFor;
  late String job;
  late String description;

  Bachelor(String firstName, String lastName, Gender gender, String avatar,
      List<Gender> lookingFor, String job, String description) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.gender = gender;
    this.avatar = avatar;
    this.lookingFor = lookingFor;
    this.job = job;
    this.description = description;
  }
}

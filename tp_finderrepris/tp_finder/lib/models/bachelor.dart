// import 'package:flutter/material.dart';
// import 'package:tp_finder/models/bachelor_manager.dart';

import 'e_gender.dart';

class Bachelor {
  Bachelor(
    this.firstName,
    this.lastName,
    this.gender,
    this.avatar,
    this.lookingFor,
    this.job,
    this.description,
    this.liked,
  );

  String firstName;
  String lastName;
  Gender gender;
  String avatar;
  List<Gender> lookingFor;
  String job;
  String description;
  bool liked;
}

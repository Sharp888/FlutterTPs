import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'bachelor.dart';
import 'e_gender.dart';

class BachelorProvider extends ChangeNotifier {
  List<Bachelor> bachelors = [];

  BachelorProvider() {
    bachelors = generate30Bachelors();
  }

  void likeDislike(Bachelor bachelor) {
    bachelor.liked = !bachelor.liked;
    notifyListeners();
  }

  List<Bachelor> generate30Bachelors() {
    var faker = Faker();
    List<Bachelor> currentBachelors = <Bachelor>[];
    int numberGenerated = 15;
    List<Gender> lookingFor = [Gender.male, Gender.female];
    String avatar;

    for (int i = 0; i < numberGenerated; i++) {
      avatar = 'assets/images/man-';
      avatar += (i + 1).toString();
      avatar += ".png";

      Bachelor current = Bachelor(
          faker.person.firstName(),
          faker.person.lastName(),
          Gender.male,
          avatar,
          lookingFor,
          faker.job.title(),
          faker.lorem.sentences(5).toString(),
          false);

      currentBachelors.add(current);
    }

    for (int i = 0; i < numberGenerated; i++) {
      avatar = 'assets/images/woman-';
      avatar += (i + 1).toString();
      avatar += ".png";

      Bachelor current = Bachelor(
          faker.person.firstName(),
          faker.person.lastName(),
          Gender.female,
          avatar,
          lookingFor,
          faker.job.title(),
          faker.lorem.sentences(5).toString(),
          false);

      currentBachelors.add(current);
    }
    return currentBachelors;
  }
}

import 'e_gender.dart'; // Assuming this is where your Gender enum is defined
import 'bachelor.dart'; // Assuming this is the file where your Bachelor class is defined
import 'package:faker/faker.dart';

class BachelorManager {
  var faker = Faker();
  List<Bachelor> currentBachelors = <Bachelor>[];

  List<Bachelor> generate30Bachelors() {
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

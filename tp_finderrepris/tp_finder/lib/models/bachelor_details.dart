import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bachelor.dart';
import 'bachelor_provider.dart';
import 'e_gender.dart';

class BachelorDetailsPage extends StatelessWidget {
  final int index;
  const BachelorDetailsPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 128, 165),
      appBar: AppBar(
        title: const Text('Profile Details'),
      ),
      body: Center(
        child: Consumer<BachelorProvider>(
          builder: (context, bachelorProvider, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child:
                        Image.asset(bachelorProvider.bachelors[index].avatar),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        bachelorProvider
                            .likeDislike(bachelorProvider.bachelors[index]);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            notifyWithSnackbar(
                                bachelorProvider.bachelors[index]));
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 100,
                        color: bachelorProvider.bachelors[index].liked
                            ? Colors.red
                            : const Color.fromRGBO(189, 189, 189, 0.5),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                  "${bachelorProvider.bachelors[index].firstName} ${bachelorProvider.bachelors[index].lastName}"),
              Text(
                  "Gender Identity: ${genderText(bachelorProvider.bachelors[index].gender)}"),
              GestureDetector(
                child: Icon(
                  Icons.block,
                  color: Colors.red[800],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String genderText(Gender gender) {
    if (gender == Gender.male) {
      return "Man";
    } else {
      return "Woman";
    }
  }

  SnackBar notifyWithSnackbar(Bachelor bachelor) {
    SnackBar sb;
    if (bachelor.liked) {
      sb = const SnackBar(
        content: Text("You have liked this person!"),
        backgroundColor: Colors.green,
      );
    } else {
      sb = const SnackBar(
        content: Text("You no longer like this person!"),
        backgroundColor: Colors.red,
      );
    }

    return sb;
  }
}

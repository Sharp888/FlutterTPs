import 'package:flutter/material.dart';

import 'bachelor.dart';
import 'e_gender.dart';

class BachelorDetailsPage extends StatefulWidget {
  final Bachelor bachelor;
  const BachelorDetailsPage({Key? key, required this.bachelor})
      : super(key: key);

  // const BachelorDetailsPage({super.key, required Bachelor bachelor});

  @override
  State<BachelorDetailsPage> createState() => _BachelorDetailsPageState();
}

class _BachelorDetailsPageState extends State<BachelorDetailsPage> {
  bool _isLiked = false;
  // Bachelor bachelor = widget.bachelor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 128, 165),
      appBar: AppBar(
        title: const Text('Profile Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Image.asset(widget.bachelor.avatar),
                ),
                Center(
                  child: GestureDetector(
                    onTap: _interest,
                    child: Icon(
                      Icons.favorite,
                      size: 100,
                      color: _isLiked
                          ? Colors.red
                          : const Color.fromRGBO(189, 189, 189, 0.5),
                    ),
                  ),
                )
              ],
            ),
            Text("${widget.bachelor.firstName} ${widget.bachelor.lastName}"),
            Text("Gender Identity: ${GenderText(widget.bachelor.gender)}"),

            // Add more details here...
          ],
        ),
      ),
    );
  }

  String GenderText(Gender gender) {
    if (gender == Gender.male) {
      return "Man";
    } else {
      return "Woman";
    }
  }

  void _interest() {
    setState(() {
      _isLiked = !_isLiked;
      final sm = ScaffoldMessenger.of(context);

      SnackBar sb;
      if (_isLiked) {
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

      sm.hideCurrentSnackBar();
      sm.showSnackBar(sb);
    });
  }
}

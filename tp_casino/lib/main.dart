import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const CasinoApp());
}

class CasinoApp extends StatelessWidget {
  const CasinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP Casino',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(title: 'Casino'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _winCheck = false;
  int gameElement1 = -1;
  int gameElement2 = -1;
  int gameElement3 = -1;

  List<Widget> decideBodyElements(int element1, int element2, int element3) {
    List<Widget> toReturn = [];

    toReturn.add(Container(
        margin: const EdgeInsets.all(50.0),
        child: Row(
          children: [
            Flexible(child: decideImage(element1)),
            Flexible(child: decideImage(element2)),
            Flexible(child: decideImage(element3)),
          ],
        )));

    toReturn.add(decideText(element1, element2, element3));

    return toReturn;
  }

  Text decideText(int element1, int element2, int element3) {
    if (element1 <= 0) {
      return const Text("Press the button to begin the game! ",
          style: TextStyle(
            fontSize: 30,
          ));
    }

    bool check = (element1 == element2) && (element2 == element3);

    if (check) {
      return const Text("Jackpot !!!",
          style: TextStyle(
            fontSize: 40,
          ));
    } else {
      return const Text(
        "Try again...",
        style: TextStyle(
          fontSize: 25,
        ),
      );
    }
  }

  Widget decideImage(int x) {
    //retour Widget et pas Image pour pouvoir retourner une image vide
    switch (x) {
      case 1:
        return Image.asset('assets/images/bar.png');
      case 2:
        return Image.asset('assets/images/cerise.png');
      case 3:
        return Image.asset('assets/images/cloche.png');
      case 4:
        return Image.asset('assets/images/diamant.png');
      case 5:
        return Image.asset('assets/images/fer-a-cheval.png');
      case 6:
        return Image.asset('assets/images/pasteque.png');
      case 7:
        return Image.asset('assets/images/sept.png');
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
          child: Container(
        color: _winCheck ? Colors.yellow[400] : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              decideBodyElements(gameElement1, gameElement2, gameElement3),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _winCheck ? _test : _play,
        tooltip: _winCheck ? 'Replay!' : 'Roll!',
        child: const Icon(Icons.autorenew),
      ),
    );
  }

  void _play() {
    setState(() {
      Random rnd = Random();
      gameElement1 = rnd.nextInt(6) + 1;
      gameElement2 = rnd.nextInt(6) + 1;
      gameElement3 = rnd.nextInt(6) + 1;
      _winCheck =
          (gameElement1 == gameElement2) && (gameElement2 == gameElement3);
    });
  }

  void _test() {
    setState(() {
      gameElement1 = -1;
      gameElement2 = -1;
      gameElement3 = -1;
      _winCheck = false;
    });
  }
}

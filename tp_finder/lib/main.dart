import 'package:flutter/material.dart';

// import 'models/bachelor.dart';
import 'models/bachelor.dart';
import 'models/bachelor_details.dart';
import 'models/bachelor_manager.dart';

void main() {
  runApp(const FinderApp());
}

class FinderApp extends StatelessWidget {
  const FinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finder App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 230, 110, 55)),
        useMaterial3: true,
      ),
      home: MainPage(title: 'Flutter Demo Home Page'),
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
  void _buttonClick() {
    setState(() {
      print("check");
    });
  }

  void _detailsClick(Bachelor currentBachelor) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BachelorDetailsPage(bachelor: currentBachelor),
        ),
      );
    });
  }

  BachelorManager bm = BachelorManager();

  @override
  Widget build(BuildContext context) {
    bm.generate30Bachelors();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: bm.currentBachelors.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: decideColor(index),
            child: GestureDetector(
              onTap: () => _detailsClick(bm.currentBachelors[index]),
              child: Row(
                children: [
                  Image.asset(bm.currentBachelors[index].avatar),
                  Text(bm.currentBachelors[index].firstName),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _buttonClick,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Color decideColor(int value) {
    if (value % 2 == 0) {
      return const Color.fromRGBO(0, 188, 212, 1);
    } else {
      return const Color.fromRGBO(63, 81, 181, 1);
    }
  }
}

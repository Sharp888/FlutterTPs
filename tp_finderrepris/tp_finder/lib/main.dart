import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
// import 'models/bachelor.dart';
import 'models/bachelor.dart';
import 'models/bachelor_details.dart';
import 'models/bachelor_manager.dart';
import 'models/bachelor_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (BuildContext context) => BachelorProvider(),
        child: const FinderApp()),
  );
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
      home: const MainPage(title: 'Finder App'),
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
    setState(() {});
  }

  void _detailsClick(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BachelorDetailsPage(index: index),
      ),
    );
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
      body: Consumer<BachelorProvider>(
        builder: (context, BachelorProvider bachelorProvider, child) =>
            ListView.builder(
          itemCount: bachelorProvider.bachelors.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: decideColor(index, bachelorProvider.bachelors[index]),
              child: GestureDetector(
                onTap: () => _detailsClick(index),
                child: Row(
                  children: [
                    Image.asset(bachelorProvider.bachelors[index].avatar),
                    Text(bachelorProvider.bachelors[index].firstName),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _buttonClick,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Color decideColor(int value, Bachelor bachelor) {
    if (bachelor.liked) {
      return Color.fromARGB(255, 241, 59, 226);
    } else if (value % 2 == 0) {
      return const Color.fromRGBO(0, 188, 212, 1);
    } else {
      return const Color.fromRGBO(63, 81, 181, 1);
    }
  }
}

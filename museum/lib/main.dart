import 'package:flutter/material.dart';

void main() {
  runApp(MuseumApp());
}

class MuseumApp extends StatelessWidget {
  MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Museum(MuseumApp Title)',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Artwork(),
    );
  }
}

class Artwork extends StatefulWidget {
  const Artwork({Key? key}) : super(key: key);

  @override
  State<Artwork> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorited = false;
  bool _showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Museum'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                    child: Image.asset(
                  'assets/images/Mona_Lisa.jpg',
                )),
                Center(
                  // ignore: prefer_const_constructors
                  child: Icon(
                    Icons.favorite,
                    color: _isFavorited
                        ? Colors.red
                        : Color.fromRGBO(189, 189, 189, 0.5),
                    size: 100,
                  ),
                ),
                Container(
                    width: 300,
                    height: 350,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                          "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 1516, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. \n \n La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                          style: TextStyle(
                              color: _showDescription
                                  ? const Color.fromARGB(255, 255, 254, 254)
                                  : const Color.fromARGB(0, 255, 255, 255))),
                    ))
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Mona Lisa',
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Merriweather',
                // ignore: prefer_const_constructors
                color: Color.fromRGBO(62, 39, 35, 1),
              ),
            ),
            // ignore: prefer_const_constructors
            Text('de Leonard De Vinci',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Merriweather',
                  fontWeight: FontWeight.bold,
                  // ignore: prefer_const_constructors
                  color: Color.fromRGBO(62, 39, 35, 1),
                )),
            const SizedBox(height: 15),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _toggleDescription,
                    child: const Icon(
                      Icons.article,
                      color: Color.fromRGBO(62, 39, 35, 1),
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 30), // Add spacing between the icons
                  GestureDetector(
                    onTap: _toggleFavorite,
                    child: Icon(
                      Icons.favorite,
                      size: 30,
                      color: _isFavorited
                          ? Colors.red
                          : const Color.fromRGBO(62, 39, 35, 1),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  void _toggleDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }
}

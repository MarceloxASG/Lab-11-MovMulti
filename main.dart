// EJEMPLO 01

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Card(
//         child: Text('This is a card'),
//         color: Colors.red,
//         margin: EdgeInsets.all(64.0),
//         elevation: 8,
//         borderOnForeground: false,
//         shadowColor: Colors.blue,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//       ),
//     );
//   }
// }

// EJEMPLO 02

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Color defaultBackgroundColor = Colors.grey.withOpacity(0.2);

  final List<CardData> cardDataList = [
    CardData(
      title: 'Fútbol',
      description: 'El mejor equipo de todos los tiempos',
      imagePath: 'images/futbol.jpg',
    ),
    CardData(
      title: 'Atletismo',
      description: 'Hora de correr',
      imagePath: 'images/atletismo.jpg',
    ),
    CardData(
      title: 'Boxeo',
      description: 'Peleitas entre 2 personas',
      imagePath: 'images/box.jpg',
    ),
    CardData(
      title: 'Golf',
      description: 'Golpear para intentar un hoyo en 1',
      imagePath: 'images/golf.jpg',
    ),
    CardData(
      title: 'Hockey',
      description: 'Ese disco negro es muy pegriloso',
      imagePath: 'images/hockey.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Card Widget Example'),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: cardDataList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CardWidget(
                  title: cardDataList[index].title,
                  description: cardDataList[index].description,
                  imagePath: cardDataList[index].imagePath,
                  backgroundColor: defaultBackgroundColor,
                ),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color backgroundColor;

  const CardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        color: backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9, // Con esto se podra visualizar las imagenes a medida que se agrande la pantalla
              child: Image.asset( 
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
            ),
          ],
        ),
      ),
    );
  }
}

class CardData {
  final String title;
  final String description;
  final String imagePath;

  CardData({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

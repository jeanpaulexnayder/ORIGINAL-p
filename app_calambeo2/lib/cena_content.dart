import 'package:flutter/material.dart';

class cenacontent extends StatefulWidget {
  @override
  _cenaContentState createState() => _cenaContentState();
}

class _cenaContentState extends State<cenacontent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cena - Ancon Tesorito'),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresa a la página anterior
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Fondo principal
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fondo_restaurante.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                // Portada y foto redonda
                _buildHeader(context),
                SizedBox(height: 20),
                // Información del negocio
                _buildBusinessInfo(),
                SizedBox(height: 20),
                // Galería de platos
                _buildGallery(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/visitante_tesorito2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 0, // Cambié a 0 para que no se corte el círculo
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/logot.jpg'),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBusinessInfo() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      color: Colors.white.withOpacity(0.8), // Fondo semitransparente
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Información del Restaurante',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '"Mirador Ancón Tesorito" es el lugar ideal para vivir noches inolvidables bajo un cielo estrellado. Su ambiente mágico, realzado por luces cálidas y la espectacular vista panorámica de los paisajes tolimenses iluminados, crea un escenario perfecto para una cena especial. Disfruta de su exquisita gastronomía que combina sabores locales y contemporáneos, mientras el sonido de la naturaleza y una suave brisa nocturna envuelven tus sentidos. Ya sea para una velada romántica, una reunión con amigos o simplemente un momento de tranquilidad, Ancón Tesorito promete una experiencia única que quedará grabada en tu memoria.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGallery() {
    final List<String> images = [
      'assets/cena2.jpg',
      'assets/bebida1.jpg',
      'assets/pumpe.jpg',
      'assets/bebida3.jpg',
      'assets/cena1.jpg',
      'assets/bebida2.jpg',
      'assets/plato6.jpg',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Galería de Platos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                width: 150,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

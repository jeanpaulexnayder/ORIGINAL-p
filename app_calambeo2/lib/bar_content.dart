import 'package:flutter/material.dart';

class bar_content extends StatefulWidget {
  @override
  _barContentState createState() => _barContentState();
}

class _barContentState extends State<bar_content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar - Ancon Tesorito'),
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
            backgroundImage: AssetImage('assets/logotesorito.jpg'),
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
              '"Mirador Ancón Tesorito" también se transforma en un bar único para disfrutar las noches de Ibagué como nunca antes. Con una selección exclusiva de cócteles artesanales, cervezas locales y bebidas premium, este espacio ofrece el equilibrio perfecto entre diversión y relajación. Sumérgete en un ambiente vibrante con música en vivo o DJ sets que complementan la atmósfera, mientras disfrutas de las impresionantes vistas nocturnas desde su mirador. Ya sea para celebrar con amigos, disfrutar de una cita especial o desconectar del día a día, el bar de Ancón Tesorito te invita a vivir una experiencia que combina buena música, excelente bebida y un entorno inigualable.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGallery() {
    final List<String> images = [
      'assets/Bar1.jpg',
      'assets/Bar2.jpg',
      'assets/Bar3.jpg',
      'assets/Bar4.jpg',
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
